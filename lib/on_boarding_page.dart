import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final void Function()? onTap;
  const OnBoardingPage({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: Stack(
        children: [
          Image.asset(
            imagePath,
            width: double.infinity,
            height: 600.h,
          ),
          Positioned(
            bottom: 224.h,
            left: MediaQuery.of(context).size.width * 0.5 - 100.w,
            right: MediaQuery.of(context).size.width * 0.5 - 100.w,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Positioned(
            bottom: 160.h,
            left: MediaQuery.of(context).size.width * 0.5 - 150.w,
            right: MediaQuery.of(context).size.width * 0.5 - 150.w,
            child: Text(
              description,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
          Positioned(
            bottom: 61.h,
            left: 109.w,
            right: 109.w,
            child: GestureDetector(
              onTap: onTap,
              child: Container(
                width: 157.w,
                height: 75.h,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10.r),
                  gradient: const LinearGradient(
                    colors: [Color(0xffD61355), Color(0xffFF6B6B)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: Center(
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
