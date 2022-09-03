const TWEET_SIZE = 12;

List<String> getTweets(String tweet) {
  // split
  int end = 0;
  List<String> tweets_list = [];
  // if (tweet.length < TWEET_SIZE) {
  //   return [tweet];
  // }
  String temp_tweet = tweet;
  int offset = 0;
  while (temp_tweet.length > TWEET_SIZE) {
    end = _getNextIndex(temp_tweet);
    offset = temp_tweet[0] == " " ? 1 : 0;
    tweets_list.add(temp_tweet.substring(offset, end));
    temp_tweet = temp_tweet.substring(end + offset);
  }
  tweets_list.add(temp_tweet);
  return tweets_list;
}

int _getNextIndex(String tweet) {
  int base = 0;
  // print("Getting next index...");
  if (tweet.length < TWEET_SIZE) {
    return base + tweet.length;
  }
  int curr = base + TWEET_SIZE;
  String temp = "";
  while (curr > base) {
    temp = tweet[curr];
    if (temp == " ") {
      return curr;
    }
    curr--;
    // print(curr);
  }

  return 0;
}

// function findSpaceBeforeTWEET_SIZE(tweet){
//   let tweetArray = tweet.split(' ');
//   let tweets = []
//   let temp_tweet = "";
//   for(i=0; i<tweetArray.length;i++){
//     if(temp_tweet.length+tweetArray[i].length+1 > TWEET_SIZE){
//       tweets.push(temp_tweet);
//       temp_tweet = "";
//     }
//     temp_tweet+= " " + tweetArray[i];
//   }
//   if(temp_tweet!=""){
//     tweets.push(temp_tweet);
//   }
//   return tweets;
// }

// function createTweetBoxes(tweetArray){
//   let tempDiv;
//   let tempHeaderDiv;
//   let i = 1;
//   tweetArray.forEach(tweetPart => {
//   tempDiv = document.createElement("div");
//   tempHeaderDiv = document.createElement("div");
//
//   tempHeaderDiv.classList.add("tweetHeader");
//   tempHeaderDiv.innerHTML="Tweet " + i++;
//
//   tempDiv.id = "tweetBox";
//   tempDiv.innerHTML = tempHeaderDiv.outerHTML + tweetPart;
//   TWEET_BOXES.appendChild(tempDiv);
//   console.log(tempDiv);
//   tempHeaderDiv.remove();
//   // CreateButton(tweetPart,TWEET_BOXES);
//   tempDiv.onclick = ()=>{
//   document.execCommand("copy");
//   }
//
//   tempDiv.addEventListener("copy", evt=>{
//   evt.preventDefault();
//   console.log(tempDiv.textContent);
//   if (evt.clipboardData) {
//   evt.clipboardData.setData("text/plain",tweetPart);
//   console.log(evt.clipboardData.getData("text"));
//   }
//   });
//   });
// }
