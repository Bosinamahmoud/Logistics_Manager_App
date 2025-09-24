import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logistics_manager_app/core/styling/app_styles.dart';

class LocationInfo extends StatelessWidget {
  final String title;
  final String location;
  final Color iconColor;

  const LocationInfo({
    super.key,
    required this.title,
    required this.location,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(Icons.location_on, color: iconColor, size: 18.sp),
        SizedBox(width: 6.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppStyles.subHead.copyWith(fontSize: 14.sp),
            ),
            SizedBox(height: 6.h),
            Text(
              location,
              style: TextStyle(
                fontSize: 13.sp,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
