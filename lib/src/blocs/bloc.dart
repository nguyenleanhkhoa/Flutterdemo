import 'dart:async';
import 'package:bloc_pattern_2/src/blocs/validators.dart';

class Bloc extends Object with Validators {
  final emailController = StreamController<String>();
  final passwordController = StreamController<String>();

  // add data to stream
  Stream<String> get emailStream =>
      emailController.stream.transform(validateEmail);
  Stream<String> get passwordStream =>
      passwordController.stream.transform(validPassword);

  //Change data
  Function(String) get changeEmail => emailController.sink.add;
  Function(String) get changePassword => passwordController.sink.add;

  dispose() {
    emailController.close();
    passwordController.close();
  }
}

final bloc = Bloc();
