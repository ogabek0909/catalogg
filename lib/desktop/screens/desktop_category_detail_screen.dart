import 'package:catalogg/desktop/widgets/category_detail_widget.dart';
import 'package:catalogg/desktop/widgets/desktop_category_menu_widget.dart';
import 'package:catalogg/desktop/widgets/desktop_footer_widget.dart';
import 'package:catalogg/providers.dart/home_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/company_item_widget.dart';
import '../widgets/desktop_app_bar_widget.dart';
import '../widgets/desktop_top_bar_widget.dart';

class DesktopCategoryDetailScreen extends StatelessWidget {
  final int id;
  const DesktopCategoryDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final category = Provider.of<HomeScreenProvider>(context, listen: false)
        .allCategories
        .firstWhere(
          (element) => element.id == id,
        );
    final companies =
        Provider.of<HomeScreenProvider>(context, listen: false).allCompany;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const DesktopAppBarWidget(),
          const SliverToBoxAdapter(
            child: DesktopTopBarWidget(),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                CategoryDetailWidget(
                  item: category,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 26),
                  child: Row(
                    children: [
                      DesktopCategoryMenuWidget(id: id),
                      const SizedBox(width: 32),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Kompaniyalar',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(0, 0, 0, 1),
                              ),
                            ),
                            SizedBox(
                              height: 770,
                              child: GridView.builder(
                                itemCount: companies.length,
                                gridDelegate:
                                    const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 300,
                                  mainAxisExtent: 260,
                                  mainAxisSpacing: 30,
                                  crossAxisSpacing: 30,
                                ),
                                itemBuilder: (context, index) =>
                                    CompanyItemWidget(
                                  categoryId: category.id,
                                  company: companies[index],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const DesktopFooterWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
