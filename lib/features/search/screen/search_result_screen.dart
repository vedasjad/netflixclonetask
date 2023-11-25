import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:netflixclonetask/common/dimensions/app_dimensions.dart';
import 'package:netflixclonetask/common/widgets/show_card.dart';
import 'package:netflixclonetask/features/search/controllers/search_controller.dart';

import '../../../common/colors/colors.dart';
import '../../../common/navigators/navigators.dart';

class SearchResultScreen extends ConsumerStatefulWidget {
  const SearchResultScreen({required this.searchTerm, super.key});
  final String searchTerm;
  @override
  ConsumerState<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends ConsumerState<SearchResultScreen> {
  TextEditingController searchTermEditingController = TextEditingController();

  @override
  void initState() {
    searchTermEditingController =
        TextEditingController(text: widget.searchTerm);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        foregroundColor: AppColors.grey,
        backgroundColor: Colors.transparent,
        title: SearchBar(
          controller: searchTermEditingController,
          textStyle: const MaterialStatePropertyAll(
            TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.w100,
            ),
          ),
          onSubmitted: (searchTerm) => AppNavigators.animatedPush(
            context,
            SearchResultScreen(searchTerm: searchTerm),
          ),
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
      body: ref.watch(searchedShowsProvider(widget.searchTerm)).when(
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
                    SizedBox(
                      height: AppDimensions.screenHeight,
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: showInfos.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 106.w / 152.h,
                        ),
                        itemBuilder: (context, index) {
                          if (showInfos[index].show == null ||
                              showInfos[index].show!.image == null ||
                              showInfos[index].show!.image!.medium == null) {
                            return const SizedBox();
                          } else {
                            return ShowCard(
                                showInfo: showInfos[index], index: index);
                          }
                        },
                      ),
                    )
                  ],
                ),
              );
            },
          ),
    );
  }
}
