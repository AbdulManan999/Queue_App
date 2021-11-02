import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:engage_app/feature/authentication/bloc/index.dart';
import 'package:engage_app/feature/signin_signup/bloc/index.dart';
import 'package:engage_app/feature/signin_signup/resources/index.dart';
import 'package:engage_app/feature/signin_signup/ui/screen/signin_form.dart';
import 'package:engage_app/generated/l10n.dart';

class SignInPage extends StatelessWidget {
  final AuthRepository authRepository;

  SignInPage({Key key, @required this.authRepository})
      : assert(authRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: RepositoryProvider(
      create: (context) => authRepository,
      child: BlocProvider(
        create: (context) {
          return SignInBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
            authRepository: authRepository,
          );
        },
        child: SignInForm(),
      ),
    ));
  }
}
