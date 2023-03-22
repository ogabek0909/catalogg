import 'package:catalogg/desktop/screens/desktop_shopping_cart_screen.dart';
import 'package:catalogg/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({super.key});
  static const routeName = 'shopping-cart';

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: Container(),
      tablet: Container(),
      desktop: DesktopShoppingCartScreen(),
    );
  }
}
