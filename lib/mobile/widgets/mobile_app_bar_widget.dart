import 'package:catalogg/tablet/widgets/tablet_app_bar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MobileAppBarWidget extends StatefulWidget {
  const MobileAppBarWidget({super.key});

  @override
  State<MobileAppBarWidget> createState() => _MobileAppBarWidgetState();
}

class _MobileAppBarWidgetState extends State<MobileAppBarWidget> {
  List<String> _items = const [
    'Inglizcha',
    'Ruscha',
    'O\'zbekcha',
  ];
  String dropDownvalue = "O'zbekcha";
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      expandedHeight: 100,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
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
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Samarqand',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(width: 10),
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
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.blue,
                      size: 30,
                    ),
                  ),
                  const SizedBox(width: 10),
                  PopupMenuButton(
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        child: Row(
                          children: const [
                            Icon(
                              Icons.bookmark_outline,
                              size: 30,
                              color: Colors.blue,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Saqlanganlar',
                            ),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        child: Row(
                          children: const [
                            Icon(
                              CupertinoIcons.person,
                              size: 30,
                              color: Colors.blue,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Kirish',
                            ),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        child: Row(
                          children: [
                            const Icon(
                              Icons.g_translate_outlined,
                              color: Colors.blue,
                              size: 30,
                            ),
                            const SizedBox(width: 8),
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
                                    Navigator.pop(context);
                                  });
                                },
                                items: _items.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
