import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../features/details/screens/details_screen.dart';
import '../../models/show_info.dart' as show_info;
import '../navigators/navigators.dart';

class ShowCard extends StatelessWidget {
  const ShowCard({
    super.key,
    required this.showInfo,
    required this.index,
  });

  final show_info.ShowInfo showInfo;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => AppNavigators.animatedPush(
        context,
        DetailsScreen(showInfo: showInfo),
      ),
      child: Container(
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
                showInfo.show!.image!.medium!,
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
                    padding:
                        EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
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
      ),
    );
  }
}
