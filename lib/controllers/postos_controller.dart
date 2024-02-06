import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class PostosController extends ChangeNotifier {
  double lat = 0.0;
  double long = 0.0;
  String erro = '';
  StreamSubscription<Position>? _positionStreamSubscription;

  PostosController() {
    _iniciarAtualizacaoDePosicao();
  }

  void _iniciarAtualizacaoDePosicao() {
    _positionStreamSubscription = Geolocator.getPositionStream(
      desiredAccuracy: LocationAccuracy.best,
      intervalDuration: const Duration(seconds: 5),
    ).listen((Position position) {

        lat = position.latitude;
        long = position.longitude;
        erro = '';
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _cancelarAtualizacaoDePosicao();
    super.dispose();
  }

  void _cancelarAtualizacaoDePosicao() {
    _positionStreamSubscription?.cancel();
  }
}
