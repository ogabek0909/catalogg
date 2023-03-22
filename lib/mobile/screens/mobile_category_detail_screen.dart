import 'package:catalogg/desktop/widgets/category_detail_widget.dart';
import 'package:catalogg/desktop/widgets/company_item_widget.dart';
import 'package:catalogg/mobile/widgets/mobile_app_bar_widget.dart';
import 'package:catalogg/providers.dart/home_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MobileCategoryDetailScreen extends StatelessWidget {
  final int id;
  const MobileCategoryDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();
    final category = Provider.of<HomeScreenProvider>(context, listen: false)
        .allCategories
        .firstWhere((element) => element.id == id);

    final companies =
        Provider.of<HomeScreenProvider>(context, listen: false).allCompany;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          MobileAppBarWidget(),
          SliverToBoxAdapter(
            child: CategoryDetailWidget(item: category),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Korxonalar",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  itemCount: companies.length,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 400,
                    childAspectRatio: .8,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                  ),
                  itemBuilder: (context, index) => CompanyItemWidget(
                    company: companies[index],
                    categoryId: id,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
