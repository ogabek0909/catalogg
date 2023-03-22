import 'package:catalogg/providers.dart/home_screen_provider.dart';
import 'package:catalogg/screens/company_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../models/company.dart';

class CompanyItemWidget extends StatefulWidget {
  final Company company;
  final int categoryId;
  const CompanyItemWidget({
    super.key,
    required this.company,
    required this.categoryId,
  });

  @override
  State<CompanyItemWidget> createState() => _CompanyItemWidgetState();
}

class _CompanyItemWidgetState extends State<CompanyItemWidget> {
  bool mouse = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          mouse = true;
        });
      },
      onExit: (event) {
        setState(() {
          mouse = false;
        });
      },
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        onTap: () {
          context.goNamed(
            CompanyDetailScreen.routeName,
            params: {
              'categoryId':widget.categoryId.toString(),
              'companyId':widget.company.id.toString(),
            }
          );
        },
        child: Padding(
          padding: mouse ?EdgeInsets.zero : const EdgeInsets.all(8),
          child: Card(
            elevation: 5,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.company.logo),
                  fit: BoxFit.fill,
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
                  widget.company.name,
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
        ),
      ),
    );
  }
}
