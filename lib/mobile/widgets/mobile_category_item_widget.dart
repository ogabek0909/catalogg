import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:catalogg/models/category.dart';

import '../../screens/category_detail_screen.dart';

class MobileCategoryiItemWidget extends StatefulWidget {
  final Category category;
  const MobileCategoryiItemWidget({
    Key? key,
    required this.category
  }) : super(key: key);

  @override
  State<MobileCategoryiItemWidget> createState() => _MobileCategoryiItemWidgetState();
}

class _MobileCategoryiItemWidgetState extends State<MobileCategoryiItemWidget> {
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
      child: Padding(
          padding: mouse ? const EdgeInsets.all(8.0): EdgeInsets.zero,
        child: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          hoverColor: Colors.transparent,
          onTap: () {
            context.goNamed(
              CategoryDetailScreen.routeName,
              params: {
                'categoryId': widget.category.id.toString(),
              },
            );
          },
          child: Card(
            child: Container(
              height: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(widget.category.littleImage),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.category.name.toUpperCase(),
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
                            'categoryId': widget.category.id.toString(),
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
          ),
        ),
      ),
    );
  }
}
