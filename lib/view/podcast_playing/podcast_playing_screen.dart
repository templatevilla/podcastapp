import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:listen_podcast_app/util/icons.dart';
import 'package:listen_podcast_app/util/images.dart';
import 'package:listen_podcast_app/view/home/controller/home_screen_controller.dart';

import '../../generated/l10n.dart';
import '../../util/color_category.dart';
import '../../util/constant.dart';
import '../../util/constant_widget.dart';
import '../home/models/home_data_model.dart';

class PodcastPlayingScreen extends StatefulWidget {
  const PodcastPlayingScreen({Key? key}) : super(key: key);

  @override
  State<PodcastPlayingScreen> createState() => _PodcastPlayingScreenState();
}

class _PodcastPlayingScreenState extends State<PodcastPlayingScreen> {
  HomeScreenController homeScreenController = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    Constant.setupSize(context);
    Podcast data = homeScreenController.currentPodcast!;
    return WillPopScope(
      onWillPop: () async {
        Constant.backToPrev(context);
        return false;
      },
      child: Scaffold(
        backgroundColor: bgColor,
        body: SafeArea(
            child: GetBuilder<HomeScreenController>(
          init: HomeScreenController(),
          builder: (controller) => Column(
            children: [
              getVerSpace(16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Constant.backToPrev(context);
                      },
                      child: getSvgImage(GetIcons.arrowBackIcon,
                          height: 24.h, width: 24.h)),
                  getCustomFont(
                      S.of(context).nowPlaying, 24.sp, regularBlack, 1,
                      fontWeight: FontWeight.w700),
                  GestureDetector(
                      onTap: () {
                        controller.setFavouritePos(data);
                      },
                      child: getSvgImage(
                          data.isFavourite!
                              ? GetIcons.heartFillIcon
                              : GetIcons.heartUnselectedIcon,
                          height: 24.h,
                          width: 24.h))
                ],
              ).paddingSymmetric(horizontal: 20.h),
              getVerSpace(60.h),
              Container(
                  height: 368.h,
                  width: 368.h,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(16.h)),
                  child: getAssetImage(GetImages.playingUserImage,
                      boxFit: BoxFit.fill)),
              getVerSpace(24.h),
              getCustomFont(data.podcastName!, 26.sp, regularBlack, 1,
                  fontWeight: FontWeight.w700),
              getVerSpace(8.h),
              getCustomFont(data.othorName!, 14.sp, lightGray, 1,
                  fontWeight: FontWeight.w400),
              getVerSpace(81.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  getCustomFont(S.of(context).startTime, 14.sp, regularBlack, 1,
                      fontWeight: FontWeight.w500),
                  getHorSpace(8.w),
                  Expanded(
                      child: Container(
                          child: getSvgImage(GetIcons.vidioProgressIcon,
                              width: 298.w))),
                  getHorSpace(8.w),
                  getCustomFont(S.of(context).endTime, 14.sp, regularBlack, 1,
                      fontWeight: FontWeight.w500),
                ],
              ).paddingSymmetric(horizontal: 20.h),
              getVerSpace(48.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  getSvgImage(GetIcons.previousIcon, height: 40.h, width: 40.h),
                  getHorSpace(40.h),
                  GestureDetector(
                    onTap: () {
                      controller.setPodcastPlaying(data);
                    },
                    child: Container(
                      height: 80.h,
                      width: 80.h,
                      decoration: BoxDecoration(
                          color: lightPurple, shape: BoxShape.circle),
                      child: getSvgImage(
                              data.playing!
                                  ? GetIcons.vidioPauseIcon
                                  : GetIcons.vidioResumeIcon,
                              height: 48.h,
                              width: 48.h)
                          .paddingAll(16.h),
                    ),
                  ),
                  getHorSpace(40.h),
                  getSvgImage(GetIcons.nextIcon, height: 40.h, width: 40.h),
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
