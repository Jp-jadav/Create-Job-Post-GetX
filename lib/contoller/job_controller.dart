import 'package:create_job_post_api/services/api_services.dart';
import 'package:get/get.dart';

import '../model/create_job_model.dart';

class JobController extends GetxController {
  var isLoading = false.obs;
  var job = CreateJobModel().obs;

  void createJob(String name, String job) async {
    try {
      isLoading(true);
      var result = await ApiServices().createJob(name, job);
      if (result != null) {
        this.job.value = result;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }
}
