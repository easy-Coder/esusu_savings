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

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
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
                SvgPicture.asset('assets/palm-recognition.svg'),
                const Space(height: 20),
                const LoginForm(),
                // TODO: social media button
                const Space(height: 20),
                Row(children: [
                  const Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {
                      context.go('/signup');
                    },
                    child: const Text('Create Account'),
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
    final AsyncValue<void> state = ref.watch(authNotifierProvider);
    return Form(
      key: _formKey,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Log In",
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
            height: 20,
          ),
          PrimaryButton(
            onTap: state is AsyncLoading
                ? null
                : () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      ref.read(authNotifierProvider.notifier).signUserIn(
                          formValue['email']!, formValue['password']!);
                    }
                  },
            height: 54,
            child: state is AsyncLoading
                ? const CircularProgressIndicator()
                : const Text(
                    "Login",
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
