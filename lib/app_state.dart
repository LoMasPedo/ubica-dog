import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  LatLng? _InicioViaje;
  LatLng? get InicioViaje => _InicioViaje;
  set InicioViaje(LatLng? _value) {
    _InicioViaje = _value;
  }

  String _routeDistance = '';
  String get routeDistance => _routeDistance;
  set routeDistance(String _value) {
    _routeDistance = _value;
  }

  String _routeDuration = '';
  String get routeDuration => _routeDuration;
  set routeDuration(String _value) {
    _routeDuration = _value;
  }

  LatLng? _Prueba;
  LatLng? get Prueba => _Prueba;
  set Prueba(LatLng? _value) {
    _Prueba = _value;
  }
}
