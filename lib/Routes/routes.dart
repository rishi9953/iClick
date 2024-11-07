import 'package:flutter/material.dart';
import 'package:technical_round/Screens/BottomNavBar/bottom_nav.dart';
import 'package:technical_round/Screens/Category/category.dart';
import 'package:technical_round/Screens/Chat/chat_screen.dart';
import 'package:technical_round/Screens/Forget_Password/forget_password.dart';
import 'package:technical_round/Routes/route_name.dart';
import 'package:technical_round/Screens/Forget_Password/reset_password.dart';
import 'package:technical_round/Screens/Search/search_screen.dart';
import 'package:technical_round/Screens/Signin/sign_in.dart';
import 'package:technical_round/Screens/Splash/splash_screen.dart';
import 'package:technical_round/Screens/Verification/verification.dart';
import 'package:technical_round/Screens/login/login.dart';

class AppRouting {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RouteName.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RouteName.signin:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case RouteName.verification:
        return MaterialPageRoute(builder: (_) => const VerificationScreen());
      case RouteName.forgetpassword:
        return MaterialPageRoute(builder: (_) => const ForgetPassword());
      case RouteName.resetPassword:
        return MaterialPageRoute(builder: (_) => const ResetPassword());
      case RouteName.category:
        return MaterialPageRoute(builder: (_) => const CatergoryScreen());
      case RouteName.bottomNav:
        return MaterialPageRoute(builder: (_) => const BottomNavScreen());
      case RouteName.search:
        return MaterialPageRoute(builder: (_) => const SearchScreen());
      case RouteName.chatscreen:
        return MaterialPageRoute(builder: (_) => const ChatScreen());
      default:
        return MaterialPageRoute(builder: (_) => const SizedBox());
    }
  }
}
