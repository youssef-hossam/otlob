  // ودجت الحاوية البيضاء ذات الحواف الدائرية
  import 'package:flutter/material.dart';

Widget buildInfoCard({required List<Widget> children}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black.withOpacity(0.03)),
      ),
      child: Column(children: children),
    );
  }