import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';
import 'dart:convert';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _zeroState = prefs.getInt('ff_zeroState') ?? _zeroState;
  }

  SharedPreferences prefs;

  bool toggleIcon = false;

  int _zeroState = 0;
  int get zeroState => _zeroState;
  set zeroState(int _value) {
    _zeroState = _value;
    prefs.setInt('ff_zeroState', _value);
  }

  List<dynamic> productsStoreWillSupply = [];
}

LatLng _latLngFromString(String val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
