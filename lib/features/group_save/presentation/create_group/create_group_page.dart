import 'package:esusu_savings/constant/enum.dart';
import 'package:esusu_savings/constant/error/error.dart';
import 'package:esusu_savings/constant/widgets/app_bar.dart';
import 'package:esusu_savings/constant/widgets/button.dart';
import 'package:esusu_savings/constant/widgets/input_field.dart';
import 'package:esusu_savings/constant/widgets/space.dart';
import 'package:esusu_savings/features/authenticate/repositries/auth_repositry.dart';
import 'package:esusu_savings/features/group_save/domain/group/group.dart';
import 'package:esusu_savings/features/group_save/presentation/create_group/create_group_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final groupTypeProvider = StateProvider<GroupsType?>((ref) {
  return null;
});

final formProvider = StateProvider<Map<String, dynamic>>((ref) {
  return {};
});

class CreateGroupPage extends ConsumerStatefulWidget {
  const CreateGroupPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateGroupPageState();
}

class _CreateGroupPageState extends ConsumerState<CreateGroupPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final currentOption = ref.watch(groupTypeProvider);
    ref.listen<AsyncValue>(
      createGroupNotifierProvider,
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
    final state = ref.watch(createGroupNotifierProvider);
    final user = ref.watch(authRepositryProvider).user;
    final formValue = ref.watch(formProvider);
    return Scaffold(
      appBar: CustomBar(title: Text("Create Group")),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: AbsorbPointer(
                  absorbing: state is AsyncLoading,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Name"),
                        Space(
                          height: 10,
                        ),
                        InputFormField(
                          hintText: "e.g Monthly savings",
                          validator: (value) {
                            if (value == null) {
                              return "You must provide group name";
                            }
                            return null;
                          },
                          onSaved: (newValue) =>
                              _saveFormInput("name", newValue),
                        ),
                        Space(
                          height: 20,
                        ),
                        Text("Participant Amount"),
                        Space(
                          height: 10,
                        ),
                        InputFormField(
                          hintText: "Amount of participants e.g 10",
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null) {
                              return "must not be exceed.";
                            }
                            final intValue = int.tryParse(value);
                            if (intValue == null) {
                              return "must be a number";
                            } else if (intValue < 0 || intValue > 50) {
                              return "members must not be 0 nor exceed 50";
                            }
                            return null;
                          },
                          onSaved: (newValue) => _saveFormInput(
                              "total_participant", int.tryParse(newValue!)),
                        ),
                        Space(
                          height: 20,
                        ),
                        Text("Group Type"),
                        Space(
                          height: 10,
                        ),
                        SelectableOptions(
                          onSelected: (option) {
                            ref.read(groupTypeProvider.state).state =
                                option as GroupsType;
                          },
                          currentOption: currentOption,
                          options: [
                            SelectableOption(
                              height: 160,
                              width: 160,
                              value: GroupsType.rotational,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                        "assets/Loop_Left_Rotation_Icon.png"),
                                    Text(
                                      "Rotational",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              color: Color(0xffE20E08),
                            ),
                            SelectableOption(
                              height: 160,
                              width: 160,
                              value: GroupsType.goals,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset("assets/Goal_Icon.png"),
                                  Text(
                                    "Goal Oriented",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              color: Color(0xff5BBC02),
                            ),
                          ],
                        ),
                        if (currentOption == GroupsType.rotational) ...[
                          Space(
                            height: 20,
                          ),
                          Text("Amount Save"),
                          Space(
                            height: 10,
                          ),
                          InputFormField(
                            hintText:
                                "Amount each participants will save e.g ₦10,000",
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null) {
                                return "must not be exceed.";
                              }
                              final intValue = double.tryParse(value);
                              if (intValue == null) {
                                return "must be a number";
                              }
                              return null;
                            },
                            onSaved: (newValue) => _saveFormInput(
                                "saving_amount", double.tryParse(newValue!)),
                          ),
                        ],
                        if (currentOption == GroupsType.goals) ...[
                          Space(
                            height: 20,
                          ),
                          Text("Savings Goal"),
                          Space(
                            height: 10,
                          ),
                          InputFormField(
                            hintText: "Amount to reach e.g ₦10,000",
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null) {
                                return "must not be exceed.";
                              }
                              final intValue = double.tryParse(value);
                              if (intValue == null) {
                                return "must be a number";
                              }
                              return null;
                            },
                            onSaved: (newValue) => _saveFormInput(
                                "saving_goal", double.tryParse(newValue!)),
                          ),
                          Space(
                            height: 20,
                          ),
                          Text("Duration"),
                          Space(
                            height: 10,
                          ),
                          InputDatePickerFormField(
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2023),
                            fieldHintText: "Saving period",
                            // keyboardType: TextInputType.datetime,
                            onDateSaved: (value) => _saveFormInput(
                                "duration", value.toIso8601String()),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ),
            PrimaryButton(
              child: state is AsyncLoading
                  ? Text(
                      "Creating saving plan...",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    )
                  : Text(
                      "Create Saving Plan",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
              onTap: () {
                if (!(state is AsyncLoading)) {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    var group;
                    if (currentOption == GroupsType.goals) {
                      final savingAmount = formValue['saving_goal']! /
                          formValue["total_participant"];
                      final newFormValue = {
                        ...formValue,
                        'saving_amount': savingAmount,
                        'type': currentOption!.name,
                        'author': user!.uid,
                      };
                      group = Group.fromJson(newFormValue);
                    } else {
                      group = Group.fromJson({
                        ...formValue,
                        'type': currentOption!.name,
                        'author': user!.uid,
                      });
                    }
                    print(group.toJson());
                    try {
                      ref
                          .read(createGroupNotifierProvider.notifier)
                          .create_group(group);
                      _formKey.currentState!.reset();
                      ref.read(formProvider.state).state = {};
                      ref.read(groupTypeProvider.state).state = null;
                      context.pop();
                    } catch (e) {}
                  }
                }
              },
              height: 56,
            )
          ],
        ),
      ),
    );
  }

  _saveFormInput(String key, dynamic value) {
    ref.read(formProvider.state).state[key] = value!;
  }
}

class SelectableOptions extends StatelessWidget {
  final List<SelectableOption> options;
  final Function(Object option) onSelected;
  final Object? currentOption;

  const SelectableOptions(
      {Key? key,
      this.options = const [],
      required this.onSelected,
      this.currentOption})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Space(
          width: 10,
        ),
        ...options.expand((widget) => [
              Builder(builder: (context) {
                bool isSelected =
                    (currentOption != null) && (currentOption == widget.value);
                return GestureDetector(
                  onTap: () {
                    if (currentOption != widget.value) {
                      onSelected(widget.value);
                    }
                  },
                  child: widget..isSelected = isSelected,
                );
              }),
              Space(
                width: 10,
              ),
            ])
      ],
    );
  }
}

class SelectableOption extends StatelessWidget {
  SelectableOption(
      {Key? key,
      required this.height,
      required this.width,
      required this.child,
      required this.color,
      this.isSelected = false,
      required this.value})
      : super(key: key);

  final double height;
  final double width;
  final Object value;
  final Widget child;
  final Color color;
  bool isSelected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      width: isSelected ? width + 2 : width,
      height: isSelected ? height + 2 : height,
      decoration: BoxDecoration(
        border: Border.all(
          width: isSelected ? 4.0 : 0.0,
          color: color,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
        boxShadow: isSelected
            ? Theme.of(context).brightness == Brightness.light
                ? [
                    BoxShadow(
                      color: Color.fromARGB(255, 167, 167, 167),
                      blurRadius: 4.0,
                      spreadRadius: 2.0,
                    )
                  ]
                : [
                    BoxShadow(
                      color: Color.fromARGB(255, 82, 82, 82),
                      blurRadius: 4.0,
                      spreadRadius: 2.0,
                    )
                  ]
            : null,
        color: color,
      ),
      child: Center(child: child),
    );
  }
}
