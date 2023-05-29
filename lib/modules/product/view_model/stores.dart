import 'package:flutter/material.dart';
import 'package:tokosmileui/shared/constants/images.dart';
import 'package:tokosmileui/shared/models/store.dart';

class Stores extends ChangeNotifier {
  Store findById(String id) {
    return _availableStores.firstWhere((store) => store.id == id);
  }

  List<Store> get availableStores => [..._availableStores];

  final List<Store> _availableStores = [
    Store(
      id: '1',
      name: 'Super Store',
      imgUrl: store1,
    ),
    Store(
      id: '2',
      name: 'Online Store',
      imgUrl: store2,
    ),
    Store(
      id: '3',
      name: 'Better Store',
      imgUrl: store3,
    ),
  ];
}
