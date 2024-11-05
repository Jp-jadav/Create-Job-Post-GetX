import 'package:get/get.dart';
import 'package:create_job_post_api/model/create_job_model.dart';

class ApiServices extends GetConnect {
  Future<CreateJobModel?> createJob(String name, String job) async {
    final response = await post("https://reqres.in/api/users", {
      "name": name,
      "job": job,
    });

    if (response.statusCode == 201 || response.statusCode == 200) {
      return CreateJobModel.fromJson(response.body);
    } else {
      throw Exception("Failed to create job");
    }
  }
}
