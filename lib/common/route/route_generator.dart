import 'package:engage_app/feature/chats/ui/screens/chat_list_screen.dart';
import 'package:engage_app/feature/chats/ui/screens/chat_screen.dart';
import 'package:engage_app/feature/signin_signup/ui/screen/sign_up_page.dart';
import 'package:engage_app/feature/ticket/ui/screens/ticket_info_screen.dart';
import 'package:engage_app/feature/ticket/ui/screens/ticket_list_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:engage_app/feature/home/ui/screen/home_page.dart';
import 'package:engage_app/feature/landing/landing_page.dart';
import 'package:engage_app/feature/signin_signup/resources/auth_repository.dart';
import 'package:engage_app/feature/dashboard/ui/screens/dashboard_screen.dart';
import 'package:engage_app/feature/signin/ui/screens/login_screen.dart';

import 'routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case Routes.landing:
        return MaterialPageRoute<dynamic>(builder: (_) => LandingPage());

      // case Routes.signIn:
      //   if (args is AuthRepository) {
      //     return MaterialPageRoute<dynamic>(
      //         builder: (_) => SignInPage(authRepository: args));
      //   }
      //
      //   return _errorRoute();

      case Routes.signUp:
        if (args is AuthRepository) {
          return MaterialPageRoute<dynamic>(
              builder: (_) => SignUpPage(authRepository: args));
        }

        return _errorRoute();

      case Routes.home:
        return MaterialPageRoute<dynamic>(
            builder: (_) => Scaffold(
                appBar: AppBar(
                  title: const Text('Books'),
                ),
                body: HomePage()));

      case Routes.dashboard:
        return MaterialPageRoute<dynamic>(builder: (_) => Dashboard());

      case Routes.signIn:
        return MaterialPageRoute<dynamic>(builder: (_) => LoginScreen());
      case Routes.chatList:
        return MaterialPageRoute<dynamic>(builder: (_) => ChatListScreen());
      case Routes.chat:
        return MaterialPageRoute<dynamic>(builder: (_) => ChatScreen());
      case Routes.ticketList:
        return MaterialPageRoute<dynamic>(builder: (_) => TicketListScreen());
      case Routes.ticket:
        return MaterialPageRoute<dynamic>(builder: (_) => TicketInfoScreen());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute<dynamic>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
