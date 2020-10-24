import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poc_flutter_fcm/ui/views/login_view.dart';

class FcmRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LoginView.routeName:
        return MaterialPageRoute(builder: (_) => LoginView());
    }
  }
}