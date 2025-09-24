import 'dart:ui';

import 'package:flutter/material.dart';

enum VehicleType {
  truck,
  van,
  bike,
  car,
  bus,
}
extension VehicleTypeExt on VehicleType {
  IconData get icon {
    switch (this) {
      case VehicleType.truck:
        return Icons.local_shipping;
      case VehicleType.van:
        return Icons.directions_car_filled; 
      case VehicleType.bike:
        return Icons.pedal_bike;
      case VehicleType.car:
        return Icons.directions_car;
      case VehicleType.bus:
        return Icons.directions_bus;
    }
  }

  String get displayName {
    switch (this) {
      case VehicleType.truck:
        return "Truck";
      case VehicleType.van:
        return "Van";
      case VehicleType.bike:
        return "Bike";
      case VehicleType.car:
        return "Car";
      case VehicleType.bus:
        return "Bus";
    }
  }
}