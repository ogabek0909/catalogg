import 'package:catalogg/desktop/screens/desktop_company_detail_screen.dart';
import 'package:catalogg/providers.dart/home_screen_provider.dart';
import 'package:catalogg/responsive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CompanyDetailScreen extends StatelessWidget {
  final int categoryId;
  final int companyId;
  const CompanyDetailScreen({
    super.key,
    required this.categoryId,
    required this.companyId,
  });
  static const routeName = 'company-detail-screen';

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<HomeScreenProvider>(context, listen: false)
          .getHomeScreenData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
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
            mobile: Container(),
            tablet: Container(),
            desktop:  DesktopCompanyDetailScreen(
              categoryId: categoryId,
              companyId: companyId,
            ),
          );
        }
      },
    );
  }
}
