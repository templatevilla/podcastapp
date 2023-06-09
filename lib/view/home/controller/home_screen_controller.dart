import 'package:get/get.dart';
import 'package:listen_podcast_app/view/home/models/home_data_model.dart';

class HomeScreenController extends GetxController{
  int currentCategory = 0;
  Podcast? currentPodcast;
  void setCategory(int index) {
    currentCategory = index;
    update();
  }

  void setPodcastPlaying(Podcast data) {
    if(data.playing!){
      data.playing = false;
    }
    else{
      data.playing = true;
    }
    update();
  }

  void setCurrentPodcast(Podcast data) {
    currentPodcast=data;
    update();
  }

  void setFavouritePos(Podcast data) {
    if(data.isFavourite!){
      data.isFavourite = false;
    }
    else{
      data.isFavourite = true;
    }
    update();
  }

}