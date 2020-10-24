import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';

import 'package:poc_flutter_fcm/core/viewmodels/login_viewmodel.dart';

class LoginView extends StatelessWidget {
  LoginView({Key key}) : super(key: key);

  static const routeName = 'login';

  final TextEditingController username = TextEditingController(text: 'admin');
  final TextEditingController password = TextEditingController(text: 'admin');

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, vm, child) => Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                  ),
                  borderRadius: BorderRadius.circular(5.0)),
              margin: EdgeInsets.symmetric(horizontal: 50.0, vertical: 5.0),
              child: TextField(
                decoration: InputDecoration.collapsed(hintText: 'Username'),
                style: TextStyle(fontSize: 20),
                controller: username,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                  ),
                  borderRadius: BorderRadius.circular(5.0)),
              margin: EdgeInsets.symmetric(horizontal: 50.0, vertical: 5.0),
              child: TextField(
                decoration: InputDecoration.collapsed(hintText: 'Password'),
                style: TextStyle(fontSize: 20),
                obscureText: true,
                controller: password,
              ),
            ),
            vm.isBusy
                ? Container(margin: EdgeInsets.symmetric(vertical: 10), child: CircularProgressIndicator())
                : Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: FlatButton(
                      color: Color.fromARGB(255, 122, 158, 159),
                      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                      child: Text(
                        'Log in',
                        style: TextStyle(color: Colors.white, fontSize: 24.0),
                      ),
                      onPressed: () async {
                        var success = await vm.login(username.text, password.text);

                        if (success) {
                          Navigator.pushNamed(context, 'main');
                        }
                      },
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
