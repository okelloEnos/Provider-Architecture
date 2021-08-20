import 'package:flutter/material.dart';
import 'package:provider_architecture/enums/view_state.dart';

class BaseModel extends ChangeNotifier{
  viewState _state = viewState.idle;

  viewState get state => _state;

  void setState(viewState state){
    _state = state;
    notifyListeners();
  }
}