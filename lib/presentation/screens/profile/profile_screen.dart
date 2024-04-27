import 'dart:convert';
import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:apex_cpd/core/constant/assets.dart';
import 'package:apex_cpd/presentation/bloc/user/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../../../core/constant/api_url.dart';
import '../../../core/constant/colors.dart';
import '../../../core/error/failures.dart';
import '../../../data/data_source/local/user_local_data_source.dart';
import '../../../domain/usecases/user/update_profile_image_user_usecase.dart';
import 'components/profile_menu_widget.dart';
import 'package:image_picker/image_picker.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

Future<File> getImage() async {
  final ImagePicker _picker = ImagePicker();
// Pick an image
final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
//TO convert Xfile into file
File file = File(image!.path);
//print(‘Image picked’);
return file;}
  @override
  Widget build(BuildContext context) {
   return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        EasyLoading.dismiss();
        if (state is UserLoading) {
          EasyLoading.show(status: 'Loading...');
        } else if (state is UpdateProfileImageUser) {
         
         EasyLoading.show(status: 'image upload successfull...');
        } else if (state is UserLoggedFail) {
          if (state.failure is CredentialFailure) {
            EasyLoading.showError(state.failure.errorMessage);
          } else {
            EasyLoading.showError(state.failure.errorMessage);
          }
        }
      },
      child:
     Scaffold(
      appBar: AppBar( ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child:  Column(
            children: [


              /// -- IMAGE
              Stack(
                children: [
                 FadeInLeft(
              duration: const Duration(milliseconds: 700),
              child:   BlocBuilder<UserBloc, UserState>(builder: (context, state) {
              if (state is UserLogged) {
                return SizedBox(
                    width: 100,
                    height: 100,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                         // ignore: unnecessary_null_comparison
                         child:state.user.profile_image==ResAssets.user?  SvgPicture.asset(ResAssets.user):Image.network(state.user.profile_image)),
                 );}else{return Container();}})),
                     Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(borderRadius:
                       BorderRadius.circular(100), color: ResColors.primary),
                      child:  IconButton(
                     onPressed: (){getImage().then((value) => 
                       context.read<UserBloc>().add(UpdateProfileImageUser(UpdateProfileImageParams(
                            image: value
                             ))));},
                       icon:Icon( Icons.edit,
                        color: ResColors.secondary,
                        size: 20,
                      )),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              BlocBuilder<UserBloc, UserState>(builder: (context, state) {
              if (state is UserLogged) {
                return  Column(children: [ FadeInLeft(
              duration: const Duration(milliseconds: 700),
              child:  Text(state.user.firstName + state.user.lastName, style: Theme.of(context).textTheme.headline4)),
               FadeInLeft(
              duration: const Duration(milliseconds: 700),
              child:  Text(state.user.professionTitle, style: Theme.of(context).textTheme.bodyText2)),
              const SizedBox(height: 20),
              ],);}else{return Container();}}),
              
              /// -- BUTTON
               FadeInLeft(
              duration: const Duration(milliseconds: 700),
              child:  SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () => {context.pushNamed("editProfile")},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ResColors.primary, side: BorderSide.none, shape: const StadiumBorder()),
                  child: const Text("Edit Profile", style: TextStyle(color: ResColors.background)),
                ),
              )),
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 10),

              /// -- MENU
               FadeInLeft(
              duration: const Duration(milliseconds: 700),
              child: Column(children: [  ProfileMenuWidget(title: "My CPD summary", icon: Icons.remove_circle_outline, onPress: () {context.pushNamed("MyCpdSummary");}),
              ProfileMenuWidget(title: "Plannig and reviwing", icon: Icons.remove_circle_outline, onPress: () {context.pushNamed("PlanningReviewingCpd");}),
              ProfileMenuWidget(title: "About logging CPD", icon:Icons.remove_circle_outline, onPress: () {context.pushNamed("AboutLoggingCpd");}),])),
             
              const Divider(),
              const SizedBox(height: 10),
              FadeInRight(
              duration: const Duration(milliseconds: 700),
              child:       BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserLogged) {
                return  ProfileMenuWidget(
                  title: "Logout",
                  icon: Icons.logout,
                  textColor: Colors.red,
                  endIcon: false,
                  onPress: () {
                     context.read<UserBloc>().add(SignOutUser());

                    context.pushNamed("signIn");
                   
                  });} else {
                return const SizedBox();
              }
}))
            ],
          )
        ),
      ),
    ));
  }
//    updateProfileImage( params) async {
   
//      var stream = new http.ByteStream(DelegatingStream.typed(params.image.openRead()));
//       var length = await params.image.length();
//  final String token = await localDataSource.getToken();
//       var uri = Uri.parse('${ApiUrls.baseUrl}${ApiUrls.updateProfile}');
//  Map<String, String> headers = {
//       "Accept": "application/json",
//       "Authorization": "Token  $token"
//     }; 
//      var request = new http.MultipartRequest("POST", uri);
//       var multipartFile = new http.MultipartFile('file', stream, length,
//           filename: basename(params.image.path));
//           //contentType: new MediaType('image', 'png'));

//       request.files.add(multipartFile);
//        request.headers.addAll(headers);
//       var response = await request.send();
//       print(response.statusCode);
//       String message;
//       response.stream.transform(utf8.decoder).listen((value) {
//         print(value);
//         message=value;

//       });
//     // final response =
//     //     await client.post(Uri.parse('${ApiUrls.baseUrl}${ApiUrls.updateProfile}'),
//     //         headers: {
//     //           'Content-Type': 'application/json',
//     //             'Authorization': 'Token $token',
//     //         },
//     //         body: json.encode({
             
              
//     //          // 'profile_image':
             
//     //         }));
//     //         developer.log('${ApiUrls.baseUrl}/api/edit_profile');
//     //          developer.log(response.statusCode.toString());
//     //         developer.log(response.body);
//     // if (response.statusCode == 200) {
//     //   return authenticationResponseModelFromJson(response.);
//     // } else if (response.statusCode == 400 || response.statusCode == 401) {
//     //    Map<String, dynamic> decodeBody = jsonDecode(response.body);
//     // developer.log("this is ${decodeBody['message']}");
//     // String message = decodeBody['message'];

//     //   throw CredentialFailure(errorMessage:message );
//     // } else {
//     //   throw ServerException();
//     // }
//   }
}