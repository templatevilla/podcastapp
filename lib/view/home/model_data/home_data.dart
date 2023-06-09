import 'package:listen_podcast_app/util/images.dart';

import '../models/home_data_model.dart';

class HomeData{
  static List<PodcastCategory> getCategory(){
    return [
      PodcastCategory("Recent"),
      PodcastCategory("Topics"),
      PodcastCategory("Authors"),
      PodcastCategory("Episodes"),
    ];
  }

  static List<Podcast> getPodcast(){
    return [
      Podcast(GetImages.user1st,"The Life Is My Colourful","By Jonny Cooper",false,false),
      Podcast(GetImages.user2nd,"Now What by Wix","By Theresa Webb",false,false),
      Podcast(GetImages.user3rd,"The Good Life Project","By Kathryn Murphy",false,false),
      Podcast(GetImages.user4th,"Y Combinator Podcast","By Kristin Watson",false,false),
    ];
  }
}