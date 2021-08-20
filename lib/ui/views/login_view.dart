import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecture/core/view_model/log_in_model.dart';
import 'package:provider_architecture/locator.dart';
import 'package:provider_architecture/ui/shared/app_colors.dart';
import 'package:provider_architecture/ui/views/base_view.dart';
import 'package:provider_architecture/ui/widgets/login_header.dart';
import 'package:provider_architecture/enums/view_state.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // return Text('data');
    return BaseView<LogInModel>(
        onModalReady: (model){},
        builder: (context, model, child) => Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LoginHeader(
                validationMessage: model.errorMessage,
                controller: _controller),
            model.state == viewState.busy ? CircularProgressIndicator() : FlatButton(
              color: Colors.white,
              child: Text('Log In', style: TextStyle(color: Colors.black),),
              onPressed: () async{

                var logInSuccess = await model.logIn(_controller.text);

                if(logInSuccess){
                //  navigate to home view
                  Navigator.pushNamed(context, '/');
                }

              },
            )
          ],
        ),
      )
    );
  }
}

