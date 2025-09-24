// home_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:logistics_manager_app/core/data/enums/trip_status.dart';
import 'package:logistics_manager_app/core/data/enums/vehicle_type.dart';
import 'package:logistics_manager_app/core/data/model/trip_model.dart';
import 'package:logistics_manager_app/core/styling/app_colors.dart';
import 'package:logistics_manager_app/core/styling/app_styles.dart';
import 'package:logistics_manager_app/features/home/widgets/custom_trip_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final trips = [
      TripModel(
        id: 1,
        assignedDriver: 'John Doe',
        assignedVehicle: 'Truck A',
        pickupLocation: 'Warehouse A',
        dropoffLocation: 'Store B',
        status: TripStatus.inProgress,
        vehicleType: VehicleType.truck,
      ),
      TripModel(
        id: 2,
        assignedDriver: 'Jane Smith',
        assignedVehicle: 'Van X',
        pickupLocation: 'Depot 1',
        dropoffLocation: 'Customer Y',
        status: TripStatus.pending,
        vehicleType: VehicleType.van,
      ),
      TripModel(
        id: 3,
        assignedDriver: 'Mike Johnson',
        assignedVehicle: 'Car Z',
        pickupLocation: 'Branch C',
        dropoffLocation: 'Main Office',
        status: TripStatus.completed,
        vehicleType: VehicleType.car,
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text("Trips", style: AppStyles.head),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60.h),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: Container(
              height: 50.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search trips, drivers, locations...",
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                ),
                style: TextStyle(fontSize: 14.sp, color: Colors.black),
              ),
            ),
          ),
        ),
      ),

      body: ListView.builder(
        padding: EdgeInsets.only(bottom: 80.h),
        itemCount: trips.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (){
              GoRouter.of(context).pushNamed('/detailsScreen',extra: trips[index]);
            },
            child: CustomTripWidget(tripModel: trips[index]));
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          GoRouter.of(context).push('/tripScreen');
        },
        backgroundColor: AppColors.primaryColor,
        shape: const CircleBorder(),
        tooltip: "Add New Trip",
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
