import 'dart:async';
import 'dart:developer';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:engage_app/common/http/response.dart';
import 'package:engage_app/feature/authentication/bloc/index.dart';
import 'package:engage_app/feature/signin_signup/bloc/index.dart';
import 'package:engage_app/feature/signin_signup/resources/auth_repository.dart';
import 'package:meta/meta.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final AuthRepository authRepository;
  final AuthenticationBloc authenticationBloc;

  SignInBloc({
    @required this.authRepository,
    @required this.authenticationBloc,
  })  : assert(authRepository != null),
        assert(authenticationBloc != null),
        super(SignInInitial());

  @override
  Stream<SignInState> mapEventToState(SignInEvent event) async* {
    if (event is SignInButtonPressed) {
      yield SignInLoading();

      try {
        DataResponse<dynamic> response =
            await authRepository.signIn(event.email, event.password);
        print("response: $response");
        if (response.status == Status.ConnectivityError) {
          //Internet problem
          yield const SignInFailure(error: "");
        }
        if (response.status == Status.Success) {
          print("response.data: ${response.data}");
          authenticationBloc.add(LoggedIn(token: response.data));
          yield SignInSuccess();
        } else {
          yield SignInFailure(error: response.message);
        }
      } catch (error) {
        yield SignInFailure(error: error.toString());
      }
    }
  }
}
