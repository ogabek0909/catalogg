import 'package:catalogg/models/category.dart';
import 'package:catalogg/screens/category_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../providers.dart/home_screen_provider.dart';
import 'company_item_widget.dart';

class DesktopCategoryItemWidget extends StatelessWidget {
  final Category category;
  const DesktopCategoryItemWidget({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final companies =
        Provider.of<HomeScreenProvider>(context, listen: false).allCompany;
    return Container(
      height: 550,
      margin: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
      child: Row(
        children: [
          Card(
            elevation: 10,
            color: Colors.transparent,
            child: Container(
              width: 450,
              padding: const EdgeInsets.only(
                top: 40,
                left: 40,
                right: 10,
                bottom: 10,
              ),
              decoration: BoxDecoration(
                color: Colors.white54,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(
                    category.littleImage,
                  ),
                  fit: BoxFit.cover,
                  // repeat: ImageRepeat.repeatX,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category.name.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 26,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () {
                      context.goNamed(
                        CategoryDetailScreen.routeName,
                        params: {
                          'categoryId': category.id.toString(),
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom( 
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 9,
                      ),
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Source Now',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 30),
          Expanded(
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: companies.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300,
                mainAxisExtent: 260,
                mainAxisSpacing: 30,
                crossAxisSpacing: 30,
              ),
              itemBuilder: (context, index) {
                return CompanyItemWidget(
                  company: companies[index],
                  categoryId: category.id,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
