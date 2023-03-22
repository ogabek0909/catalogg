import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../screens/register_screen.dart';
import '../widgets/login_logo.dart';
import '../widgets/text_field.dart';

class DesktopLoginScreen extends StatefulWidget {
  const DesktopLoginScreen({super.key});

  @override
  State<DesktopLoginScreen> createState() => _DesktopLoginScreenState();
}

class _DesktopLoginScreenState extends State<DesktopLoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 30, top: 20),
                    child: Text(
                      'Kirish',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  TextFieldForm(
                    helperText: 'example@gmail.com',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Elektron pochta kiriting!';
                      }
                      return null;
                    },
                    controller: emailController,
                    hintText: 'Email',
                    perfixIcon: const Icon(Icons.email, color: Colors.blue),
                  ),
                  TextFieldForm(
                    helperText: '12345678',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Parol kiriting!';
                      }
                      return null;
                    },
                    controller: passwordController,
                    hintText: 'Parol',
                    perfixIcon: const Icon(Icons.lock, color: Colors.blue),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 150,
                        height: 45,
                        child: FilledButton(
                          onPressed: () {
                            context.goNamed(RegisterScreen.routeName);
                          },
                          child: const Text('Ro\'yxatdan o\'tish'),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        width: 150,
                        height: 45,
                        child: FilledButton(
                          onPressed: () {
                            if (!_formKey.currentState!.validate()) {
                              return;
                            }
                          },
                          child: const Text('Kirish'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            const Expanded(child: LoginLogoWidget()),
          ],
        ),
      ),
    );
  }
}
