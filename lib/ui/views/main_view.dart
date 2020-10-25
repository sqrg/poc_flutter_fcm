import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';

import 'package:poc_flutter_fcm/core/viewmodels/main_viewmodel.dart';

class MainView extends StatelessWidget {
  MainView({Key key}) : super(key: key);

  static const routeName = 'main';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => MainViewModel(),
      builder: (context, vm, child) => Scaffold(
        body: Center(
          child: Text('Main view'),
        ),
      ),
    );
  }
}
