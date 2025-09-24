import 'package:go_router/go_router.dart';
import 'package:logistics_manager_app/core/data/model/trip_model.dart';
import 'package:logistics_manager_app/core/routing/app_routes.dart';
import 'package:logistics_manager_app/features/details/details_screen.dart';
import 'package:logistics_manager_app/features/home/home_screen.dart';
import 'package:logistics_manager_app/features/trip/create_trip_screen.dart';

class RoutesGeneration {
  static GoRouter goRouter = GoRouter(
    initialLocation: AppRoutes.homeScreen,
    routes: [
      GoRoute(
        path: AppRoutes.homeScreen,
        name: AppRoutes.homeScreen,
        builder: (context, state) => HomeScreen(),
      ),
     
      GoRoute(
        path: AppRoutes.detailsScreen,
        name: AppRoutes.detailsScreen,

        builder: (context, state) {
          final trip = state.extra as TripModel;
          return DetailsScreen(trip: trip,);
        },
      ),

       GoRoute(
        path: AppRoutes.tripScreen,
        name: AppRoutes.tripScreen,
        builder: (context, state) => CreateTripScreen(),
      ),
    ],
  );
}