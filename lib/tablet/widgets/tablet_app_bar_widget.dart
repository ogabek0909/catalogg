import 'package:catalogg/providers.dart/home_screen_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../screens/login_screen.dart';
import '../../screens/saved_product_screen.dart';

class TableAppBarWidget extends StatefulWidget {
  const TableAppBarWidget({super.key});

  @override
  State<TableAppBarWidget> createState() => _TableAppBarWidgetState();
}

class _TableAppBarWidgetState extends State<TableAppBarWidget> {
  String dropDownvalue = 'O\'zbekcha';
  List<String> _items = const [
    'Inglizcha',
    'Ruscha',
    'O\'zbekcha',
  ];
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 100,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 64,
                      height: 64,
                      child: Image.network(
                        'https://telegra.ph/file/276e293154d27c194cc8c.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Made in',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'Samarqand',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.blue,
                        size: 35,
                      ),
                    ),
                    const SizedBox(width: 15),
                    IconButton(
                      onPressed: () {
                        context.goNamed(SavedProductScreen.routeName);
                      },
                      icon: const Icon(
                        Icons.bookmark_border_outlined,
                        color: Colors.blue,
                        size: 35,
                      ),
                    ),
                    const SizedBox(width: 15),
                    TextButton.icon(
                      onPressed: () {
                        context.goNamed(LoginScreen.routeName);
                      },
                      icon: const Icon(
                        CupertinoIcons.person,
                        color: Colors.blue,
                        size: 35,
                      ),
                      label: const Text(
                        'Kirish',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    const Icon(
                      Icons.g_translate_outlined,
                      color: Colors.blue,
                      size: 35,
                    ),
                    const SizedBox(width: 12),
                    Container(
                      height: 32,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: const EdgeInsets.all(4),
                      child: DropdownButton(
                        focusColor: Colors.transparent,
                        value: dropDownvalue,
                        elevation: 0,
                        underline: Container(),
                        onChanged: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            dropDownvalue = value!;
                          });
                        },
                        items: _items
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        showSearch(
                            context: context, delegate: MySearchDelegate());
                      },
                      icon: const Icon(
                        Icons.search,
                        size: 30,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MySearchDelegate extends SearchDelegate {
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(
        Icons.arrow_back,
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          }
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget buildResults(BuildContext context) {
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = Provider.of<HomeScreenProvider>(context, listen: false)
        .allCategories
        .where((element) {
      final result = element.name.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(suggestions[index].name),
        onTap: () {
          query = suggestions[index].name;
        },
      ),
    );
  }
}
