import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/error/exceptions.dart';
import '../../../core/constant/api_url.dart';
import '../../../core/constant/strings.dart';
import '../../../core/error/failures.dart';
import '../../../domain/usecases/user/sign_in_usecase.dart';
import '../../../domain/usecases/user/sign_up_usecase.dart';
import '../../../domain/usecases/user/update_profile_image_user_usecase.dart';
import '../../../domain/usecases/user/update_profile_user_usecase.dart';
import '../../models/user/authentication_response_model.dart';
import 'dart:developer' as developer;
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
abstract class UserRemoteDataSource {
  Future<AuthenticationResponseModel> signIn(SignInParams params);
  Future<AuthenticationResponseModel> signUp(SignUpParams params);
  Future<AuthenticationResponseModel> updateProfile(UpdateProfileParams params,String token);
 Future<AuthenticationResponseModel> updateProfileImage(UpdateProfileImageParams params,String token);

}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final http.Client client;
  UserRemoteDataSourceImpl({required this.client});

  @override
  Future<AuthenticationResponseModel> signIn(SignInParams params) async {
    final response =
        await client.post(Uri.parse('${ApiUrls.baseUrl}${ApiUrls.loginUrl}'),
            headers: {
              'Content-Type': 'application/json',
            },
            body: json.encode({
              'email': params.email,
              'password': params.password,
            }));
             developer.log(response.statusCode.toString());
            developer.log(response.body);
    if (response.statusCode == 200) {
      return authenticationResponseModelFromJson(response.body);
    } else if (response.statusCode == 400 || response.statusCode == 401) {
       Map<String, dynamic> decodeBody = jsonDecode(response.body);
    developer.log("this is ${decodeBody['message']}");
    String message = decodeBody['message'];

      throw CredentialFailure(errorMessage: message);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<AuthenticationResponseModel> signUp(SignUpParams params) async {
    final response =
        await client.post(Uri.parse('${ApiUrls.baseUrl}${ApiUrls.registerUrl}'),
            headers: {
              'Content-Type': 'application/json',
            },
            body: json.encode({
              'first_name': params.firstName,
              'last_name': params.lastName,
              'profession_title':params.professionTitle,
              'email': params.email,
              'password': params.password,
            }));
             developer.log(response.statusCode.toString());
            developer.log(response.body);
    if (response.statusCode == 200) {
      return authenticationResponseModelFromJson(response.body);
    } else if (response.statusCode == 400 || response.statusCode == 401) {
       Map<String, dynamic> decodeBody = jsonDecode(response.body);
    developer.log("this is ${decodeBody['message']}");
    String message = decodeBody['message'];

      throw CredentialFailure(errorMessage:message );
    } else {
      throw ServerException();
    }
  }
  @override
  Future<AuthenticationResponseModel> updateProfile(UpdateProfileParams params, token) async {
    final response =
        await client.post(Uri.parse('${ApiUrls.baseUrl}${ApiUrls.updateProfile}'),
            headers: {
              'Content-Type': 'application/json',
                'Authorization': 'Token $token',
            },
            body: json.encode({
              // 'first_name': params.firstName,
              // 'last_name': params.lastName,
              'profession_title':params.professionTitle,
              'email': params.email,
             // 'profile_image':
             
            }));
            developer.log('${ApiUrls.baseUrl}/api/edit_profile');
             developer.log(response.statusCode.toString());
            developer.log(response.body);
    if (response.statusCode == 200) {
      return authenticationResponseModelFromJson(response.body);
    } else if (response.statusCode == 400 || response.statusCode == 401) {
       Map<String, dynamic> decodeBody = jsonDecode(response.body);
    developer.log("this is ${decodeBody['message']}");
    String message = decodeBody['message'];

      throw CredentialFailure(errorMessage:message );
    } else {
      throw ServerException();
    }
  }
  @override
  Future<AuthenticationResponseModel> updateProfileImage(UpdateProfileImageParams params, token) async {
    
     var stream = new http.ByteStream(DelegatingStream.typed(params.image.openRead()));
      var length = await params.image.length();

      var uri = Uri.parse('${ApiUrls.baseUrl}${ApiUrls.updateProfile}');
 Map<String, String> headers = {
    'Content-Type': 'application/json',
      'Authorization': 'Token $token',
    }; 
     var request = new http.MultipartRequest("POST", uri);
      var multipartFile = new http.MultipartFile('file', stream, length,
          filename: basename(params.image.path));
          //contentType: new MediaType('image', 'png'));

      request.files.add(multipartFile);
       request.headers.addAll(headers);
      var response = await request.send();
      print(response.statusCode);
      String message;
      response.stream.transform(utf8.decoder).listen((value) {
        print(value);
        message=value;

      });
    // final response =
    //     await client.post(Uri.parse('${ApiUrls.baseUrl}${ApiUrls.updateProfile}'),
    //         headers: {
    //           'Content-Type': 'application/json',
    //             'Authorization': 'Token $token',
    //         },
    //         body: json.encode({
             
              
    //          // 'profile_image':
             
    //         }));
    //         developer.log('${ApiUrls.baseUrl}/api/edit_profile');
    //          developer.log(response.statusCode.toString());
    //         developer.log(response.body);
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
     developer.log(responseString);
    if (response.statusCode == 200) {
     
      return authenticationResponseModelFromJson(responseString);
    } else if (response.statusCode == 400 || response.statusCode == 401) {
       Map<String, dynamic> decodeBody = jsonDecode(responseString);
    developer.log("this is ${decodeBody['message']}");
    String message = decodeBody['message'];

      throw CredentialFailure(errorMessage:message );
    } else {
      throw ServerException();
    }
  }
}
