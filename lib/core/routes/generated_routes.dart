import 'package:flutter/material.dart';
import 'package:skilllink/features/employee/login/elogin.dart';
import 'package:skilllink/features/employee/homepage/ehome.dart';
import 'package:skilllink/features/employee/register/eregister.dart';
import 'package:skilllink/features/job/homepage/jhome.dart';
import 'package:skilllink/features/job/register/jregister.dart';
import 'package:skilllink/features/job/login/jlogin.dart';
import 'package:skilllink/features/splash/user_type_screen.dart';
import 'package:skilllink/features/splash/splash.dart';

class Routes {
  static Route? onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case "/splash":
        return MaterialPageRoute(builder: (context) => Splash());
      case "/user_type":
        return MaterialPageRoute(builder: (context) => UserTypeScreen());
      case "/elogin":
        return MaterialPageRoute(builder: (context) => Elogin());
      case "/ereqister":
        return MaterialPageRoute(builder: (context) => Eregister());
      case "/ehome":
        return MaterialPageRoute(builder: (context) => Ehome());
      case "/jlogin":
        return MaterialPageRoute(builder: (context) => Jlogin());
      case "/jreqister":
        return MaterialPageRoute(builder: (context) => Jregister());
        case "/jhome":
        return MaterialPageRoute(builder: (context) => Jhome());
    }
    return null;
  }
}
