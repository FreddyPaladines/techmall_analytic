import 'package:flutter/material.dart';

class VariablesExt with ChangeNotifier {
  String _url = "Fondo.png"; // URL predeterminado

  String get url => _url;

  void setUrl(String newUrl) {
    _url = newUrl;
    notifyListeners();
  }
}
