import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/checkout_cubit.dart';
import 'chekout_stepper.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //   Future<bool> _handleLocationPermission() async {
    //   bool serviceEnabled;
    //   LocationPermission permission;

    //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
    //   if (!serviceEnabled) {
    //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    //         content: Text(
    //             'Location services are disabled. Please enable the services')));
    //     return false;
    //   }
    //   permission = await Geolocator.checkPermission();
    //   if (permission == LocationPermission.denied) {
    //     permission = await Geolocator.requestPermission();
    //     if (permission == LocationPermission.denied) {
    //       ScaffoldMessenger.of(context).showSnackBar(
    //           const SnackBar(content: Text('Location permissions are denied')));
    //       return false;
    //     }
    //   }
    //   if (permission == LocationPermission.deniedForever) {
    //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    //         content: Text(
    //             'Location permissions are permanently denied, we cannot request permissions.')));
    //     return false;
    //   }
    //   return true;
    // }

    // Future<void> _getCurrentPosition() async {
    //   final hasPermission = await _handleLocationPermission();

    //   if (!hasPermission) return;
    //   await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
    //       .then((Position position) {
    //     setState(() => _currentPosition = position);
    //     _getAddressFromLatLng(_currentPosition!);
    //   }).catchError((e) {
    //     debugPrint(e);
    //   });
    // }
    return BlocProvider(
      create: (context) => CheckoutCubit(3),
      child: const CheckoutStepper(),
    );
  }
}
