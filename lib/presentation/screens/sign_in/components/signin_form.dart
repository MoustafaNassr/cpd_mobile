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
import '../../../bloc/user/user_bloc.dart';
import '../../../custom_widget/custom_surfix_icon.dart';
import '../../../custom_widget/default_button.dart';

class SignForm extends StatefulWidget {
  const SignForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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
         
         context.pushNamed("mainNavigation");
        } else if (state is UserLoggedFail) {
          if (state.failure is CredentialFailure) {
            EasyLoading.showError(state.failure.errorMessage);
          } else {
            EasyLoading.showError(state.failure.errorMessage);
          }
        }
      },
      child:Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // SizedBox(height: SizeConfig.screenHeight * 0.04),
          FadeInLeft(
              duration:const Duration(milliseconds: 1200),
              child: Text(
                "Login to your Account",
                style: AppTheme.lightTheme.textTheme.headlineLarge!
                    .copyWith(color: ResColors.primary),
              )),
          SizedBox(height: getProportionateScreenHeight(30)),
          FadeInRight(
              duration:const Duration(milliseconds: 1400),
              child: buildEmailFormField()),
          SizedBox(height: getProportionateScreenHeight(30)),
          //  FadeInDown(duration: Duration(milliseconds: 1500), child:
          //   buildPasswordFormField()),

          FadeInLeft(
              duration:const Duration(milliseconds: 1500),
              child: buildTextField(
                  ResAssets.lock,
                  "password",
                  _passwordController,
                  Validation().passwordValidator,
                  true,
                  false,
                  true)),
          SizedBox(height: getProportionateScreenHeight(30)),
          FadeInRight(
              duration:const Duration(milliseconds: 1600),
              child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                GestureDetector(
                    onTap: () =>context.goNamed("forgetPassword"),

                  child: Text(
                    "Forgot the Password?",
                    style: AppTheme.lightTheme.textTheme.headlineSmall!
                    .copyWith(color: ResColors.secondary),
                  ),
                )
              ])),
          SizedBox(height: getProportionateScreenHeight(30)),
         
          FadeInLeft(
              duration:const Duration(milliseconds: 1700),
              child: DefaultButton(
                radius: 20,
                containerColor: ResColors.secondary,
                textcolor: Colors.white,
                text: "Sign In",
                width: getProportionateScreenWidth(300),
                press: () {
                  if (_formKey.currentState!.validate()) {
                  
                    _formKey.currentState!.save();
                      context.read<UserBloc>().add(SignInUser(SignInParams(
                              email: _emailController.text,
                              password: _passwordController.text,
                            )));

                   // context.pushNamed("mainNavigation");
                  }
                },
              )),

          // FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: FadeInRight(
                duration:const Duration(milliseconds: 1800),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Or continue with',
                        style: AppTheme.lightTheme.textTheme.headlineSmall!
                            .copyWith(
                                color: const Color.fromRGBO(158, 158, 158, 1)),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    ));
  }

  Widget buildTextField(
      String svgIcon,
      String hintText,
      TextEditingController controller,
      String? Function(String?)? validate,
      bool isPassword,
      bool isPhone,
      bool isEmail) {
    return TextFormField(
      style: const TextStyle(color: ResColors.primary,),
      onChanged: isPassword ? Validation().changePass : null,
      obscureText: isPassword ? _obscureText : showText,
      controller: controller,
      validator: validate,
      keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color:  ResColors.primary, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: ResColors.primary, width: 2.0),
          borderRadius: BorderRadius.circular(15.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ResColors.primary, width: 2.0),
          borderRadius: BorderRadius.circular(15.0),
        ),
        hintText: hintText,
        hintStyle: AppTheme.lightTheme.textTheme.headlineSmall!
            .copyWith(color: ResColors.primary),
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly

        prefixIcon: CustomSurffixIcon(svgIcon: svgIcon),
        suffixIcon: isPassword
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  
                  });
                },
                child: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                ),
              )
            : null,
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      style:const TextStyle(color: ResColors.primary),
      obscureText: !_passwordVisible!,
      controller: _passwordController,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: ResConstants.kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: ResConstants.kShortPassError);
        }
        if (value.isNotEmpty && _emailController.text.isNotEmpty) {
        
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: ResConstants.kPassNullError);
          return ResConstants.kPassNullError;
        } else if (value.length < 8) {
          addError(error: ResConstants.kShortPassError);
          return ResConstants.kShortPassError;
        }
        return null;
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        enabledBorder: const OutlineInputBorder(
            borderSide:  BorderSide(color: ResColors.primary, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: ResColors.primary, width: 2.0),
          borderRadius: BorderRadius.circular(15.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ResColors.primary, width: 2.0),
          borderRadius: BorderRadius.circular(15.0),
        ),
        hintText: "Password",
        hintStyle: AppTheme.lightTheme.textTheme.headlineSmall!
            .copyWith(color:ResColors.primary),
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly

        prefixIcon: _emailController.text.isEmpty
            ? const CustomSurffixIcon(svgIcon: ResAssets.lock)
            : const CustomSurffixIcon(svgIcon: ResAssets.lock),
        suffixIcon: IconButton(
          icon: Icon(
            // Based on passwordVisible state choose the icon
            _passwordVisible! ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey[500],
          ),
          onPressed: () {
            // Update the state i.e. toogle the state of passwordVisible variable
            setState(() {
              _passwordVisible = !_passwordVisible!;
            });
          },
        ),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      style:const TextStyle(
        color: ResColors.primary,
      ),
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
         
          removeError(error: ResConstants.kEmailNullError);
        }
        if (value.isNotEmpty && _passwordController.text.isNotEmpty) {
          
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
        hintText: "Email",
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
}
