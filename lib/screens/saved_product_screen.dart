import 'package:catalogg/desktop/screens/desktop_saved_screen.dart';
import 'package:catalogg/responsive.dart';
import 'package:flutter/material.dart';

class SavedProductScreen extends StatelessWidget {
  const SavedProductScreen({super.key});
  static const routeName = 'saved-product-screen';

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: Container(),
      tablet: Container(),
      desktop: DesktopSavedScreen(),
    );
  }
}
