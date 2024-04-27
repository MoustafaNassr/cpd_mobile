import 'package:flutter/material.dart';

import '../../../core/constant/colors.dart';
import '../../../core/constant/size_config.dart';
import '../../../core/theme/app_theme.dart';
import '../../custom_widget/default_button.dart';
import '../../custom_widget/rounded_button.dart';



class AboutLoggingCpd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
      backgroundColor: ResColors.primary,
      title: Text("About logging CPD",
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
                "A CPD log provides a record of all the CPD activities you have undertaken. As such, it enables you to track your learning and development progress and identify any gaps in your skills or knowledge that you may want to fill.",
            style: AppTheme.lightTheme.textTheme.headlineSmall!  
              ),
              SizedBox(height: 16),
              Text(
                "As an ITI member, you have access to the free ITI CPD log. ITI recommends that all its individual members* undertake a minimum of 30 hours of CPD each membership year. Once you have recorded 30 hours on the ITI CPD log, you are awarded a certificate and a 'CPD Achieved' logo.",
               style: AppTheme.lightTheme.textTheme.headlineSmall!
              ),
      
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        // Handle "See what the CPD Certificate looks like" action
                      },
                      child: Text(
                        "See what the CPD Certificate looks like",
                        
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                  Icon(Icons.add,color: ResColors.secondary,),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        // Handle "See what the CPD Achieved logo looks like" action
                      },
                      child: Text(
                        "See what the CPD Achieved logo looks like",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                  Icon(Icons.add,color: ResColors.secondary,),
                ],
              ),
              SizedBox(height: 24),
              
                 
                  Center(child:   DefaultButton(
                radius: 20,
                containerColor: ResColors.secondary,
                textcolor: Colors.white,
                text: "Log your CPD",
                width: getProportionateScreenWidth(250),
                press: () {})),
                SizedBox(height: 24),
                Center(child: RoundedButton(
                text: "Download CPD User Guide",
                width: getProportionateScreenWidth(250),
                textcolor: ResColors.primary,
                containerColor: ResColors.secondary,
               
               ))
                 
                   
               
            ],
          ),
        ),
    
    );
  }
}