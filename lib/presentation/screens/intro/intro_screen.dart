import 'package:animate_do/animate_do.dart';
import 'package:apex_cpd/core/constant/assets.dart';
import 'package:apex_cpd/core/constant/strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constant/colors.dart';


class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  late PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0
    );
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 20),
            child: TextButton(child:const Text('Skip', style: TextStyle(
              color: ResColors.secondary,
              fontSize: 18,
              fontWeight: FontWeight.w400
            )),onPressed: (){context.pushNamed("signIn");},),
          )
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          PageView(
            onPageChanged: (int page) {
              setState(() {
                currentIndex = page;
              });
            },
            controller: _pageController,
            children: <Widget>[
              makePage(
                image: ResAssets.intro,
                title: ResConstants.introTitle,
                content: ResConstants.introDescription
              ),
              makePage(
                reverse: true,
                image: ResAssets.intro,
               title: ResConstants.introTitle,
                content: ResConstants.introDescription
              ),
              makePage(
                image: ResAssets.intro,
                title: ResConstants.introTitle,
                content: ResConstants.introDescription
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildIndicator(),
            ),
          )
        ],
      ),
    );
  }

  Widget makePage({image, title, content, reverse = false}) {
    return Container(
      padding: const EdgeInsets.only(left: 50, right: 50, bottom: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          !reverse ? 
          Column(
            children: <Widget>[
              FadeInRight(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Image.asset(image),
                ),
              ),
              const SizedBox(height: 30,),
            ],
          ) : const SizedBox(),
          FadeInLeft(
            duration: const Duration(milliseconds: 900),
                child: Text(title, style: const TextStyle(
            color: ResColors.primary,
            fontSize: 30,
            fontWeight: FontWeight.bold
          ),)),
          const SizedBox(height: 20,),
         FadeInRight(
          duration: const Duration(milliseconds: 1200),
              child: Text(content, textAlign: TextAlign.center, style: const TextStyle(
            color: ResColors.grey,
            fontSize: 20,
            fontWeight: FontWeight.w400
          ),)),
          reverse ? 
          Column(
            children: <Widget>[
              const SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Image.asset(image),
              ),
            ],
          ) : const SizedBox(),
        ],
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 6,
      width: isActive ? 30 : 6,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: ResColors.secondary,
        borderRadius: BorderRadius.circular(5)
      ),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i<3; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }

    return indicators;
  }
}