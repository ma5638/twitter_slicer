import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'services.dart';

void main() {
  runApp(const MyApp());
  // print(getTweets("Help"));
  // print(getTweets("HelpA HelpB HelpC HelpD HelpE HelpF"));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Twitter Slicer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Twitter Slicer'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController tweetController = TextEditingController();

  List<String> tweets_list = [];
  int num_tweets = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: num_tweets + 3,
            itemBuilder: (buildContext, index) {
              if (index == 0) {
                return TextField(
                  controller: tweetController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter tweet:',
                  ),
                  keyboardType: TextInputType.multiline,
                  minLines: 4,
                  maxLines: null,
                );
              } else if (index == 1) {
                return ElevatedButton(
                  onPressed: () {
                    setState(() {
                      tweets_list = getTweets(tweetController.text);
                      num_tweets = tweets_list.length;
                    });
                  },
                  child: const Text("Slice"),
                );
              } else if (index == 2) {
                return const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Divisions: (Tap to Copy)"),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Clipboard.setData(
                          ClipboardData(text: tweets_list[index - 3]));
                    },
                    style: ElevatedButton.styleFrom(
                      // Foreground color
                      onPrimary: Colors.black,
                      // Background color
                      primary: Colors.white,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(tweets_list[index - 3]),
                    ),
                  ),
                  // child: GestureDetector(
                  //   onTap: () {
                  //     Clipboard.setData(
                  //         ClipboardData(text: tweets_list[index - 3]));
                  //   },
                  //   child: Card(
                  //     child: Padding(
                  //       padding: const EdgeInsets.all(15.0),
                  //       child: Text(tweets_list[index - 3]),
                  //     ),
                  //   ),
                  // ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
