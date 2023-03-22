import 'package:catalogg/desktop/screens/desktop_login_screen.dart';
import 'package:catalogg/responsive.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static const routeName = 'login-screen';

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: Container(),
      tablet: Container(),
      desktop: DesktopLoginScreen(),
    );
  }
}
