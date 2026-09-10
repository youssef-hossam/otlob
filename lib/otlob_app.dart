import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otlob/features/auth/auth_view.dart';
import 'package:otlob/details_view.dart';
import 'package:otlob/nav_bar_view.dart';
import 'package:otlob/on_boarding_view.dart';

class Otlob extends StatelessWidget {
  const Otlob({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        splitScreenMode: true,
        minTextAdapt: true,
        child: MaterialApp(
          routes: {
            '/': (context) => AuthView(),
            '/nav': (context) => NavBarView(),
            ProductDetailsView.routeName: (context) => ProductDetailsView(),
          },
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
        ));
  }
}
