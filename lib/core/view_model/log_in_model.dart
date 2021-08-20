import 'package:flutter/widgets.dart';
import 'package:provider_architecture/core/services/authentication_service.dart';
import 'package:provider_architecture/core/view_model/base_mode.dart';
import 'package:provider_architecture/locator.dart';
import 'package:provider_architecture/enums/view_state.dart';

class LogInModel extends BaseModel{

  final AuthenticationService _authenticationService = locator<AuthenticationService>();

  String errorMessage ;
  Future<bool> logIn(String userIdText) async{
    setState(viewState.busy);
    var userId = int.tryParse(userIdText);

    // not a number
    if(userId == null){
      errorMessage = 'Value entered is not a number';
      setState(viewState.idle);
      return false;
    }
    var success = await _authenticationService.logIn(userId);

    setState(viewState.idle);
    return success;

  }
}