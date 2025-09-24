import 'dart:ui';

import 'package:logistics_manager_app/core/styling/app_colors.dart';

enum TripStatus {
  pending,
  inProgress,
  completed,
}
extension TripStatusExt on TripStatus {
  String get label {
    switch (this) {
      case TripStatus.pending:
        return 'Pending';
      case TripStatus.inProgress:
        return 'In Progress';
      case TripStatus.completed:
        return 'Completed';
    }
  }

  Color get color {
    switch (this) {
      case TripStatus.completed:
        return AppColors.completedColor;
      case TripStatus.inProgress:
        return AppColors.inProgressColor;
      case TripStatus.pending:
        return AppColors.pendingColor;
    }
  }
}
