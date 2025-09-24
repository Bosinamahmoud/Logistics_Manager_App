import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logistics_manager_app/core/data/enums/trip_status.dart';
import 'package:logistics_manager_app/core/data/enums/vehicle_type.dart';
import 'package:logistics_manager_app/core/data/model/trip_model.dart';
import 'package:logistics_manager_app/core/styling/app_colors.dart';
import 'package:logistics_manager_app/core/styling/app_styles.dart';
import 'package:logistics_manager_app/features/home/widgets/location_info_widget.dart';

class CustomTripWidget extends StatelessWidget {
  final TripModel tripModel;
  const CustomTripWidget({super.key, required this.tripModel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320.w,
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('#${tripModel.id}', style: AppStyles.subHead),
                  Chip(
                    label: Text(
                      tripModel.status.label,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    backgroundColor: tripModel.status.color,
                  ),
                ],
              ),
              SizedBox(height: 10.h),

              Text(
                'Driver: ${tripModel.assignedDriver}',
                style: AppStyles.subHead,
              ),

              Row(
                children: [
                  Icon(VehicleTypeExt(tripModel.vehicleType).icon, size: 20.sp),
                  SizedBox(width: 8.w),
                  Text(
                    '${VehicleTypeExt(tripModel.vehicleType).displayName} - ${tripModel.assignedVehicle}',
                    style: TextStyle(fontSize: 14.sp),
                  ),
                ],
              ),

              Column(
                children: [
                  LocationInfo(
                    title: 'Pickup',
                    location: tripModel.pickupLocation,
                    iconColor: AppColors.primaryColor,
                  ),
                  SizedBox(height: 10.h),
                  LocationInfo(
                    title: 'Drop-off',
                    location: tripModel.dropoffLocation,
                    iconColor: Colors.green,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
