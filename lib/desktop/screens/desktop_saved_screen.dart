import 'package:catalogg/desktop/widgets/desktop_app_bar_widget.dart';
import 'package:catalogg/desktop/widgets/desktop_product_item_widget.dart';
import 'package:catalogg/desktop/widgets/desktop_top_bar_widget.dart';
import 'package:flutter/material.dart';

class DesktopSavedScreen extends StatelessWidget {
  const DesktopSavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const DesktopAppBarWidget(),
          const SliverToBoxAdapter(
            child: DesktopTopBarWidget(),
          ),
          SliverToBoxAdapter(
            child: Row(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: 300,
                  color: const Color.fromRGBO(37, 45, 51, 1),
                  child: Column(
                    children: [
                      Image.network(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9WCSksMD_tiMuaUoUz51BrApdhoCGYQhtyO6dIJ_xQjC6-hCGOkpCzwb7aXQKLS8OzBg&usqp=CAU',
                        height: 320,
                        width: double.maxFinite,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 44),
                      const ListTile(
                        leading: Icon(
                          Icons.bookmark,
                          color: Colors.blue,
                          size: 30,
                        ),
                        title: Text(
                          "Saqlangan mahsulotlar",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const ListTile(
                        leading: Icon(
                          Icons.data_array_rounded,
                          color: Colors.blue,
                          size: 30,
                        ),
                        title: Text(
                          "Ishlab chiqaruvchi statusi",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: GridView.builder(
                      itemCount: 30,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 300,
                        mainAxisExtent: 360,
                        mainAxisSpacing: 30,
                        crossAxisSpacing: 30,
                      ),
                      itemBuilder: (context, index) =>
                          DesktopProductItemWidget(),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
