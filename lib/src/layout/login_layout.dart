import 'package:bloc_pattern_2/src/blocs/bloc.dart';
import 'package:bloc_pattern_2/src/blocs/provider.dart';
import 'package:flutter/material.dart';

class LoginLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Container(
      padding: EdgeInsets.fromLTRB(30, 50, 30, 0),
      child: Form(
        child: Column(
          children: <Widget>[
            emailField(bloc),
            passswordField(bloc),
            Container(
              margin: EdgeInsets.only(top: 30),
            ),
            loginButton()
          ],
        ),
      ),
    );
  }

  Widget emailField(Bloc bloc) {
    return StreamBuilder(
        stream: bloc.emailStream,
        builder: (context, snapshot) {
          return TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                hintText: "you@example.com",
                labelText: "Email",
                errorText: snapshot.error),
            onChanged: bloc.changeEmail,
          );
        });
  }

  Widget passswordField(Bloc bloc) {
    return StreamBuilder(
        stream: bloc.passwordStream,
        builder: (context, snapshot) {
          return TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                hintText: "you@example.com",
                labelText: "Email",
                errorText: snapshot.error),
            onChanged: bloc.changePassword,
          );
        });
  }

  Widget emailForm() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration:
          InputDecoration(hintText: "you@example.com", labelText: "Email"),
      onChanged: (newValue) {},
    );
  }

  Widget passwordForm() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: "password",
        labelText: "Password",
      ),
    );
  }

  Widget loginButton() {
    return RaisedButton(
        color: Colors.lightBlue,
        child: Text(
          "login",
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {});
  }
}
