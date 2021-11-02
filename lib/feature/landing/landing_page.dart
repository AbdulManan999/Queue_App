import 'package:engage_app/feature/dashboard/ui/screens/dashboard_screen.dart';
import 'package:engage_app/feature/signin_signup/ui/screen/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:engage_app/common/constant/env.dart';
import 'package:engage_app/common/http/api_provider.dart';
import 'package:engage_app/common/util/internet_check.dart';
import 'package:engage_app/common/widget/loading_widget.dart';
import 'package:engage_app/feature/authentication/bloc/index.dart';
import 'package:engage_app/feature/home/ui/screen/home_page.dart';
import 'package:engage_app/feature/landing/splash_page.dart';
import 'package:engage_app/feature/signin_signup/resources/auth_repository.dart';
import 'package:flutter_screenutil/screen_util.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(375, 812),
        orientation: Orientation.portrait);
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is AuthenticationLoading) {
            return const LoadingWidget(
              visible: true,
            );
          }

          if (state is AuthenticationAuthenticated) {
            return Dashboard();
          }
          if (state is AuthenticationUnauthenticated) {
            return SignInPage(
                authRepository: AuthRepository(
                    env: RepositoryProvider.of<Env>(context),
                    apiProvider: RepositoryProvider.of<ApiProvider>(context),
                    internetCheck:
                        RepositoryProvider.of<InternetCheck>(context)));
            // return LoginScreen();
          }

          return SplashPage();
        });
  }
}
