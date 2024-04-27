
import 'package:apex_cpd/core/constant/api_url.dart';
import 'package:http/http.dart' as http;

import '../../../core/error/failures.dart';
import '../../models/training/training_model.dart';

abstract class TrainingFormatRemoteDataSource {
 
  Future<List<TrainingFormatModel>> getTrainingFormat();
}

class TrainingFormatRemoteDataSourceSourceImpl implements TrainingFormatRemoteDataSource {
  final http.Client client;
 TrainingFormatRemoteDataSourceSourceImpl({required this.client});



  @override
  Future<List<TrainingFormatModel>> getTrainingFormat() async {
    final response = await client.get(
      Uri.parse('${ApiUrls.baseUrl}/api/get_format_of_training'),
      headers: {
        'Content-Type': 'application/json',
       
      },
    );
    if (response.statusCode == 200) {
      return trainingFormatModelListFromJson(response.body);
    } else {
      throw ServerFailure(errorMessage: response.body);
    }
  }
}
