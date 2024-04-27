import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialCard extends StatelessWidget {
  const SocialCard({
    Key? key,
    this.icon,
    this.press,
  }) : super(key: key);

  final String? icon;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press as void Function()?,
      child: Container(
        margin:
            const EdgeInsets.symmetric(horizontal:10),
        padding: const EdgeInsets.all(12),
        height: 50,
        width: 50,
        decoration: BoxDecoration(
           border: Border.all(color: Colors.grey),
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: SvgPicture.asset(icon!),
      ),
    );
  }
}
