import 'package:catalogg/providers.dart/home_screen_provider.dart';
import 'package:catalogg/screens/company_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../models/company.dart';

class CompanyItemWidget extends StatelessWidget {
  final Company company;
  final int categoryId;
  const CompanyItemWidget({
    super.key,
    required this.company,
    required this.categoryId,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.goNamed(
          CompanyDetailScreen.routeName,
          params: {
            'categoryId':categoryId.toString(),
            'companyId':company.id.toString(),
          }
        );
      },
      child: Card(
        elevation: 5,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(company.logo),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black26,
                  Colors.transparent,
                ],
              ),
            ),
            padding: const EdgeInsets.all(20),
            alignment: Alignment.bottomCenter,
            child: Text(
              company.name,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
