import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:animate_do/animate_do.dart';
import '../../../../../core/constant/assets.dart';
import '../../../../../core/constant/colors.dart';
import '../../../../../core/constant/strings.dart';
import '../../../../../core/constant/size_config.dart';
import '../../../../../core/theme/app_theme.dart';
import '../../../../../core/utils/validation.dart';
import '../../../../core/error/failures.dart';
import '../../../../domain/usecases/user/sign_in_usecase.dart';
import '../../../domain/usecases/user/update_profile_user_usecase.dart';
import '../../bloc/user/user_bloc.dart';
import '../../custom_widget/custom_surfix_icon.dart';
import '../../custom_widget/default_button.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _professionTitleController = TextEditingController();
  String? email;
  String? password;
  bool? remember = false;
  bool? _passwordVisible;
  bool _obscureText = true;
  bool showText = false;

  final List<String?> errors = [];

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        EasyLoading.dismiss();
        if (state is UserLoading) {
          EasyLoading.show(status: 'Loading...');
        } else if (state is UserLogged) {
         
         EasyLoading.show(status: 'Profile Updated');
        } else if (state is UserLoggedFail) {
          if (state.failure is CredentialFailure) {
            EasyLoading.showError(state.failure.errorMessage);
          } else {
            EasyLoading.showError(state.failure.errorMessage);
          }
        }
      },
      child:Scaffold(body: 
      Form(
      key: _formKey,
      child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child:BlocBuilder<UserBloc, UserState>(builder: (context, state) {
              if (state is UserLogged) {
                return Column(
        
        mainAxisAlignment: MainAxisAlignment.start,
       // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
           SizedBox(height: SizeConfig.screenHeight * 0.04),
          FadeInLeft(
              duration:const Duration(milliseconds: 1200),
              child: Text(
                "Edit your Account",
                style: AppTheme.lightTheme.textTheme.headlineLarge!
                    .copyWith(color: ResColors.primary),
              )),
          SizedBox(height: getProportionateScreenHeight(30)),
          FadeInRight(
              duration:const Duration(milliseconds: 1400),
              child: buildEmailFormField(state.user.email)),
          SizedBox(height: getProportionateScreenHeight(30)),
          //  FadeInDown(duration: Duration(milliseconds: 1500), child:
          //   buildPasswordFormField()),

          FadeInLeft(
              duration:const Duration(milliseconds: 1500),
              child: buildProfessionTitleFormField(state.user.professionTitle)),
          SizedBox(height: getProportionateScreenHeight(30)),
         
          SizedBox(height: getProportionateScreenHeight(30)),
         
          FadeInLeft(
              duration:const Duration(milliseconds: 1700),
              child: DefaultButton(
                radius: 20,
                containerColor: ResColors.secondary,
                textcolor: Colors.white,
                text: "Update",
                width: getProportionateScreenWidth(300),
                press: () {
                //  if (_formKey.currentState!.validate()) {
                  
                 //   _formKey.currentState!.save();
                      context.read<UserBloc>().add(UpdateProfileUser(UpdateProfileParams(
                              email: _emailController.text,
                              professionTitle: _professionTitleController.text,
                            )));

                   // context.pushNamed("mainNavigation");
                 // }
                },
              )),

        
        ],
      );}else{return Container();}})
    ))));
  }

 

  TextFormField buildEmailFormField(String email) {
    return TextFormField(
      style:const TextStyle(
        color: ResColors.primary,
      ),
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
    //  onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
         
          removeError(error: ResConstants.kEmailNullError);
        }
       
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: ResConstants.kEmailNullError);
          return ResConstants.kEmailNullError;
        }
        return null;
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        enabledBorder: const OutlineInputBorder(
            borderSide:  BorderSide(color:ResColors.primary, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color:ResColors.primary, width: 2.0),
          borderRadius: BorderRadius.circular(15.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ResColors.primary, width: 2.0),
          borderRadius: BorderRadius.circular(15.0),
        ),
        hintText: email,
        hintStyle: AppTheme.lightTheme.textTheme.headlineSmall!
            .copyWith(color: ResColors.primary),
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly

        prefixIcon: _emailController.text.isEmpty
            ? const CustomSurffixIcon(svgIcon: ResAssets.email)
            : const CustomSurffixIcon(svgIcon: ResAssets.email),
      ),
    );
  }
   TextFormField buildProfessionTitleFormField(String title) {
    return TextFormField(
      style:const TextStyle(
        color: ResColors.primary,
      ),
      controller: _professionTitleController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
         
          removeError(error: ResConstants.kEmailNullError);
        }
          
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: ResConstants.kEmailNullError);
          return ResConstants.kEmailNullError;
        }
        return null;
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        enabledBorder: const OutlineInputBorder(
            borderSide:  BorderSide(color:ResColors.primary, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color:ResColors.primary, width: 2.0),
          borderRadius: BorderRadius.circular(15.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ResColors.primary, width: 2.0),
          borderRadius: BorderRadius.circular(15.0),
        ),
        hintText: title,
        hintStyle: AppTheme.lightTheme.textTheme.headlineSmall!
            .copyWith(color: ResColors.primary),
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly

        prefixIcon: _emailController.text.isEmpty
            ? const CustomSurffixIcon(svgIcon: ResAssets.profile)
            : const CustomSurffixIcon(svgIcon: ResAssets.profile),
      ),
    );
  }
}
