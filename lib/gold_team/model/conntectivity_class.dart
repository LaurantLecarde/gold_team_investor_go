import 'package:connectivity/connectivity.dart';
import 'package:flutter/foundation.dart';

class ConnectivityService with ChangeNotifier {
  static final ConnectivityService _instance = ConnectivityService._internal();

  factory ConnectivityService() => _instance;

  ConnectivityService._internal() {
    _initConnectivity();
    Connectivity().onConnectivityChanged.listen(_updateConnectionStatus);
  }

  bool _isConnected = false;

  bool get isConnected => _isConnected;

  Future<void> _initConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    _updateConnectionStatus(connectivityResult);
  }

  void _updateConnectionStatus(ConnectivityResult result) {
    if (result == ConnectivityResult.none) {
      _isConnected = false;
    } else {
      _isConnected = true;
    }
    notifyListeners();
  }
}
