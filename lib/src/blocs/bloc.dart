import 'dart:async';

import 'package:rxdart/rxdart.dart';

import 'validators.dart';

class Bloc extends Object with Validators {
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

// Retrieve data from stream
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);
  Stream<bool> get submitValid =>
      Rx.combineLatest2(email, password, (e, p) => true);

// Add data to stream
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  void submit() {
    final email = _email.value;
    final password = _password.value;

    print("Email is $email with Password $password");
  }

  void dispose() {
    _email.close();
    _password.close();
  }
}
