import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logistics_manager_app/core/data/enums/trip_status.dart';
import 'package:logistics_manager_app/core/data/model/trip_model.dart';

class HeaderCard extends StatelessWidget {
  final TripModel trip;
  const HeaderCard({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.white,
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Text(
              "#${trip.id}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Chip(
                    label: Text(
                      trip.status.label,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    backgroundColor: trip.status.color,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
