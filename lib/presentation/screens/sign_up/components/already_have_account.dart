import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/constant/colors.dart';

import '../../../../../core/theme/app_theme.dart';

class AlreadyHaveAccountText extends StatelessWidget {
  const AlreadyHaveAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Text(
          "Already have an account? ",
           style:AppTheme.lightTheme.textTheme.headlineSmall!.copyWith(color:Colors.grey[500]),
        ),
        GestureDetector(
          onTap: () => context.goNamed("signIn"),
          child:  Text(
            "Sign In",
                   style:AppTheme.lightTheme.textTheme.headlineMedium!.copyWith(color:ResColors.secondary))
     
        ),
      ],
    );
  }
}
