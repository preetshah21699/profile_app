import 'package:flutter/material.dart';
import './Screens/homepage.dart';
import './Screens/contactme.dart';
import './Screens/edupage.dart';
import './Screens/profilepage.dart';
import './Screens/projectpage.dart';
import './Screens/skillspage.dart';

class Routes {
  static Map<String, WidgetBuilder> routes = {
    // '/': (context) => MySplash(),
    '/': (context) => MyHomePage(),
    '/contact': (context) => ContactMe(),
    '/education': (context) => EducationPage(),
    '/profile': (context) => ProfilePage(),
    '/projects': (context) => ProjectPage(),
    '/skills': (context) => SkillsPage(),
  };
}