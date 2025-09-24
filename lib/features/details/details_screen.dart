import 'package:flutter/material.dart';
import 'package:logistics_manager_app/core/data/enums/trip_status.dart';
import 'package:logistics_manager_app/core/data/model/trip_model.dart';
import 'package:logistics_manager_app/core/styling/app_colors.dart';
import 'package:logistics_manager_app/core/styling/app_styles.dart';
import 'package:logistics_manager_app/features/details/widgets/header_card.dart';
import 'package:logistics_manager_app/features/details/widgets/section_card.dart';
import 'package:logistics_manager_app/features/home/data/db_helper/db_helper.dart';

class DetailsScreen extends StatefulWidget {
  final TripModel trip;

  const DetailsScreen({super.key, required this.trip});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late TripModel trip;
  TripStatus? selectedStatus;
  @override
  void initState() {
    super.initState();
    trip = widget.trip;
    selectedStatus = trip.status;
  }

  Future<void> updateStatus() async {
    if (selectedStatus != null && selectedStatus != trip.status) {
      trip = TripModel(
        id: trip.id,
        assignedDriver: trip.assignedDriver,
        assignedVehicle: trip.assignedVehicle,
        pickupLocation: trip.pickupLocation,
        dropoffLocation: trip.dropoffLocation,
        status: selectedStatus!,
        vehicleType: trip.vehicleType,
      );
      await DbHelper().updateTrip(trip);
      setState(() {});
      Navigator.pop(context, true); 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("#${widget.trip.id}", style: AppStyles.head),
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Header
            HeaderCard(trip: widget.trip),
            const SizedBox(height: 16),

            // Driver
            SectionCard(
              title: "Driver Details",
              icon: Icons.person_outline,
              child: Text(
                widget.trip.assignedDriver,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Vehicle
            SectionCard(
              title: "Vehicle Details",
              icon: Icons.local_shipping_outlined,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Type: ${widget.trip.vehicleType.name}"),
                  Text(
                    "Vehicle ID: ${widget.trip.assignedVehicle}",
                    style: const TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Pickup
            SectionCard(
              title: "Pickup Location",
              icon: Icons.location_on,
              iconColor: Colors.blue,
              child: Text(widget.trip.pickupLocation),
            ),

            const SizedBox(height: 16),

            // Dropoff
            SectionCard(
              title: "Drop-off Location",
              icon: Icons.flag,
              iconColor: Colors.green,
              child: Text(widget.trip.dropoffLocation),
            ),

            const SizedBox(height: 16),

            // Update Status
            SectionCard(
              title: "Update Status",
              icon: Icons.update,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DropdownButtonFormField<TripStatus>(
                    decoration: const InputDecoration(
                      labelText: "Select new status",
                      border: OutlineInputBorder(),
                    ),
                    value: selectedStatus,
                    items: TripStatus.values.map((status) {
                      return DropdownMenuItem(
                        value: status,
                        child: Text(status.name),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedStatus = value;
                      });
                    },
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        updateStatus();

                        if (selectedStatus != null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "Trip status updated to ${selectedStatus!.name}",
                              ),
                            ),
                          );
                        }
                      },
                      child: Text("Update Trip Status", style: AppStyles.head),
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
