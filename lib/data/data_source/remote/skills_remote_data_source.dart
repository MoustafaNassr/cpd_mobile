
import 'package:apex_cpd/core/constant/api_url.dart';
import 'package:apex_cpd/data/models/cpd/cpd_model.dart';
import 'package:http/http.dart' as http;

import '../../../../core/error/exceptions.dart';
import '../../../core/constant/strings.dart';
import '../../../core/error/failures.dart';
import '../../models/skills/skills_model.dart';
import 'dart:developer'  as dev;
abstract class SkillsRemoteDataSource {
 
  Future<List<SkillsModel>> getSkills();
}

class SkillsRemoteDataSourceSourceImpl implements SkillsRemoteDataSource {
  final http.Client client;
 SkillsRemoteDataSourceSourceImpl({required this.client});



  @override
  Future<List<SkillsModel>> getSkills() async {
    final response = await client.get(
      Uri.parse('${ApiUrls.baseUrl}/api/get_skills_area'),
      headers: {
        'Content-Type': 'application/json',
       
      },
    );
    dev.log(response.body);
     dev.log(response.statusCode.toString());
    if (response.statusCode == 200) {
      return skillsModelListFromJson(response.body);
    } else {
      throw ServerFailure(errorMessage: response.body);
    }
  }
}
