
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constant/assets.dart';
import '../../../../../core/constant/colors.dart';
import '../../../../../core/constant/strings.dart';
import '../../../../../core/constant/size_config.dart';
import '../../../../../core/theme/app_theme.dart';
import 'package:animate_do/animate_do.dart';

import '../../../../core/error/failures.dart';
import '../../../../domain/usecases/user/sign_up_usecase.dart';
import '../../../bloc/user/user_bloc.dart';
import '../../../custom_widget/custom_surfix_icon.dart';
import '../../../custom_widget/default_button.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _fNameController = TextEditingController();
  final TextEditingController _lNameController = TextEditingController();
  final TextEditingController _professionTitleController = TextEditingController();

  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? email;
  String? password;
  final List<String?> errors = [];
  bool? _passwordVisible;
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
         
         context.pushNamed("signIn");
        } else if (state is UserLoggedFail) {
          if (state.failure is CredentialFailure) {
            EasyLoading.showError(state.failure.errorMessage);
          } else {
            EasyLoading.showError(state.failure.errorMessage);
          }
        }
      },
      child: SingleChildScrollView(
        child: Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FadeInLeft(
              duration: const Duration(milliseconds: 1200),
              child: Row(children: [
                Flexible(child: buildFirstNameFormField()),
                SizedBox(width: getProportionateScreenWidth(10)),
                Flexible(child: buildLastNameFormField()),
              ])),
          SizedBox(height: getProportionateScreenHeight(30)),
          FadeInRight(
              duration: const Duration(milliseconds: 1300),
              child: buildProfessionTitleFormField()),
          SizedBox(height: getProportionateScreenHeight(30)),
          FadeInLeft(
              duration: const Duration(milliseconds: 1400),
              child: buildEmailFormField()),
          SizedBox(height: getProportionateScreenHeight(30)),
          FadeInRight(
              duration: const Duration(milliseconds: 1500),
              child: buildPasswordFormField()),
          SizedBox(height: getProportionateScreenHeight(30)),

         
         // ResVGap.gap06,
          FadeInLeft(
              duration: const Duration(milliseconds: 1600),
              child: DefaultButton(
                radius: 20,
                containerColor: ResColors.primary,
                textcolor: Colors.grey,
                text: "Sign up",
                width: getProportionateScreenWidth(390),
                press: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                  context.read<UserBloc>().add(SignUpUser(SignUpParams(
                                firstName: _fNameController.text,
                                lastName: _lNameController.text,
                                professionTitle:  _professionTitleController.text,
                                email: _emailController.text,
                                password: _passwordController.text,
                              )));

                    //
                  }
                },
              )),
         // ResVGap.gap06,
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: FadeInRight(
                duration: const Duration(milliseconds: 1700),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 20),
                      child: Text(
                        'Or continue with',
                        style: AppTheme.lightTheme.textTheme.headlineSmall!
                            .copyWith(color: Colors.grey[500]),
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
    )));
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      style: const TextStyle(color: ResColors.primary),
      controller: _fNameController,
      onSaved: (newValue) => firstName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: ResConstants.kFNamelNullError);
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: ResConstants.kFNamelNullError);
          return ResConstants.kFNamelNullError;
        }
        return null;
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color:ResColors.primary, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: ResColors.primary, width: 2.0),
          borderRadius: BorderRadius.circular(15.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ResColors.primary, width: 2.0),
          borderRadius: BorderRadius.circular(15.0),
        ),
        hintText: "First Name",
        prefixIcon: const CustomSurffixIcon(svgIcon: ResAssets.profile),
        hintStyle: AppTheme.lightTheme.textTheme.headlineSmall!
            .copyWith(color: ResColors.primary),
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextFormField buildProfessionTitleFormField() {
    return TextFormField(
      style: const TextStyle(color: ResColors.primary),
      controller:_professionTitleController,
      keyboardType: TextInputType.text,
      onSaved: (newValue) => phoneNumber = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: ResConstants.kPhoneNumberNullError);
        } else if (value.length >= 8) {
          removeError(error: ResConstants.kPhoneNumberNullError);
        }

        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: ResConstants.kPhoneNumberNullError);
          return ResConstants.kPhoneNumberNullError;
        } else if (value.length < 8) {
          addError(error: ResConstants.kPhoneNumberNullError);
          return ResConstants.kPhoneNumberNullError;
        }
        return null;
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color:ResColors.primary, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: ResColors.primary, width: 2.0),
          borderRadius: BorderRadius.circular(15.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ResColors.primary, width: 2.0),
          borderRadius: BorderRadius.circular(15.0),
        ),
        prefixIcon: const CustomSurffixIcon(svgIcon: ResAssets.profile),
        hintText: "Profession Title",
        hintStyle: AppTheme.lightTheme.textTheme.headlineSmall!
            .copyWith(color: ResColors.primary),
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextFormField buildLastNameFormField() {
    return TextFormField(
      style: const TextStyle(color: ResColors.primary),
      controller:_lNameController,
      onSaved: (newValue) => lastName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: ResConstants.kLNamelNullError);
        }

        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: ResConstants.kLNamelNullError);
          return ResConstants.kLNamelNullError;
        }
        return null;
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: ResColors.primary, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        border: OutlineInputBorder(
          borderSide:
              const BorderSide(color: ResColors.primary, width: 2.0),
          borderRadius: BorderRadius.circular(15.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ResColors.primary, width: 2.0),
          borderRadius: BorderRadius.circular(15.0),
        ),

        hintText: "Last Name",
        prefixIcon: const CustomSurffixIcon(svgIcon: ResAssets.profile),
        hintStyle: AppTheme.lightTheme.textTheme.headlineSmall!
            .copyWith(color: ResColors.primary),
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      style: const TextStyle(color: ResColors.primary),
      obscureText: !_passwordVisible!,
      controller: _passwordController,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: ResConstants.kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: ResConstants.kShortPassError);
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
            borderSide: BorderSide(color: ResColors.primary, width: 2.0),
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
            .copyWith(color: ResColors.primary),
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly

        prefixIcon: const CustomSurffixIcon(svgIcon: ResAssets.lock),
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
      style: const TextStyle(color: ResColors.primary),
      controller: _emailController,
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
            borderSide: BorderSide(color: ResColors.primary, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: ResColors.primary, width: 2.0),
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

        prefixIcon: const CustomSurffixIcon(svgIcon: ResAssets.email),
      ),
    );
  }
}
