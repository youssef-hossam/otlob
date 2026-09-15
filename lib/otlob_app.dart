import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otlob/features/auth/auth_view.dart';
import 'package:otlob/details_view.dart';
import 'package:otlob/features/presentation/cubit/products_cubit.dart';
import 'package:otlob/features/presentation/views/home_view.dart';
import 'package:otlob/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:otlob/features/profile/presentation/views/profile_view.dart';

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
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => ProductsCubit()..getAllProducts(),
            ),
          ],
          child: MaterialApp(
            routes: {
              ProfileView.routeName: (context) => BlocProvider<ProfileCubit>(
                    create: (context) => ProfileCubit()..getProfileData(),
                    child: ProfileView(),
                  ),
              '/': (context) => NavBarView(),
              '/nav': (context) => NavBarView(),
              ProductDetailsView.routeName: (context) => ProductDetailsView(),
            },
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
          ),
        ));
  }
}
