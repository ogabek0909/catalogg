import 'package:catalogg/desktop/screens/desktop_category_detail_screen.dart';
import 'package:catalogg/mobile/screens/mobile_category_detail_screen.dart';
import 'package:catalogg/providers.dart/home_screen_provider.dart';
import 'package:catalogg/responsive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryDetailScreen extends StatelessWidget {
  final int id;
  const CategoryDetailScreen({super.key,required this.id});
  static const routeName = 'category-detail-screen';

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
            child: Text(snapshot.error.toString()),
          );
        } else {
          return ResponsiveLayout(
            mobile: MobileCategoryDetailScreen(id: id),
            tablet: Container(),
            desktop: DesktopCategoryDetailScreen(id: id),
          );
        }
      },
    );
  }
}
