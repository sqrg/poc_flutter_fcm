import 'package:flutter/material.dart';

import 'package:poc_flutter_fcm/locator.dart';

import 'package:poc_flutter_fcm/ui/fmc_router.dart';
import 'package:poc_flutter_fcm/ui/views/login_view.dart';

void main() {
  // Without this, the auth service doesn't work because is called before the runApp
  // See: https://stackoverflow.com/a/57775690/2584335
  WidgetsFlutterBinding.ensureInitialized();

  configureLocator();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FCM Notifications',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: FcmRouter.generateRoute,
      initialRoute: LoginView.routeName,
    );
  }
}