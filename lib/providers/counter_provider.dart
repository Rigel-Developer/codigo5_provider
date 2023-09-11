import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int _counter = 230;

  int get counter => _counter;
  final List<String> _list = ['hola', 'mundo', 'flutter'];

  List<String> get list => _list;

  void addToList(String value) {
    _list.add(value);
    notifyListeners();
  }

  void increment() {
    _counter++;
    notifyListeners();
  }
}
