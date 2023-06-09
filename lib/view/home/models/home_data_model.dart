class PodcastCategory{
  String? title;
  PodcastCategory(this.title);
}

class Podcast{
  String? userImage;
  String? podcastName;
  String? othorName;
  bool? playing;
  bool? isFavourite;
  Podcast(this.userImage,this.podcastName,this.othorName,this.playing,this.isFavourite);
}