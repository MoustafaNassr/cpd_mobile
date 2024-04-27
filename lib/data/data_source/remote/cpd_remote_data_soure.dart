
import 'dart:convert';

import 'package:apex_cpd/core/constant/api_url.dart';
import 'package:apex_cpd/data/models/cpd/cpd_model.dart';
import 'package:http/http.dart' as http;

import '../../../../core/error/exceptions.dart';
import '../../../core/constant/strings.dart';
import '../../../core/error/failures.dart';
import '../../../domain/usecases/cpd/add_cpd_usecase.dart';

abstract class CpdRemoteDataSource {
  Future<CpdDataModel> addCpd(AddCpdDataModelParams params, String token);
  Future<List<CpdDataModel>> getCpds(String token);
}

class CpdRemoteDataSourceSourceImpl implements CpdRemoteDataSource {
  final http.Client client;
  CpdRemoteDataSourceSourceImpl({required this.client});

  @override
  Future<CpdDataModel> addCpd(AddCpdDataModelParams params, token) async {
    final response = await client.post(
      Uri.parse('${ApiUrls.baseUrl}/create_cpd_item'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Token $token',
      },
      body:   json.encode({
           "date": params.date,
                            "title": params.title,
                            "type": params.type,
                            "skills_area":params.skills_area,
                            "format_of_training":params.format_of_training,
                            "hours_logged":params.hours_logged,
                            "date_completed": params.date_completed,
                            "cost_of_cpd":params.cost_of_cpd,
                            "what_did_you_learn": params.what_did_you_learn,
                            "future_dev_nots": params.future_dev_nots,
                            "file": params.file
      }),
    );
    if (response.statusCode == 200) {
      return cpdModelFromJson(response.body);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<CpdDataModel>> getCpds(String token) async {
    final response = await client.get(
      Uri.parse('${ApiUrls.baseUrl}/list_my_cpd_items'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Token $token',
      },
    );
    if (response.statusCode == 200) {
      return cpdModelListFromJson(response.body);
    } else {
      throw ServerFailure(errorMessage: response.body);
    }
  }
}
