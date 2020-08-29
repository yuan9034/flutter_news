import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_news/routers/routes.dart';
import 'package:flutter_news/widgets/splash_page.dart';

void main() async {
  if (Platform.isAndroid) {
    var systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(routes: Routes.routes, home: SplashPage());
  }

  MyApp() {
    Routes.init();
  }
}
