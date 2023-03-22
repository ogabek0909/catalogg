import 'package:catalogg/desktop/screens/desktop_add_new_product_screen.dart';
import 'package:catalogg/screens/add_new_product_screen.dart';
import 'package:catalogg/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DesktopTopBarWidget extends StatelessWidget {
  const DesktopTopBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(height: 4),
        Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: Row(
            children: [
              txtButton(
                buttonName: 'Asosiy Sahifa',
                onPressed: () {
                  context.goNamed(HomeScreen.routName);
                },
              ),
              txtButton(
                buttonName: 'Ishlab Chiqaruvchilar',
                onPressed: () {
                  context.goNamed(AddNewProductScreen.routeName);
                },
              ),
              txtButton(
                buttonName: 'Mahsulotlar',
                onPressed: () {},
              ),
              txtButton(
                buttonName: 'Yangiliklar',
                onPressed: () {},
              ),
            ],
          ),
        ),
        const Divider(height: 4),
      ],
    );
  }

  Widget txtButton({
    required String buttonName,
    required VoidCallback onPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.only(right: 55),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          buttonName,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
