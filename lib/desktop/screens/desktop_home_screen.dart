import 'package:catalogg/desktop/widgets/desktop_app_bar_widget.dart';
import 'package:catalogg/desktop/widgets/desktop_category_item_widget.dart';
import 'package:catalogg/desktop/widgets/desktop_footer_widget.dart';
import 'package:catalogg/desktop/widgets/desktop_quotation_widget.dart';
import 'package:catalogg/desktop/widgets/desktop_slider_afisha_widget.dart';
import 'package:catalogg/desktop/widgets/desktop_top_bar_widget.dart';
import 'package:catalogg/providers.dart/home_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DesktopHomeScreen extends StatelessWidget {
  const DesktopHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories =
        Provider.of<HomeScreenProvider>(context, listen: false).allCategories;
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          const DesktopAppBarWidget(),
          const SliverToBoxAdapter(
            child: DesktopTopBarWidget(),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                const DesktopSliderAfishaWidget(),
                SizedBox(
                  height: categories.length * 580,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: categories.length,
                    itemBuilder: (context, index) => DesktopCategoryItemWidget(
                      category: categories[index],
                    ),
                  ),
                ),
                const DesktopQuotationWidget(),
                const DesktopFooterWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
