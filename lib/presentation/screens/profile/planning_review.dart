import 'package:flutter/material.dart';

import '../../../core/constant/colors.dart';
import '../../../core/theme/app_theme.dart';



class PlanningReviewingCpd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
      backgroundColor: ResColors.primary,
      title: Text("Planning and reviewing",
      style: AppTheme.lightTheme.textTheme.headlineSmall!
      .copyWith(
        fontSize: 20,
        color: ResColors.background),),),
     
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "ITI recommends that members should complete a minimum of 30 hours of CPD membership year.\nBut CPD is not just about the hours you put in the most important part is what you get ou\nPlan, do, review - making CPD work for you\nTo make the most of the CPD activities you undertake, follow these simple steps in the CPD",
              style: AppTheme.lightTheme.textTheme.headlineSmall! ),
              SizedBox(height: 16),
           
            ],
          ),
        ),
      
    );
  }
}