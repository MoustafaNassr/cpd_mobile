
import 'package:animate_do/animate_do.dart';
import 'package:apex_cpd/core/theme/app_theme.dart';
import 'package:apex_cpd/presentation/screens/home/components/card.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../../../core/constant/size_config.dart';
import 'components/circle_chart.dart';
class HomeScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     SizeConfig().init(context);
    return  Scaffold(
     // extendBodyBehindAppBar: true,
       // appBar: AppBar(elevation: 0,),

          body:  Padding(padding: EdgeInsets.only(top:40,),child:  
          SingleChildScrollView(child:
          Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
  FadeInLeft(
              duration: const Duration(milliseconds: 700),
              child:    Text("My CPD summary",style: AppTheme.lightTheme.textTheme.headlineSmall!.copyWith(color:Colors.grey[500]),)),
                  
        FadeInRight(
              duration: const Duration(milliseconds: 700),
              child:   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children: [     Icon(Icons.access_time_rounded,color: Colors.grey[500],),
                      Text("CPD logged 2023/24",style: AppTheme.lightTheme.textTheme.headlineSmall!.copyWith(color:Colors.grey[500]),),
                      ])),
            FadeInLeft(
              duration: const Duration(milliseconds: 700),
              child: CircleChart()),
            
              FadeInRight(
              duration: const Duration(milliseconds: 700),
              child:CardLayout()),
              ]))));
    
  }
}

