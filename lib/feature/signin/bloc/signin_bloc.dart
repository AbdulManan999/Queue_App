import 'dart:async';

import 'package:bloc/bloc.dart';
import 'index.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial());

  @override
  Stream<SignInState> mapEventToState(
    SignInEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
