import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constant/colors.dart';
import '../../../../../core/theme/app_theme.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Text(
          "Don’t have an account? ",
          style:AppTheme.lightTheme.textTheme.headlineSmall!.copyWith(color:Colors.grey[500]),
        ),
        GestureDetector(
          onTap: () => context.goNamed("signUp"),
          child:  Text(
            "Sign Up",
            style:AppTheme.lightTheme.textTheme.headlineMedium!.copyWith(color:ResColors.secondary))
        ),
      ],
    );
  }
}
