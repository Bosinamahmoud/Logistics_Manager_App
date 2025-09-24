import 'package:flutter/material.dart';
import 'package:logistics_manager_app/core/data/enums/trip_status.dart';
import 'package:logistics_manager_app/core/data/enums/vehicle_type.dart';
import 'package:logistics_manager_app/core/data/model/trip_model.dart';
import 'package:logistics_manager_app/core/styling/app_colors.dart';
import 'package:logistics_manager_app/core/styling/app_styles.dart';
import 'package:logistics_manager_app/features/home/data/db_helper/db_helper.dart';
import 'package:logistics_manager_app/features/trip/widgets/input_card.dart';

class CreateTripScreen extends StatefulWidget {
  const CreateTripScreen({super.key});

  @override
  State<CreateTripScreen> createState() => _CreateTripScreenState();
}

class _CreateTripScreenState extends State<CreateTripScreen> {
  final drivers = ['Ahmed', 'Mohamed', 'Sara', 'Laila', 'Omar'];
  final vehicles = ['Truck 1', 'Van 2', 'Car 3', 'Bus 1', 'Bike 2'];
  String? selectedDriver;
  String? selectedVehicle;
  final pickupController = TextEditingController();
  final dropoffController = TextEditingController();

  @override
  void dispose() {
    pickupController.dispose();
    dropoffController.dispose();
    super.dispose();
  }

  Future<void> _createTrip() async {
    if (selectedDriver == null ||
        selectedVehicle == null ||
        pickupController.text.isEmpty ||
        dropoffController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields')),
      );
      return;
    }

    VehicleType vehicleType = VehicleType.truck;
    if (selectedVehicle!.toLowerCase().contains('van')) {
      vehicleType = VehicleType.van;
    } else if (selectedVehicle!.toLowerCase().contains('car')) {
      vehicleType = VehicleType.car;
    }

    final trip = TripModel(
      assignedDriver: selectedDriver!,
      assignedVehicle: selectedVehicle!,
      pickupLocation: pickupController.text,
      dropoffLocation: dropoffController.text,
      status: TripStatus.pending,
      vehicleType: vehicleType,
    );

    await DbHelper().insertTrip(trip);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Trip created successfully!')),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create New Trip", style: AppStyles.head),
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
            // Select Driver
            InputCard(
              child: DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: "Select Driver",
                  prefixIcon: Icon(Icons.person_outline),
                  border: InputBorder.none,
                ),
                items: drivers.map((driver) {
                  return DropdownMenuItem(value: driver, child: Text(driver));
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedDriver = value;
                  });
                },
              ),
            ),

            // Select Vehicle
            InputCard(
              child: DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: "Select Vehicle",
                  prefixIcon: Icon(Icons.local_shipping_outlined),
                  border: InputBorder.none,
                ),
                items: vehicles.map((vehicle) {
                  return DropdownMenuItem(value: vehicle, child: Text(vehicle));
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedVehicle = value;
                  });
                },
              ),
            ),

            // Pickup Location
            InputCard(
              child: TextField(
                controller: pickupController,
                decoration: const InputDecoration(
                  labelText: "Pickup Location",
                  prefixIcon: Icon(Icons.location_on, color: Colors.blue),
                  border: InputBorder.none,
                ),
              ),
            ),

            // Drop-off Location
            InputCard(
              margin: const EdgeInsets.only(bottom: 24),
              child: TextField(
                controller: dropoffController,
                decoration: const InputDecoration(
                  labelText: "Drop-off Location",
                  prefixIcon: Icon(Icons.flag, color: Colors.green),
                  border: InputBorder.none,
                ),
              ),
            ),

            // Create Trip Button
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
                onPressed: _createTrip,
                child: Text("Create Trip", style: AppStyles.head),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
