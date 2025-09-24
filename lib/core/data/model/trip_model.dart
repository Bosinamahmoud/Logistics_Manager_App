import 'package:logistics_manager_app/core/data/enums/trip_status.dart';
import 'package:logistics_manager_app/core/data/enums/vehicle_type.dart';

class TripModel {
  final int? id;
  final String assignedDriver;
  final VehicleType vehicleType;
  final String assignedVehicle;
  final String pickupLocation;
  final String dropoffLocation;
  final TripStatus status;

  TripModel( {
     this.id,
    required this.assignedDriver,
    required this.assignedVehicle,
    required this.pickupLocation,
    required this.dropoffLocation,
    required this.status, required this.vehicleType,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'assignedDriver': assignedDriver,
      'vehicleType': vehicleType.name,
      'assignedVehicle': assignedVehicle,
      'pickupLocation': pickupLocation,
      'dropoffLocation': dropoffLocation,
      'status': status.name,
    };
  }

  factory TripModel.fromMap(Map<String, dynamic> map) {
    return TripModel(
      id: map['id'],
      assignedDriver: map['assignedDriver'],
      vehicleType: VehicleType.values.firstWhere((e) => e.name == map['vehicleType']),
      assignedVehicle: map['assignedVehicle'],
      pickupLocation: map['pickupLocation'],
      dropoffLocation: map['dropoffLocation'],
      status: TripStatus.values.firstWhere((e) => e.name == map['status']),
    );
  }
}

