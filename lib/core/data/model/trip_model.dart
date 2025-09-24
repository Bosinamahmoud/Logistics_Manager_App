import 'package:logistics_manager_app/core/data/enums/trip_status.dart';
import 'package:logistics_manager_app/core/data/enums/vehicle_type.dart';

class TripModel {
  final int id;
  final String assignedDriver;
  final VehicleType vehicleType;
  final String assignedVehicle;
  final String pickupLocation;
  final String dropoffLocation;
  final TripStatus status;

  TripModel( {
    required this.id,
    required this.assignedDriver,
    required this.assignedVehicle,
    required this.pickupLocation,
    required this.dropoffLocation,
    required this.status, required this.vehicleType,
  });
}

