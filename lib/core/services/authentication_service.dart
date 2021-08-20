import 'dart:async';

import 'package:provider_architecture/core/models/user.dart';
import 'package:provider_architecture/core/services/api.dart';
import 'package:provider_architecture/locator.dart';

class AuthenticationService {
  Api _api = locator<Api>();

  StreamController<User> controller = StreamController<User>();

  Future<bool> logIn (int userId) async{
    var fetchedUser = await _api.getUserProfile(userId);
    var hasUser = fetchedUser != null;
    if(hasUser){
      controller.add(fetchedUser);
    }
    return hasUser;
  }
}