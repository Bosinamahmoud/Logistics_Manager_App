import 'package:flutter/material.dart';
import 'package:logistics_manager_app/core/styling/app_colors.dart';
import 'package:logistics_manager_app/core/styling/app_styles.dart';

class CreateTripScreen extends StatelessWidget {
  const CreateTripScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final drivers = ['Ahmed', 'Mohamed', 'Sara'];
    final vehicles = ['Truck 1', 'Van 2', 'Car 3'];

    String? selectedDriver;
    String? selectedVehicle;

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
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 6,
                    spreadRadius: 2,
                  ),
                ],
              ),
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
                  selectedDriver = value;
                },
              ),
            ),

            // Select Vehicle
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 6,
                    spreadRadius: 2,
                  ),
                ],
              ),
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
                  selectedVehicle = value;
                },
              ),
            ),

            // Pickup Location
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 6,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: const TextField(
                decoration: InputDecoration(
                  labelText: "Pickup Location",
                  prefixIcon: Icon(Icons.location_on, color: Colors.blue),
                  border: InputBorder.none,
                ),
              ),
            ),

            // Drop-off Location
            Container(
              margin: const EdgeInsets.only(bottom: 24),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 6,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: const TextField(
                decoration: InputDecoration(
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
                onPressed: () {},
                child: Text("Create Trip", style: AppStyles.head),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
