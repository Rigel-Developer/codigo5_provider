import 'package:codigo5_provider/models/rick_and_morty_model.dart';
import 'package:codigo5_provider/services/api_services.dart';
import 'package:flutter/material.dart';

class ApiProvider extends ChangeNotifier {
  ApiServices apiServices = ApiServices();

  List<Results>? _list = [];

  List<Results>? get list => _list;
  Future<void> getCharacter() async {
    _list = await apiServices.getCharacter();
    notifyListeners();
  }
}
