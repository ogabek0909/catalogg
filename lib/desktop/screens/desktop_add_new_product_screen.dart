import 'package:catalogg/desktop/widgets/desktop_add_new_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class DesktopAddNewProductScreen extends StatefulWidget {
  const DesktopAddNewProductScreen({super.key});

  @override
  State<DesktopAddNewProductScreen> createState() =>
      _DesktopAddNewProductScreenState();
}

class _DesktopAddNewProductScreenState
    extends State<DesktopAddNewProductScreen> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DesktopAddNewProductWidget(),
    );
  }
}


/* 
Container(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 4,
              child: QuillToolbar.basic(
                controller: _quillController,
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.grey[300],
                padding: const EdgeInsets.all(16),
                child: QuillEditor.basic(
                  controller: _quillController,
                  readOnly: false,
                ),
              ),
            ),
          ],
        ),
      ),

 */