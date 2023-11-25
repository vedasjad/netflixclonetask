import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:netflixclonetask/common/colors/colors.dart';
import 'package:netflixclonetask/models/show_info.dart' as show_info;

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({required this.showInfo, super.key});

  final show_info.ShowInfo showInfo;

  static const squareButtonsLabels = ["My List", "Rate", "Share"];
  static const squareButtonsSvgAssetNames = [
    "assets/images/icons/name=add.svg",
    "assets/images/icons/name=like.svg",
    "assets/images/icons/name=share.svg",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 210.h,
                width: 375.w,
                decoration: BoxDecoration(
                  color: AppColors.greyDark2,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.r),
                    topRight: Radius.circular(16.r),
                  ),
                ),
                child: Stack(
                  children: [
                    Image.network(
                      showInfo.show!.image!.original!,
                      height: 210.h,
                      width: 375.w,
                      fit: BoxFit.fitWidth,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 10.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SvgPicture.asset(
                                "assets/images/icons/name=mirror.svg",
                                height: 20.h,
                                width: 20.w,
                                colorFilter: const ColorFilter.mode(
                                    AppColors.greyLight3, BlendMode.srcIn),
                              ),
                              GestureDetector(
                                onTap: () => Navigator.pop(context),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 20.w),
                                  child: SvgPicture.asset(
                                    "assets/images/icons/name=close.svg",
                                    height: 18.h,
                                    width: 18.w,
                                    colorFilter: const ColorFilter.mode(
                                        AppColors.greyLight3, BlendMode.srcIn),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/images/icons/name=play-large-red.svg",
                                height: 54.h,
                                width: 54.w,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Trailer",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.h, left: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/logos/netflix-logo-small.png",
                          height: 15.h,
                          width: 8.w,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 7.w),
                          child: Text(
                            showInfo.show!.type!,
                            style: TextStyle(
                              letterSpacing: 3,
                              fontSize: 10.sp,
                              color: AppColors.grey,
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.h),
                      child: Text(
                        showInfo.show!.name!,
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    Row(
                      children: List.generate(
                        showInfo.show!.genres!.length,
                        (index) => Container(
                          margin: EdgeInsets.only(right: 10.w),
                          padding: EdgeInsets.symmetric(horizontal: 3.w),
                          decoration: BoxDecoration(
                            color: AppColors.grey,
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          child: Text(
                            showInfo.show!.genres![index],
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w100,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.h),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 10.w),
                            child: Text(
                              showInfo.show!.premiered!.year.toString(),
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w100,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 10.w),
                            padding: EdgeInsets.symmetric(horizontal: 3.w),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.r),
                                border: Border.all(color: AppColors.grey)),
                            child: Text(
                              showInfo.show!.language!,
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w100,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 359.w,
                height: 34.h,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(4.r),
                ),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/images/icons/name=play.svg",
                      height: 18.h,
                      width: 18.w,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Text(
                        "Play",
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: AppColors.black,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: 359.w,
                height: 34.h,
                decoration: BoxDecoration(
                  color: AppColors.greyDark2,
                  borderRadius: BorderRadius.circular(4.r),
                ),
                margin: EdgeInsets.symmetric(vertical: 10.h),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/images/icons/name=download-navigation.svg",
                      height: 18.h,
                      width: 18.w,
                      colorFilter: const ColorFilter.mode(
                          AppColors.grey, BlendMode.srcIn),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Text(
                        "Download",
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: AppColors.grey,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                child: Text(
                  showInfo.show!.summary!,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
                child: Row(
                  children: List.generate(
                    squareButtonsLabels.length,
                    (index) => SquareButton(
                      label: squareButtonsLabels[index],
                      svgAssetName: squareButtonsSvgAssetNames[index],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SquareButton extends StatelessWidget {
  const SquareButton({
    super.key,
    required this.label,
    required this.svgAssetName,
  });

  final String svgAssetName;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      height: 43.h,
      width: 40.w,
      child: Column(
        children: [
          SvgPicture.asset(
            svgAssetName,
            width: 24.w,
            height: 24.h,
            colorFilter:
                const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5.h),
            child: Text(
              label,
              style: TextStyle(
                color: AppColors.grey,
                fontWeight: FontWeight.w100,
                fontSize: 8.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
