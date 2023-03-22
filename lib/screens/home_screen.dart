import 'package:catalogg/desktop/screens/desktop_home_screen.dart';
import 'package:catalogg/mobile/screens/mobile_home_screen.dart';
import 'package:catalogg/providers.dart/home_screen_provider.dart';
import 'package:catalogg/responsive.dart';
import 'package:catalogg/tablet/tablet_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const routName = 'home-screen';

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Provider.of<HomeScreenProvider>(context, listen: false)
            .getHomeScreenData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
              ),
            );
          } else {
            return const ResponsiveLayout(
              mobile: MobileHomeScreen(),
              tablet: TabletHomeScreen(),
              desktop: DesktopHomeScreen(),
            );
          }
        });
  }
}
