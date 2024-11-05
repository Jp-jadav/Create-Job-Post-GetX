import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../contoller/job_controller.dart';

class JobCreationScreen extends StatelessWidget {
  final JobController jobController = Get.put(JobController());
  final TextEditingController nameController = TextEditingController();
  final TextEditingController jobControllerText = TextEditingController();

  JobCreationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Job"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(hintText: "Enter Name"),
            ),
            TextField(
              controller: jobControllerText,
              decoration: const InputDecoration(hintText: "Enter Job"),
            ),
            const SizedBox(height: 20),
            Obx(() => ElevatedButton(
                  onPressed: () {
                    jobController.createJob(
                        nameController.text, jobControllerText.text);
                  },
                  child: jobController.isLoading.value
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text("Create Job"),
                )),
            const SizedBox(height: 20),
            Obx(() {
              if (jobController.job.value.name != null) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("ID: ${jobController.job.value.id}"),
                    Text("Name: ${jobController.job.value.name}"),
                    Text("Job: ${jobController.job.value.job}"),
                    Text("Created At: ${jobController.job.value.createdAt}"),
                  ],
                );
              } else {
                return const Text("No job created yet.");
              }
            }),
          ],
        ),
      ),
    );
  }
}
