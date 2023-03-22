import 'package:catalogg/desktop/screens/desktop_register_screen.dart';
import 'package:catalogg/responsive.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  static const routeName = 'register-screen';

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: Container(),
      tablet: Container(),
      desktop:const DesktopRegisterScreen(),
    );
  }
}
