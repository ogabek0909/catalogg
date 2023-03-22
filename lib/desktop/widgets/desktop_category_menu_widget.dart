
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers.dart/home_screen_provider.dart';

class DesktopCategoryMenuWidget extends StatelessWidget {
  final int id;
  const DesktopCategoryMenuWidget({super.key,required this.id});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 770,
        width: 247,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                height: 72,
                child: const Text(
                  'Elements:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => const Divider(
                    height: 0,
                  ),
                  itemCount:
                      Provider.of<HomeScreenProvider>(context, listen: false)
                          .allCategories
                          .length,
                  itemBuilder: (context, index) => ListTile(
                    minVerticalPadding: 0,
                    title: Text(
                      Provider.of<HomeScreenProvider>(context,listen: false)
                          .allCategories[index]
                          .name,
                      style: Provider.of<HomeScreenProvider>(context,listen: false)
                          .allCategories[index].id != id ? const TextStyle(
                        fontWeight: FontWeight.w500,
                      ): const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    contentPadding: EdgeInsets.zero,
                    onTap: () {
                      // context.goNamed(
                      //   CategoryScreen.routeName,
                      //   params: {
                      //     'categoryId': Provider.of<HomeScreenProvider>(context,listen: false)
                      //         .allCategories[index]
                      //         .id
                      //         .toString(),
                      //   },
                      // );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
