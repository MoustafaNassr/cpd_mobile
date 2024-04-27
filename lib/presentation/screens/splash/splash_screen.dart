import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constant/assets.dart';
import '../../../../core/constant/colors.dart';
import '../../../../core/constant/size_config.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  Splash createState() => Splash();
}

class Splash extends State<SplashScreen>  {
late Timer timer;
  @override
  void initState() {
    super.initState();
  timer = Timer(
          const  Duration(seconds: 1),
                () => context.pushNamed("signIn"));
            
  }
  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }
  @override
  Widget build(BuildContext context) {
   SizeConfig().init(context);
    return Scaffold(
         backgroundColor: ResColors.background,
      body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      
        Align(
          alignment: Alignment.center,
          child:SvgPicture.asset(
          ResAssets.logo,
          height: getProportionateScreenHeight(55),
          width: getProportionateScreenWidth(55),
        ),
        ),
        // Align( alignment: Alignment.center, 
        //                child:Text(
        //   "Tooin",
        //   style: TextStyle(
        //     fontSize: getProportionateScreenWidth(36),
        //     color: ResColors.primary,
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),
        // )
      ],
    )
    
      
       
        
        
        
       
    
    );
  }}