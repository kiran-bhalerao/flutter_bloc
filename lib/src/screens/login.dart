import 'package:flutter/material.dart';

import '../blocs/bloc.dart';
import '../blocs/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return Container(
      margin: const EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          emailField(bloc),
          passwordField(bloc),
          SizedBox(height: 10),
          submitButton(bloc),
        ],
      ),
    );
  }

  Widget emailField(Bloc bloc) {
    return StreamBuilder<Object>(
      stream: bloc.email,
      builder: (context, snapshot) {
        return TextFormField(
          onChanged: bloc.changeEmail,
          decoration: InputDecoration(
            labelText: 'Email Address',
            hintText: 'you@example.com',
            errorText: snapshot.error,
          ),
          keyboardType: TextInputType.emailAddress,
        );
      },
    );
  }

  Widget passwordField(Bloc bloc) {
    return StreamBuilder<Object>(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextFormField(
          onChanged: bloc.changePassword,
          decoration: InputDecoration(
            labelText: 'Password',
            hintText: 'password',
            errorText: snapshot.error,
          ),
        );
      },
    );
  }

  Widget submitButton(Bloc bloc) {
    return StreamBuilder<Object>(
      stream: bloc.submitValid,
      builder: (context, snapshot) {
        return RaisedButton(
          child: Text('Submit'),
          onPressed: snapshot.hasData ? bloc.submit : null,
          color: Colors.blue.shade300,
        );
      },
    );
  }
}
