import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:netflixclonetask/common/colors/colors.dart';
import 'package:netflixclonetask/common/dimensions/app_dimensions.dart';
import 'package:netflixclonetask/features/home/controllers/home_controller.dart';

import '../../../models/show_info.dart' as show_info;

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  static const headers = [
    "Trending Now",
    "Documentaries",
    "Standup Comedy",
    "Family Favourites",
    "RomCom",
  ];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          scrolledUnderElevation: 10,
          elevation: 10,
          shadowColor: AppColors.black,
          surfaceTintColor: AppColors.black,
          backgroundColor: Colors.transparent,
          title: Image.asset(
            "assets/images/logos/netflix-logo-small.png",
            height: 32.h,
            width: 18.w,
          ),
          actions: [
            SvgPicture.asset(
              "assets/images/icons/name=mirror.svg",
              height: 24.h,
              width: 24.w,
              colorFilter:
                  const ColorFilter.mode(AppColors.greyLight3, BlendMode.srcIn),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: SvgPicture.asset(
                "assets/images/icons/name=user.svg",
                height: 24.h,
                width: 24.w,
              ),
            ),
          ],
        ),
        body: ref.watch(showInfosProvider).when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, trace) => Center(child: Text(error.toString())),
              data: (showInfos) {
                return Stack(
                  children: [
                    Image.network(
                      showInfos[1].show!.image!.original!,
                      height: 538.h,
                      width: AppDimensions.screenWidth.w,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      height: AppDimensions.screenHeight.h,
                      width: AppDimensions.screenWidth.w,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: FractionalOffset.topCenter,
                          end: FractionalOffset.bottomCenter,
                          colors: [
                            AppColors.black,
                            Colors.transparent,
                            AppColors.black,
                          ],
                          stops: [0.005, 0.5, 0.8],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: AppDimensions.screenHeight,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 92.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                  child: Text(
                                    "TV Shows",
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w100,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                  child: Text(
                                    "Movies",
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w100,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                  child: Text(
                                    "Categories",
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w100,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 380.h,
                            ),
                            Text(
                              "Exciting ● Reality TV ● Competition",
                              style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.w100,
                                fontSize: 15.sp,
                              ),
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  begin: FractionalOffset.topCenter,
                                  end: FractionalOffset.bottomCenter,
                                  colors: [
                                    Colors.transparent,
                                    AppColors.black,
                                  ],
                                  stops: [0.01, 0.15],
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 41.h,
                                        width: 40.w,
                                        child: Column(
                                          children: [
                                            SvgPicture.asset(
                                              "assets/images/icons/name=add.svg",
                                              width: 20.w,
                                              height: 20.h,
                                              colorFilter:
                                                  const ColorFilter.mode(
                                                      AppColors.white,
                                                      BlendMode.srcIn),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(top: 5.h),
                                              child: Text(
                                                "My List",
                                                style: TextStyle(
                                                  color: AppColors.white,
                                                  fontWeight: FontWeight.w100,
                                                  fontSize: 10.sp,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 50.w),
                                        padding: EdgeInsets.zero,
                                        width: 87.w,
                                        height: 30.h,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(2.r),
                                          color: AppColors.white,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                              "assets/images/icons/name=play.svg",
                                              height: 18.h,
                                              width: 18.w,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 5.w),
                                              child: Text(
                                                "Play",
                                                style: TextStyle(
                                                  color: AppColors.black,
                                                  fontSize: 12.sp,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 41.h,
                                        width: 40.w,
                                        child: Column(
                                          children: [
                                            SvgPicture.asset(
                                              "assets/images/icons/name=info.svg",
                                              width: 20.w,
                                              height: 20.h,
                                              colorFilter:
                                                  const ColorFilter.mode(
                                                      AppColors.white,
                                                      BlendMode.srcIn),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(top: 5.h),
                                              child: Text(
                                                "Info",
                                                style: TextStyle(
                                                  color: AppColors.white,
                                                  fontWeight: FontWeight.w100,
                                                  fontSize: 10.sp,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10.w, vertical: 5.h),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Continue Watching for Ved",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            color: AppColors.white,
                                            fontSize: 16.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 188.h,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: showInfos.length,
                                      itemBuilder: (context, index) {
                                        if (showInfos[index].show == null ||
                                            showInfos[index].show!.image ==
                                                null ||
                                            showInfos[index]
                                                    .show!
                                                    .image!
                                                    .medium ==
                                                null) {
                                          return const SizedBox();
                                        } else {
                                          return Container(
                                            height: 188,
                                            width: 106,
                                            margin: (index == 0)
                                                ? EdgeInsets.fromLTRB(
                                                    10.w, 0, 5.w, 0)
                                                : EdgeInsets.symmetric(
                                                    horizontal: 10.w),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(4.r),
                                              color: AppColors.black,
                                            ),
                                            child: Column(
                                              children: [
                                                Stack(
                                                  alignment: Alignment.center,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topRight: Radius
                                                                  .circular(
                                                                      4.r),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      4.r)),
                                                      child: Image.network(
                                                        showInfos[index]
                                                            .show!
                                                            .image!
                                                            .medium!,
                                                        height: 152.h,
                                                        width: 106.w,
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                    SvgPicture.asset(
                                                      "assets/images/icons/name=play-large.svg",
                                                      height: 54.h,
                                                      width: 54.w,
                                                    ),
                                                    SizedBox(
                                                      height: 152.h,
                                                      width: 106.w,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        3.w,
                                                                    vertical:
                                                                        3.h),
                                                            child: Image.asset(
                                                              "assets/images/logos/netflix-logo-small.png",
                                                              height: 20.h,
                                                              width: 10.w,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 5.w),
                                                  height: 33.h,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      SvgPicture.asset(
                                                        "assets/images/icons/name=info.svg",
                                                        height: 20.h,
                                                        width: 20.w,
                                                        colorFilter:
                                                            const ColorFilter
                                                                .mode(
                                                          AppColors.greyLight1,
                                                          BlendMode.srcIn,
                                                        ),
                                                      ),
                                                      SvgPicture.asset(
                                                        "assets/images/icons/name=more.svg",
                                                        height: 20.h,
                                                        width: 20.w,
                                                        colorFilter:
                                                            const ColorFilter
                                                                .mode(
                                                          AppColors.greyLight1,
                                                          BlendMode.srcIn,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: headers.length * 200.h,
                                    child: ListView.builder(
                                      padding: EdgeInsets.zero,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: headers.length,
                                      itemBuilder: (context, ind) {
                                        return ContentRow(
                                          showInfos: showInfos,
                                          header: headers[ind],
                                          ind: ind,
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
      ),
    );
  }
}

class ContentRow extends StatelessWidget {
  const ContentRow({
    required this.showInfos,
    required this.header,
    required this.ind,
    super.key,
  });

  final List<show_info.ShowInfo> showInfos;
  final String header;
  final int ind;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(10.w, 15.h, 10.w, 5.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                header,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 16.sp,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 152.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: showInfos.length,
            itemBuilder: (context, index) {
              index = (index + (ind + 1) * 3) % showInfos.length;
              if (showInfos[index].show == null ||
                  showInfos[index].show!.image == null ||
                  showInfos[index].show!.image!.medium == null) {
                return const SizedBox();
              } else {
                return Container(
                  height: 152,
                  width: 106,
                  margin: (index == 0)
                      ? EdgeInsets.fromLTRB(10.w, 0, 5.w, 0)
                      : EdgeInsets.symmetric(horizontal: 10.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4.r),
                        child: Image.network(
                          showInfos[index].show!.image!.medium!,
                          height: 152.h,
                          width: 106.w,
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(
                        height: 152.h,
                        width: 106.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 3.w, vertical: 3.h),
                              child: Image.asset(
                                "assets/images/logos/netflix-logo-small.png",
                                height: 20.h,
                                width: 10.w,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
