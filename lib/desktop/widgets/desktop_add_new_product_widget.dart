import 'package:catalogg/providers.dart/home_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:provider/provider.dart';

class DesktopAddNewProductWidget extends StatefulWidget {
  const DesktopAddNewProductWidget({super.key});

  @override
  State<DesktopAddNewProductWidget> createState() =>
      _DesktopAddNewProductWidgetState();
}

class _DesktopAddNewProductWidgetState
    extends State<DesktopAddNewProductWidget> {
  int? dropDownvalue;
  @override
  Widget build(BuildContext context) {
    final categories =
        Provider.of<HomeScreenProvider>(context, listen: false).allCategories;
    quill.QuillController _quillController = quill.QuillController.basic();
    return Padding(
      padding: const EdgeInsets.all(60),
      child: DefaultTabController(
        length: 3,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: 500,
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: Colors.grey,
                  indicatorColor: Colors.orange,
                  labelColor: Colors.orange,
                  unselectedLabelColor: Colors.black,
                  labelStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 119, 115, 115),
                  ),
                  tabs: [
                    Tab(text: 'Uzbek'),
                    Tab(text: 'Enlish'),
                    Tab(text: 'Pусский'),
                  ],
                ),
              ),
              const SizedBox(height: 55),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: TabBarView(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Name (Uz)',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 15),
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Yangi mahsulot',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 70),
                        const Text(
                          'Tasvirlash (Uz)',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Container(
                          height: 300,
                          padding: const EdgeInsets.only(top: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[300],
                            border: Border.all(color: Colors.blue),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 3,
                                child: quill.QuillToolbar.basic(
                                  controller: _quillController,
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Divider(),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Container(
                                  color: Colors.white,
                                  margin: const EdgeInsets.all(16),
                                  child: quill.QuillEditor.basic(
                                    controller: _quillController,
                                    readOnly: false,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 60),
                        const Text(
                          'Mahsulot taxrirlash',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.blue,
                            ),
                          ),
                          padding: const EdgeInsets.all(8),
                          child: DropdownButton(
                            focusColor: Colors.transparent,
                            icon: null,
                            underline: const SizedBox(),
                            value: dropDownvalue ?? categories[0].id,
                            items: categories
                                .map(
                                  (e) => DropdownMenuItem(
                                    value: e.id,
                                    child: Text(e.name),
                                  ),
                                )
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                dropDownvalue = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    Container(),
                    Container(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
