import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecture/core/models/user.dart';
import 'package:provider_architecture/core/services/authentication_service.dart';
import 'package:provider_architecture/locator.dart';
import 'package:provider_architecture/ui/views/login_view.dart';
import 'package:provider_architecture/router.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  StreamProvider<User>(
      initialData: User.initial(),
      create: (context) => locator<AuthenticationService>().controller.stream,
      child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(),
            initialRoute: '/login',
        onGenerateRoute: RouterCustom.generateRoute,
          ),
    );
  }
}
