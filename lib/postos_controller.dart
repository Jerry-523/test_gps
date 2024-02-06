import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class PostosController extends ChangeNotifier{
  double lat = 0.0;
  double long = 0.0;
  String erro = '';

  PostosController(){
    getPosicao();
  }

  getPosicao() async {
      try {
        Position posicao = await _posicaoAtual();
        lat = posicao.latitude;
        long = posicao.longitude;
      } catch (e) {
        erro = e.toString();
      }
      notifyListeners();
  }

  Future<Position> _posicaoAtual() async {
      LocationPermission permission;
      bool ativado = await Geolocator.isLocationServiceEnabled();
      if(! ativado){
        return Future.error('Por favor, habilite o GPS');
      }

      permission = await Geolocator.checkPermission();
      if(permission == LocationPermission.denied){
        permission = await Geolocator.requestPermission();
        if(permission == LocationPermission.denied){
          return Future.error("Voce precisa autorizar o acesso ao GPS");
        }
      }
      if(permission == LocationPermission.deniedForever){
        return Future.error("Voce precisa autorizar o acesso ao GPS");
      }
      return await Geolocator.getCurrentPosition();
  }
}