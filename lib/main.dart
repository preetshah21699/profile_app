import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'dart:ui';
import './routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  window.onSemanticsEnabledChanged = () {};
  RendererBinding.instance.setSemanticsEnabled(false);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
    .then((_){
      runApp(MyApp());
    });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: Routes.routes,
      initialRoute: '/',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        appBarTheme: AppBarTheme(
          color: Colors.grey[800]
        ),
        backgroundColor: Colors.black,
        primaryColor: Colors.black,
        primaryColorDark: Colors.teal,
        colorScheme: ColorScheme.dark(
          background: Colors.grey[900],
          primary: Colors.black,
          surface: Colors.black,
          error: Colors.red,

        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}