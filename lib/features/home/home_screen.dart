import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:logistics_manager_app/core/data/model/trip_model.dart';
import 'package:logistics_manager_app/core/styling/app_colors.dart';
import 'package:logistics_manager_app/core/styling/app_styles.dart';
import 'package:logistics_manager_app/features/home/widgets/custom_trip_widget.dart';
import 'package:logistics_manager_app/features/home/data/db_helper/db_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TripModel> trips = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchTrips();
  }

  Future<void> fetchTrips() async {
    trips = await DbHelper().getTrips();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                  contentPadding: EdgeInsets.symmetric(vertical: 14.h),
                ),
                style: TextStyle(fontSize: 14.sp, color: Colors.black),
              ),
            ),
          ),
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : trips.isEmpty
          ? const Center(child: Text("No trips found."))
          : ListView.builder(
              padding: EdgeInsets.only(bottom: 80.h),
              itemCount: trips.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    GoRouter.of(
                      context,
                    ).pushNamed('/detailsScreen', extra: trips[index]);
                  },
                  child: CustomTripWidget(tripModel: trips[index]),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await GoRouter.of(context).push('/tripScreen');
          fetchTrips();
        },
        backgroundColor: AppColors.primaryColor,
        shape: const CircleBorder(),
        tooltip: "Add New Trip",
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
