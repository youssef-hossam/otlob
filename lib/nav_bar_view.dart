import 'package:flutter/material.dart';

import 'package:otlob/nav_bar.dart';

class NavBarView extends StatelessWidget {
  const NavBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NavBar(),
    );
  }
}
