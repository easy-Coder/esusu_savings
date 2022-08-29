import 'package:esusu_savings/constant/error/error.dart';
import 'package:esusu_savings/constant/widgets/app_bar.dart';
import 'package:esusu_savings/constant/widgets/button.dart';
import 'package:esusu_savings/constant/widgets/input_field.dart';
import 'package:esusu_savings/constant/widgets/space.dart';
import 'package:esusu_savings/features/account/domain/user.dart';
import 'package:esusu_savings/features/account/presentation/create_profile/create_profile_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final formProvider = StateProvider<Map<String, dynamic>>((ref) {
  return {};
});

class CreateProfilePage extends ConsumerStatefulWidget {
  const CreateProfilePage({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateProfilePageState();
}

class _CreateProfilePageState extends ConsumerState<CreateProfilePage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue>(
      createProfileProvider,
      (_, state) => state.whenOrNull(
        error: (error, stackTrace) {
          error = error as CustomException;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                error.message,
              ),
            ),
          );
        },
      ),
    );
    final formValue = ref.watch(formProvider);
    final AsyncValue<void> state = ref.watch(createProfileProvider);
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
            key: _formKey,
            child: Column(
              children: [
                InputFormField(
                  hintText: "First Name",
                  validator: ((value) {
                    if (value!.isEmpty) {
                      return "must provide your first name.";
                    }
                    return null;
                  }),
                  onSaved: (value) => _saveFormInput('first_name', value),
                ),
                const Space(
                  height: 10,
                ),
                InputFormField(
                  hintText: "Surname",
                  validator: ((value) {
                    if (value!.isEmpty) {
                      return "must provide your surname.";
                    }
                    return null;
                  }),
                  onSaved: (value) => _saveFormInput('surname', value),
                ),
                const Space(
                  height: 10,
                ),
                InputFormField(
                  keyboardType: TextInputType.number,
                  obscureText: true,
                  hintText: "BVN: xxxxxxxxxx",
                  validator: ((value) {
                    final numRegExp =
                        RegExp(r'^(([0-9]*)|(([0.9]*)([0-9]*)))$');
                    if (value!.isEmpty) {
                      return "must provide your bank verification number.";
                    } else if (value.length != 10) {
                      return "must not exceed 10 characters";
                    } 
                    return null;
                  }),
                  onSaved: (value) => _saveFormInput('bvn', value),
                ),
                const Space(
                  height: 10,
                ),
                InputFormField(
                  hintText: "Address",
                  validator: ((value) {
                    if (value!.isEmpty) {
                      return "must provide your address.";
                    }
                    return null;
                  }),
                  onSaved: (value) => _saveFormInput('address', value),
                ),
                const Space(
                  height: 10,
                ),
                InputFormField(
                  hintText: "State",
                  validator: ((value) {
                    if (value!.isEmpty) {
                      return "must provide your state.";
                    }
                    return null;
                  }),
                  onSaved: (value) => _saveFormInput('state', value),
                ),
                const Space(height: 20,),
                PrimaryButton(
                  onTap: state is AsyncLoading
                      ? null
                      : () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            ref
                                .read(createProfileProvider.notifier)
                                .createProfile(AppUser.fromJson({
                                  ...formValue,
                                  'date_created': DateTime.now().toIso8601String()
                                }));
                          }
                        },
                  height: 54,
                  child: state is AsyncLoading
                      ? const CircularProgressIndicator()
                      : const Text(
                          "Upload Profile",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFFf6f6ff),
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _saveFormInput(String key, String? value) {
    ref.read(formProvider.state).state[key] = value!;
  }
}
