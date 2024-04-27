
import 'package:apex_cpd/core/constant/assets.dart';
import 'package:apex_cpd/presentation/screens/home/components/swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_theme.dart';
class CardLayout extends StatelessWidget {
  const CardLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 390,
      decoration: BoxDecoration(
      //  color: primaryColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(35),
          bottomRight: Radius.circular(35),
        ),
      ),
      child: Column(
        children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ 
          SvgPicture.asset(ResAssets.folderDarkColored),
           Text("Latest document",
        style: AppTheme.lightTheme.textTheme.headlineSmall!
        .copyWith(color:Colors.grey[500])),]),
          // HeightSpacer(myHeight: kSpacing),
          // const HeaderWidgets(),
          // HeightSpacer(myHeight: kSpacing / 2),
          const SwiperBuilder(),
        ],
      ),
    );
  }
}