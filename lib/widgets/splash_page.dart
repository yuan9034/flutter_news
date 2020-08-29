import 'dart:async';
import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:flutter_news/routers/routes.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SplashState();
}

class SplashState extends State<SplashPage> {
  Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer(Duration(microseconds: 3500), () {
      Navigator.pushNamedAndRemoveUntil(
          context, Routes.cityListPage, (route) => false);
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset("images/welcome.png", fit: BoxFit.fill),
    );
  }
}
