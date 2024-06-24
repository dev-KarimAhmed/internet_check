import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'connectivity_check_state.dart';

class ConnectivityCheckCubit extends Cubit<ConnectivityCheckState> {
  ConnectivityCheckCubit() : super(ConnectivityCheckInitial());

  void connected({required String connectedWith}) {
    emit(ConnectedState("Connected with $connectedWith"));
  }

  void notConnected() {
    emit(NotConnectedState("Not Connected"));
  }

  void checkConnection() async {
    emit(ConnectivityCheckLoading());
    // final List<ConnectivityResult> connectivityResult =
    //     await (Connectivity().checkConnectivity());

    Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> result) {
      if (result.first == ConnectivityResult.none) {
        notConnected();
      } else {
        connected(connectedWith: "Internet");
      }
    });

// This condition is for demo purposes only to explain every connection type.
// Use conditions which work for your requirements.
    // if (connectivityResult.contains(ConnectivityResult.mobile)) {
    //   // Mobile network available.
    //   connected(connectedWith: "Mobile");
    // } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
    //   connected(connectedWith: "Wi-Fi");
    //   // Wi-fi is available.
    //   // Note for Android:
    //   // When both mobile and Wi-Fi are turned on system will return Wi-Fi only as active network type
    // } else if (connectivityResult.contains(ConnectivityResult.ethernet)) {
    //   connected(connectedWith: "Ethernet");
    //   // Ethernet connection available.
    // } else if (connectivityResult.contains(ConnectivityResult.vpn)) {
    //   connected(connectedWith: "VPN");
    //   // Vpn connection active.
    //   // Note for iOS and macOS:
    //   // There is no separate network interface type for [vpn].
    //   // It returns [other] on any device (also simulator)
    // } else if (connectivityResult.contains(ConnectivityResult.bluetooth)) {
    //   connected(connectedWith: "Bluetooth");
    //   // Bluetooth connection available.
    // } else if (connectivityResult.contains(ConnectivityResult.other)) {
    //   connected(connectedWith: "Other");
    //   // Connected to a network which is not in the above mentioned networks.
    // } else if (connectivityResult.contains(ConnectivityResult.none)) {
    //   notConnected();
    //   // No available network types
    // } else {
    //   notConnected();
    // }
  }
}
