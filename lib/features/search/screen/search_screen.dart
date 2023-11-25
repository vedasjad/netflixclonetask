import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:netflixclonetask/common/colors/colors.dart';
import 'package:netflixclonetask/features/details/screens/details_screen.dart';
import 'package:netflixclonetask/features/search/screen/search_result_screen.dart';
import 'package:netflixclonetask/models/show_info.dart' as show_info;

import '../../../common/navigators/navigators.dart';
import '../../home/controllers/home_controller.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: SearchBar(
          textStyle: const MaterialStatePropertyAll(
            TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.w100,
            ),
          ),
          onSubmitted: (searchTerm) => (searchTerm.isNotEmpty)
              ? AppNavigators.animatedPush(
                  context,
                  SearchResultScreen(searchTerm: searchTerm),
                )
              : (),
          leading: Padding(
            padding: EdgeInsets.only(top: 3.h),
            child: SvgPicture.asset(
              "assets/images/icons/name=search.svg",
              height: 16.h,
              width: 16.w,
              colorFilter:
                  const ColorFilter.mode(AppColors.grey, BlendMode.srcIn),
            ),
          ),
          hintText: "Search",
          hintStyle: MaterialStatePropertyAll(
            TextStyle(
              fontSize: 14.sp,
              color: AppColors.grey,
              fontWeight: FontWeight.w100,
            ),
          ),
          constraints: BoxConstraints(
            minHeight: 28.h,
            minWidth: 365.w,
            maxHeight: 28.h,
            maxWidth: 365.w,
          ),
          shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r))),
          backgroundColor: const MaterialStatePropertyAll(AppColors.greyDark2),
        ),
      ),
      body: ref.watch(showInfosProvider).when(
            loading: () => const Center(
                child: CircularProgressIndicator(
              color: AppColors.red,
            )),
            error: (error, trace) => Center(child: Text(error.toString())),
            data: (showInfos) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15.w, bottom: 15.h),
                      child: Text(
                        "Movies & TV",
                        style: TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.w100,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 74.h * showInfos.length,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: showInfos.length,
                        itemBuilder: (context, index) {
                          if (showInfos[index].show == null ||
                              showInfos[index].show!.image == null ||
                              showInfos[index].show!.image!.medium == null) {
                            return const SizedBox();
                          } else {
                            return TopSearchedShowView(
                              showInfo: showInfos[index],
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
    );
  }
}

class TopSearchedShowView extends StatelessWidget {
  const TopSearchedShowView({
    required this.showInfo,
    super.key,
  });

  final show_info.ShowInfo showInfo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => AppNavigators.animatedPush(
          context, DetailsScreen(showInfo: showInfo)),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5.h),
        height: 54.h,
        width: 359.w,
        child: ListTile(
          leading: Container(
            height: 54.h,
            width: 96.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4.r),
              child: Stack(
                children: [
                  Image.network(
                    showInfo.show!.image!.medium!,
                    height: 54.h,
                    width: 96.w,
                    fit: BoxFit.fitWidth,
                  ),
                  (showInfo.show!.name![4] == "R" ||
                          showInfo.show!.name![4] == "W" ||
                          showInfo.show!.name![4] == "T")
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SvgPicture.asset(
                              "assets/images/logos/top-10.svg",
                              height: 16.h,
                              width: 11.w,
                            ),
                          ],
                        )
                      : const SizedBox(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 3.w, vertical: 3.h),
                        child: Image.asset(
                          "assets/images/logos/netflix-logo-small.png",
                          height: 15.h,
                          width: 10.w,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                  (showInfo.show!.name![4] == "A")
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 3.h),
                              child: SvgPicture.asset(
                                "assets/images/logos/new-episodes.svg",
                                height: 11.h,
                                width: 160.w,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ),
          minLeadingWidth: 96.w,
          title: Text(
            showInfo.show!.name!,
            style: TextStyle(
              color: AppColors.grey,
              fontWeight: FontWeight.w700,
              fontSize: 14.sp,
            ),
          ),
          trailing: SvgPicture.asset(
            "assets/images/icons/name=play-search.svg",
            height: 32.h,
            width: 32.w,
          ),
        ),
      ),
    );
  }
}
