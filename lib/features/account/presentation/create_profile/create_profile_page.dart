import 'package:esusu_savings/constant/widgets/app_bar.dart';
import 'package:esusu_savings/constant/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateProfilePage extends ConsumerWidget {
  const CreateProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: CustomBar(
        title: Text(
          "Create Your Profile",
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            child: Column(
              children: [
                PrimaryButton(
                  height: 54,
                  child: Text("Upload Profile"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
