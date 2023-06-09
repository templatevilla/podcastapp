import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:listen_podcast_app/util/icons.dart';
import '../../generated/l10n.dart';
import '../../routes/app_routes.dart';
import '../../util/color_category.dart';
import '../../util/constant.dart';
import '../../util/constant_widget.dart';
import '../../util/images.dart';
import 'controller/home_screen_controller.dart';
import 'model_data/home_data.dart';
import 'models/home_data_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenController homeScreenController = Get.put(HomeScreenController());
  List<PodcastCategory> category = HomeData.getCategory();
  List<Podcast> podcast = HomeData.getPodcast();

  @override
  Widget build(BuildContext context) {
    Constant.setupSize(context);
    return GetBuilder<HomeScreenController>(
        init: HomeScreenController(),
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getVerSpace(16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 76.h,
                      width: 251.h,
                      child: getMultilineCustomFont(
                          S.of(context).listenYourFavoritePodcast, 28.sp, regularBlack,
                          fontWeight: FontWeight.w700)),
                  getAssetImage(GetImages.userImage, height: 40.h, width: 40.h)
                ],
              ).paddingSymmetric(horizontal: 20.h),
              getVerSpace(24.h),
            Expanded(
              child: ListView(
                children: [
                  getAssetImage(GetImages.bannerImage)
                      .paddingSymmetric(horizontal: 20.h),
                  getVerSpace(24.h),
                  getCustomFont(S.of(context).listenPodcast, 24.sp, regularBlack, 1,
                      fontWeight: FontWeight.w700)
                      .paddingSymmetric(horizontal: 20.h),
                  getVerSpace(16.h),
                  SizedBox(
                    height: 48.h,
                    width: double.infinity,
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 10.h),
                      scrollDirection: Axis.horizontal,
                      itemCount: category.length,
                      itemBuilder: (context, index) {
                        PodcastCategory cat = category[index];
                        return GestureDetector(
                          onTap: () {
                            controller.setCategory(index);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.h),
                                border: Border.all(
                                    color: controller.currentCategory == index
                                        ? regularBlack
                                        : borderColor)),
                            child: Center(child: getCustomFont(
                                cat.title!,
                                16.sp,
                                controller.currentCategory == index
                                    ? regularBlack
                                    : lightGray,
                                1,
                                fontWeight: controller.currentCategory == index
                                    ? FontWeight.w700
                                    : FontWeight.w400,textAlign: TextAlign.center).paddingSymmetric(horizontal: 16.h))

                          ).paddingSymmetric(horizontal: 8.h),
                        );
                      },
                    ),
                  ),
                  getVerSpace(24.h),
                  ListView.builder(padding: EdgeInsets.symmetric(horizontal: 20.h),itemCount: podcast.length,primary: false,
                      shrinkWrap: true,itemBuilder: (context, index) {
                      Podcast data = podcast[index];
                        return GestureDetector(
                          onTap: (){
                            controller.setCurrentPodcast(data);
                            Constant.sendToNext(context, Routes.podcastPlayingScreenRoute);
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.h),
                                 color: grayContainer),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                              Row(
                                children: [
                                  getAssetImage(data.userImage!,height: 48.h,width: 48.h),
                                  getHorSpace(16.h),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      getCustomFont(data.podcastName!, 18.sp, regularBlack, 1,fontWeight: FontWeight.w700),
                                      getVerSpace(4.h),
                                      getCustomFont(data.othorName!, 14.sp, lightGray, 1,fontWeight: FontWeight.w400),
                                    ],
                                  )
                                ],
                              ),
                                GestureDetector(
                                  onTap: (){
                                    controller.setPodcastPlaying(data);
                                  },
                                  child: Container(
                                    height: 40.h,
                                    width: 40.h,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: lightPurple
                                    ),
                                    child: getSvgImage(data.playing!?GetIcons.vidioPauseIcon:GetIcons.vidioResumeIcon,height: 24.h,width: 24.h).paddingAll(8.h),
                                  ),
                                )
                              ],
                            ).paddingAll(16.h),
                          ).paddingSymmetric(vertical: 8.h),
                        );
                      },),
                  getVerSpace(8.h),
                ],
              ),
            )
            ],
          );
        });
  }
}
