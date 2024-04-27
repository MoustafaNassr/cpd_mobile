import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../custom_widget/social_card.dart';
import 'components/no_account_text.dart';
import '../../../../core/constant/assets.dart';
import '../../../../core/constant/colors.dart';
import '../../../../core/constant/size_config.dart';

import 'components/signin_form.dart';

class SignInScreen extends StatelessWidget {
  

  const SignInScreen({super.key});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return  Scaffold(
      backgroundColor: ResColors.primaryLight,
      // appBar:PreferredSize(
      //   preferredSize: Size.fromHeight(AppBar().preferredSize.height),
      //   child:const WelcomeHeader(title:"Skip")),
      body:SafeArea(child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child:SingleChildScrollView(
            child: Column(
              children: [
               
                
               SizedBox(height: SizeConfig.screenHeight * 0.08),
                const SignForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.03),
              FadeInLeft(duration:const Duration(milliseconds: 1900), child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     SocialCard(
                      icon: ResAssets.linkedin,
                      press: () { },
                    ),
                    SocialCard(
                      icon: ResAssets.google,
                      press: () { },
                    ),
                    SocialCard(
                      icon: ResAssets.facebook,
                      press: () {},
                    ),
                    SocialCard(
                      icon: ResAssets.apple,
                      press: () { },
                    ),
                    
                  ],
                )),
               SizedBox(height: getProportionateScreenHeight(20)),
                 FadeInRight(duration:const Duration(milliseconds: 1900), 
                child:const NoAccountText()),
              ],
            ),
          ),
        ),
      ),
    )
    );
  }
}
