import 'package:flutter/material.dart';

import '../../../core/constant/colors.dart';
import '../../../core/theme/app_theme.dart';


class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    this.text,
    this.press,
    this.radius,
    this.width=50,
    this.textcolor=Colors.white,
    this.containerColor=ResColors.primary,
  }) : super(key: key);
  final String? text;
  final Function? press;
final double width;
final double ?radius;
final Color textcolor,containerColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:width,
      height: 56,
      child: TextButton(
        style: TextButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius!)),
        //  primary: Colors.white,
          backgroundColor: containerColor,
        ),
        onPressed: press as void Function()?,
        child: Text(
          text!,
          style: AppTheme.lightTheme.textTheme.headlineMedium!.copyWith(color:Colors.white)
        ),
      ),
    );
  }
}
