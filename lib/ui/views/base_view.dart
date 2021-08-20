import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecture/core/view_model/base_mode.dart';
import 'package:provider_architecture/locator.dart';

class BaseView<T extends BaseModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget child) builder;
  final Function(T) onModalReady;

  const BaseView({this.builder, this.onModalReady});

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseModel> extends State<BaseView<T>>{

  @override
  void initState() {

    T model = locator<T>();
    if(widget.onModalReady != null){
      widget.onModalReady(model);
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(create: (context) => locator<T>(),
    child: Consumer(builder: widget.builder),);
  }
}
