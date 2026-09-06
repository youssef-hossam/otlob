import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsMenu extends StatelessWidget {
  const DetailsMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          // 1. Collapsible Image Header with Back Button
          SliverAppBar(
            expandedHeight: height * 0.45,
            pinned: true,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/images/details_menu_img.png',
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    left: 19,
                    top: 50,
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 238, 130, 130),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset('assets/icons/back_btn_icon.png'),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 2. Scrollable Details Body
          SliverToBoxAdapter(
            child: Transform.translate(
              offset: const Offset(
                0,
                -20,
              ), // Slides the sheet up over the image
              child: Container(
                // Creates overlapping sheet effect
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    topRight: Radius.circular(20.r),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 16.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Scroll Drag Indicator
                      Center(
                        child: Image.asset('assets/icons/scroll_toll_icon.png'),
                      ),
                      SizedBox(height: 25.h),

                      // Action Row (Popular tag + Icons)
                      Row(
                        children: [
                          Container(
                            width: 76.w,
                            height: 38.h,
                            decoration: BoxDecoration(
                              color: const Color(0xffFFE6E6),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                              child: Text(
                                "Popular",
                                style: TextStyle(
                                  color: Color(0xffD61355),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                          Container(
                            width: 38,
                            height: 38,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xffFFE6E6),
                            ),
                            child: Center(
                              child: Image.asset('assets/icons/location.png'),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Container(
                            width: 38,
                            height: 38,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey,
                            ),
                            child: Center(
                              child: Image.asset('assets/icons/love.png'),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // Title
                      const Text(
                        'Chicken Burger\nPromo Pack',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Rating and Order Count Row
                      Row(
                        children: [
                          Image.asset(
                            'assets/icons/icon_star.png',
                            width: 20,
                            height: 20,
                          ),
                          const SizedBox(width: 6),
                          const Text(
                            '4.9',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(width: 30),
                          Image.asset(
                            'assets/icons/shopping_bag.png',
                            width: 20,
                            height: 20,
                          ),
                          const SizedBox(width: 6),
                          const Text(
                            '7000+ Order',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // Description
                      const Text(
                        'In a medium bowl, add ground chicken, breadcrumbs, mayonnaise, onions, parsley, garlic, paprika, salt and pepper. Use your hands to combine all the ingredients together until blended, but don\'t overmix.',
                        style: TextStyle(
                          fontSize: 16,
                          height: 1.5,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ), // Extra space at bottom for scrolling comfort
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
