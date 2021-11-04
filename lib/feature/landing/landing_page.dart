import 'package:task_queues_app/feature/home/ui/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_queues_app/common/constant/env.dart';
import 'package:task_queues_app/common/http/api_provider.dart';
import 'package:task_queues_app/common/util/internet_check.dart';
import 'package:task_queues_app/common/widget/loading_widget.dart';
import 'package:task_queues_app/feature/authentication/bloc/index.dart';
import 'package:task_queues_app/feature/landing/splash_page.dart';
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
            return HomePage();
          }
          if (state is AuthenticationUnauthenticated) {
            return HomePage();
              // SignInPage(
              //   authRepository: AuthRepository(
              //       env: RepositoryProvider.of<Env>(context),
              //       apiProvider: RepositoryProvider.of<ApiProvider>(context),
              //       internetCheck:
              //           RepositoryProvider.of<InternetCheck>(context)));
            // return LoginScreen();
          }

          return HomePage();
        });
  }
}
