import 'package:flutter/material.dart';

import '../../core/constant/colors.dart';


class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    this.text,
    this.press,
    this.width=50,
      this.textcolor=ResColors.primary,
      this.containerColor=ResColors.primary,
  }) : super(key: key);
  final String? text;
  final Function? press;
final double width;
final Color ?textcolor;
final Color ?containerColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 56,
      child: TextButton(
        style: TextButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),
               side:  BorderSide(color:containerColor!,width: 2)),
        
          
          
        ),
        onPressed: press as void Function()?,
        child: Text(
          text!,
          style: TextStyle(
            fontSize: 18,
            color: textcolor,
          ),
        ),
      ),
    );
  }
}
