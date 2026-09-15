// import 'package:flutter/material.dart';
// import 'package:otlob/core/utils/router/router_transitions.dart';
// import 'package:otlob/core/utils/router/routes.dart';

// class AppRouter {
//   Route<dynamic> onGenerateRoute(RouteSettings settings){
//     switch (settings.name) {
//       case Routes.login:
//         return RouterTransitions.build(LoginView());
//       case Routes.home:
//       return RouterTransitions.buildHorizontal(HomeView());  
//       default: return RouterTransitions.build(Scaffold(
//         body:Center(
//           child: Text("No Route"),
//         ),
//       ));
//     }
//   }
// }