import 'package:catalogg/desktop/widgets/desktop_slider_afisha_widget.dart';
import 'package:catalogg/mobile/widgets/mobile_app_bar_widget.dart';
import 'package:catalogg/mobile/widgets/mobile_category_item_widget.dart';
import 'package:catalogg/mobile/widgets/mobile_top_bar_widget.dart';
import 'package:catalogg/providers.dart/home_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MobileHomeScreen extends StatelessWidget {
  const MobileHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories =
        Provider.of<HomeScreenProvider>(context, listen: false).allCategories;
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          const MobileAppBarWidget(),
          const SliverToBoxAdapter(child: Divider()),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  SizedBox(
                    height: 530,
                    child: Row(
                      children: const [
                        Expanded(child: SliderWidget()),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  const SizedBox(
                    height: 530,
                    child: AfishaWidget(),
                  ),
                  SizedBox(
                    height: categories.length * 410,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) =>
                          MobileCategoryiItemWidget(
                        category: categories[index],
                      ),
                      itemCount: categories.length,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}