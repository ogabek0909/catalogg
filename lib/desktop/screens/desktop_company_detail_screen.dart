import 'package:catalogg/desktop/widgets/desktop_app_bar_widget.dart';
import 'package:catalogg/desktop/widgets/desktop_company_menu_widget.dart';
import 'package:catalogg/desktop/widgets/desktop_product_item_widget.dart';
import 'package:catalogg/desktop/widgets/desktop_top_bar_widget.dart';
import 'package:catalogg/providers.dart/home_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DesktopCompanyDetailScreen extends StatelessWidget {
  final int categoryId;
  final int companyId;
  const DesktopCompanyDetailScreen({
    super.key,
    required this.categoryId,
    required this.companyId,
  });

  @override
  Widget build(BuildContext context) {
    final company = Provider.of<HomeScreenProvider>(context, listen: false)
        .allCompany
        .firstWhere(
          (element) => element.id == companyId,
        );
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const DesktopAppBarWidget(),
          const SliverToBoxAdapter(
            child: DesktopTopBarWidget(),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const DesktopCompanyMenuWidget(),
                  const SizedBox(width: 30),
                  Expanded(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: GridView.builder(
                        itemCount: 8,
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 300,
                          mainAxisExtent: 360,
                          mainAxisSpacing: 30,
                          crossAxisSpacing: 30,
                        ),
                        itemBuilder: (context, index) =>
                            const DesktopProductItemWidget(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
