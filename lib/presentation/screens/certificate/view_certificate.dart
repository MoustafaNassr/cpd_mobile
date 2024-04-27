import 'package:animate_do/animate_do.dart';
import 'package:apex_cpd/core/constant/size_config.dart';
import 'package:apex_cpd/core/theme/app_theme.dart';
import 'package:apex_cpd/presentation/custom_widget/default_button.dart';
import 'package:apex_cpd/presentation/custom_widget/rounded_button.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/colors.dart';
import '../../../data/models/cpd/cpd_model.dart';

class ViewCertificate extends StatefulWidget {
  final CpdDataModel ?cpd;
  const ViewCertificate({super.key,this.cpd});

  @override
  // ignore: library_private_types_in_public_api
  _ViewCertificateState createState() => _ViewCertificateState();
}

class _ViewCertificateState extends State<ViewCertificate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.only(
          top: getProportionateScreenHeight(50),
          right: getProportionateScreenWidth(30),
          left: getProportionateScreenWidth(30)),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            Text("Legal Translation at UIT",
                style: AppTheme.lightTheme.textTheme.headlineLarge!
                    .copyWith(color: ResColors.primary)),
            Text(
              "CPD type  ",
              style: AppTheme.lightTheme.textTheme.headlineSmall!,
            ),
            Text("Formal Learning",
                style: AppTheme.lightTheme.textTheme.headlineSmall!
                    .copyWith(color: ResColors.darkerGrey)),
            Text("Hours logged",
                style: AppTheme.lightTheme.textTheme.headlineSmall),
            Text("24 Hours",
                style: AppTheme.lightTheme.textTheme.headlineSmall!
                    .copyWith(color: ResColors.darkerGrey)),
            Text("Skills area ",
                style: AppTheme.lightTheme.textTheme.headlineSmall),
            Text("Translation skills ",
                style: AppTheme.lightTheme.textTheme.headlineSmall!
                    .copyWith(color: ResColors.darkerGrey)),
            Text("Date activity completed  ",
                style: AppTheme.lightTheme.textTheme.headlineSmall),
            Text("4 october 2023",
                style: AppTheme.lightTheme.textTheme.headlineSmall!
                    .copyWith(color: ResColors.darkerGrey)),
            Text(
              "Format of training",
              style: AppTheme.lightTheme.textTheme.headlineSmall,
            ),
            Text("Perparing and  delivering a course on legal translation.",
                style: AppTheme.lightTheme.textTheme.headlineSmall!
                    .copyWith(color: ResColors.darkerGrey)),
                      Text(
              "CPD cost",
              style: AppTheme.lightTheme.textTheme.headlineSmall,
            ),
            Text("123",
                style: AppTheme.lightTheme.textTheme.headlineSmall!
                    .copyWith(color: ResColors.darkerGrey)),
                      Text(
              "What did you learn note",
              style: AppTheme.lightTheme.textTheme.headlineSmall,
            ),
            Text("Perparing and  delivering a course on legal translation.",
                style: AppTheme.lightTheme.textTheme.headlineSmall!
                    .copyWith(color: ResColors.darkerGrey)),
                      Text(
              "Future development notes",
              style: AppTheme.lightTheme.textTheme.headlineSmall,
            ),
            Text("Perparing and  delivering a course on legal translation.",
                style: AppTheme.lightTheme.textTheme.headlineSmall!
                    .copyWith(color: ResColors.darkerGrey)),

                    Row(children: [
                     
                      DefaultButton(
                radius: 20,
                containerColor: ResColors.secondary,
                textcolor: Colors.white,
                text: "Delete",
                width: getProportionateScreenWidth(150),
                press: () {}),
                SizedBox(width: getProportionateScreenWidth(10),),
               RoundedButton(
                text: "Edit Record",
                width: getProportionateScreenWidth(150),
                textcolor: ResColors.primary,
                containerColor: ResColors.secondary,
               
               )
                ],)
          ]),
    ));
  }
}
