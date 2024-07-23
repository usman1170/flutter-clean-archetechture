// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:mvvm/resources/colors.dart';
import 'package:mvvm/resources/round_button.dart';
import 'package:mvvm/view_models/auth_view_model.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final ValueNotifier<bool> _obsPass = ValueNotifier<bool>(true);
  bool isLoading = false;
  FocusNode emailFocusNode = FocusNode();
  FocusNode passFocusNode = FocusNode();
  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    emailFocusNode.dispose();
    passFocusNode.dispose();
    _obsPass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("Sign Up top build");
    final authViewModel = Provider.of<AuthViewModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: authViewModel.signUpLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Welcome Again!",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: Row(
                      children: [
                        Text(
                          "Enter details to Login.",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            letterSpacing: .4,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  _inputField(),
                  const SizedBox(
                    height: 16,
                  ),
                  _inputField(ispassword: true),
                  const SizedBox(
                    height: 36,
                  ),
                  BasicButton(
                    ontap: () async {
                      Map data = {
                        "email": _email.text.toString(),
                        "password": _password.text.toString()
                      };
                      authViewModel.signUpApi(data, context);
                    },
                    height: 55,
                    width: MediaQuery.of(context).size.width,
                    color: cyan,
                    title: "Sign Up",
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
    );
  }

  Widget _inputField({
    bool ispassword = false,
  }) {
    return ValueListenableBuilder(
        valueListenable: _obsPass,
        builder: (context, value, child) {
          return TextField(
            controller: ispassword ? _password : _email,
            obscureText: ispassword ? value : false,
            focusNode: ispassword ? passFocusNode : emailFocusNode,
            onSubmitted: (value) {
              FocusScope.of(context)
                  .requestFocus(ispassword ? null : passFocusNode);
            },
            keyboardType:
                ispassword ? TextInputType.text : TextInputType.emailAddress,
            decoration: InputDecoration(
              fillColor: Colors.white.withOpacity(.5),
              filled: true,
              hintText: ispassword ? "Enter your password" : "Enter your email",
              hintStyle: const TextStyle(
                color: Colors.black87,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              prefixIcon: ispassword
                  ? const Icon(
                      Icons.lock,
                      color: cyan,
                    )
                  : const Icon(
                      Icons.email,
                      color: cyan,
                    ),
              suffixIcon: ispassword
                  ? Padding(
                      padding: const EdgeInsets.only(right: 6),
                      child: InkWell(
                        onTap: () {
                          _obsPass.value = !_obsPass.value;
                        },
                        child: Icon(
                          value ? Icons.visibility : Icons.visibility_off,
                          color: cyan,
                        ),
                      ),
                    )
                  : const SizedBox(),
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 1),
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: cyan.shade800),
              ),
            ),
          );
        });
  }
}
