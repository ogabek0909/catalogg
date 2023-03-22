import 'package:catalogg/screens/login_screen.dart';
import 'package:catalogg/screens/saved_product_screen.dart';
import 'package:catalogg/screens/shopping_cart_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DesktopAppBarWidget extends StatefulWidget {
  const DesktopAppBarWidget({super.key});

  @override
  State<DesktopAppBarWidget> createState() => _DesktopAppBarWidgetState();
}

class _DesktopAppBarWidgetState extends State<DesktopAppBarWidget> {
  List<String> _items = const [
    'Inglizcha',
    'Ruscha',
    'O\'zbekcha',
  ];
  String searchDropDownValue = 'm';
  String dropDownvalue = 'O\'zbekcha';
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      expandedHeight: 105,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    color: Colors.white54,
                    height: 64,
                    width: 64,
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
              const SizedBox(width: 15),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(right: 10),
                  height: 45,
                  // color: Colors.pink,
                  child: Container(
                    // height: 42,
                    // width: 700,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextField(
                      style: const TextStyle(fontSize: 15),
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        border: InputBorder.none,
                        prefixIcon: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: DropdownButton(
                            focusColor: Colors.transparent,
                            underline: Container(),
                            elevation: 0,
                            value: searchDropDownValue,
                            items: const [
                              DropdownMenuItem(
                                value: 'm',
                                child: Text(
                                  'Mahsulotlar bo\'yicha',
                                  style: TextStyle(fontSize: 32 / 2),
                                ),
                              ),
                              DropdownMenuItem(
                                value: 'k',
                                child: Text('Korxona bo\'yicha'),
                              ),
                            ],
                            onChanged: (value) {
                              setState(() {
                                searchDropDownValue = value!;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      context.goNamed(ShoppingCartScreen.routeName);
                    },
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
                      items:
                          _items.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
