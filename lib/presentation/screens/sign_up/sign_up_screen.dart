
import 'package:flutter/material.dart';

import '../../../../core/constant/colors.dart';
import '../../custom_widget/social_card.dart';
import 'components/already_have_account.dart';
import '../../../../core/constant/assets.dart';
import '../../../../core/constant/size_config.dart';
import '../../../../core/theme/app_theme.dart';
import 'components/sign_up_form.dart';
import 'package:animate_do/animate_do.dart';
class SignUpScreen extends StatelessWidget {


  const SignUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
      SizeConfig().init(context);
    return Scaffold(
       backgroundColor: ResColors.primaryLight,
      //  appBar:PreferredSize(
      //   preferredSize: Size.fromHeight(AppBar().preferredSize.height),
      //   child:const WelcomeHeader(title:"Skip")),
      body: SingleChildScrollView(child: 
      SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 20,vertical: 30),
            child:  Column(
               // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                 // const SizedBox(height: 16),
                   FadeInRight(duration: const Duration(milliseconds: 1000), child: 
                   Text("Create your Account", 
                   style: AppTheme.lightTheme.textTheme.headlineLarge!.copyWith(color:
                    ResColors.primary),
                   )),
                  
                  SizedBox(height: getProportionateScreenHeight(20),),
                  const SignUpForm(),
                 // ResVGap.gap06,
                 FadeInLeft(duration: const Duration(milliseconds: 1800), child:   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     SocialCard(
                      icon: ResAssets.linkedin,
                      press: () { },
                    ),
                     SocialCard(
                      icon: ResAssets.google,
                      press: () {},
                    ),
                    SocialCard(
                      icon: ResAssets.facebook,
                      press: () {},
                    ),
                    
                    SocialCard(
                      icon: ResAssets.apple,
                      press: () {},
                    ),
                    ],
                 )),
                  SizedBox(height: getProportionateScreenHeight(10),),
                   FadeInRight(duration: const Duration(milliseconds: 1900), 
                 child:const AlreadyHaveAccountText())
                ],
              ),
            
          ),
      )),
      ),
    );
  }
}
