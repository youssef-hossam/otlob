import 'package:flutter/material.dart';
import 'package:onboarding/onboarding.dart';
import 'package:otlob/on_boarding_page.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Onboarding(
      swipeableBody: [
        OnBoardingPage(
          imagePath: 'assets/images/on_boarding_one.png',
          title: 'Select the Favorities Menu',
          description:
              'Now eat well, don\'t leave the house,You can choose your favorite food only with one click',
        ),
        OnBoardingPage(
          imagePath: 'assets/images/on_boarding_two.png',
          title: 'Good food at a cheap price',
          description:
              'You can eat at expensive restaurants withaffordable price',
          onTap: () {
            Navigator.pushNamed(context, '/nav');
          },
        ),
      ], //[List<Widget>] - List of swipeable widgets
      startIndex: 0, //[int] - the starting index of the swipeable widgets
      onPageChanges:
          (netDragDistance, pagesLength, currentIndex, slideDirection) {
        netDragDistance; // [double] - the distance the user has dragged in pixels
        pagesLength; // [int] - the total number of pages in the onboarding
        currentIndex; // [int] - the current index of the onboarding
        slideDirection; // [SlideDirection] - the direction the user is sliding in
      },
      buildFooter: (context, netDragDistance, pagesLength, currentIndex,
          setIndex, slideDirection) {
        //Use this to build a footer in your onboarding that will display at all times. (Used to build routing buttons, indicators, etc)
        return Indicator<LinePainter>(
          painter: LinePainter(
              currentPageIndex: 0,
              pagesLength: pagesLength,
              netDragPercent:
                  netDragDistance / MediaQuery.of(context).size.width,
              lineWidth: 20,
              translate: false,
              slideDirection: slideDirection),
        );
      },
      // will be a task to implement the footer indicators dots

      animationInMilliseconds: 300, //[int] - the speed of animations in ms
    ));
  }
}
