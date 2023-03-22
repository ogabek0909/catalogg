import 'package:flutter/material.dart';
import '../../models/category.dart';

class CategoryDetailWidget extends StatelessWidget {
  final Category item;
  const CategoryDetailWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    print(item.bigImage);
    return Container(
      height: 500,
      width: double.infinity,
      decoration: BoxDecoration(
        // color: Colors.black12,
        image: DecorationImage(
          image: NetworkImage(
            item.bigImage,
          ),
          fit: BoxFit.cover,
        ),
      ),
      alignment: Alignment.bottomLeft,
      padding: const EdgeInsets.all(40),
      child: FittedBox(
        child: Text(
          item.name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 70,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
