import 'package:esusu_savings/constant/error/error.dart';
import 'package:esusu_savings/constant/widgets/button.dart';
import 'package:esusu_savings/constant/widgets/input_field.dart';
import 'package:esusu_savings/constant/widgets/space.dart';
import 'package:esusu_savings/features/authenticate/presentation/auth_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

final formProvider = StateProvider<Map<String, String>>((ref) {
  return {};
});

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SvgPicture.asset('assets/sign-up-formiLLus.svg'),
                const Space(height: 20),
                const LoginForm(),
                // TODO: social media button
                const Space(height: 20),
                Row(children: [
                  const Text("Have an account?"),
                  TextButton(
                    onPressed: () {
                      context.go('/login');
                    },
                    child: const Text('Log In'),
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue>(
      authNotifierProvider,
      (_, state) => state.whenOrNull(
        error: (error, stackTrace) =>
            ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              (error as CustomException).message,
            ),
          ),
        ),
      ),
    );
    final formValue = ref.watch(formProvider);
    final AsyncValue<void> state = ref.watch(authNotifierProvider);
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Create Account",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Space(
            height: 30.0,
          ),
          InputFormField(
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null) {
                return "Please enter your email";
              }
              return null;
            },
            hintText: "Email Address",
            onSaved: (value) => _saveFormInput('email', value),
          ),
          const Space(
            height: 10.0,
          ),
          InputFormField(
            hintText: "Password",
            obscureText: true,
            onSaved: (value) => _saveFormInput('password', value),
            validator: (value) {
              if (value == null) {
                return "Please enter your password";
              } else {
                if (value.length < 6 && value.length > 32) {
                  return "Your password character must be between 6 and 32";
                }
              }
              return null;
            },
          ),
          const Space(
            height: 10.0,
          ),
          InputFormField(
            hintText: "Confirm Password",
            obscureText: true,
            validator: (value) {
              if (value == null) {
                return "Please enter your password again";
              } else {
                if (!value.contains(formValue["password"]!)) {
                  return "Your passwords must match";
                }
              }
              return null;
            },
          ),
          const Space(
            height: 20,
          ),
          PrimaryButton(
            onTap: state is AsyncLoading
                ? null
                : () {
                    _formKey.currentState!.save();
                    if (_formKey.currentState!.validate()) {
                      ref.read(authNotifierProvider.notifier).createUser(
                          formValue['email']!, formValue['password']!);
                    }
                  },
            height: 54,
            child: state is AsyncLoading
                ? const CircularProgressIndicator.adaptive()
                : const Text(
                    "Create Account",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFFf6f6ff),
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  _saveFormInput(String key, String? value) {
    ref.read(formProvider.state).state[key] = value!;
  }
}
