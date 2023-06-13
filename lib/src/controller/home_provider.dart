import 'package:flutter/material.dart';
import 'package:learn_provider/src/model/user.dart';

class HomeProvider extends ChangeNotifier {
  final List<UserModel> _todolist = [];
  List<UserModel> get getTodoList => _todolist;
  add(UserModel user) {
    _todolist.add(user);
    notifyListeners();
  }

  deleted(index) {
    _todolist.removeAt(index);
    notifyListeners();
  }
}
