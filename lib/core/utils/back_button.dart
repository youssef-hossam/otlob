import 'package:flutter/material.dart';

class backButton extends StatelessWidget {
  void Function()? onTap;
  backButton({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 19,
      top: 50,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 238, 130, 130),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.asset('assets/icons/back_btn.png'),
        ),
      ),
    );
  }
}
