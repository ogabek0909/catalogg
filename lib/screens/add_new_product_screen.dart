import 'package:catalogg/desktop/screens/desktop_add_new_product_screen.dart';
import 'package:catalogg/providers.dart/home_screen_provider.dart';
import 'package:catalogg/responsive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddNewProductScreen extends StatelessWidget {
  const AddNewProductScreen({super.key});
  static const routeName = 'add-new-product';

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<HomeScreenProvider>(context,listen: false).getHomeScreenData(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }else if(snapshot.hasError){
          return Center(
            child: Text(snapshot.error.toString()),
          );
        }
        return ResponsiveLayout(
          mobile: Container(),
          tablet: Container(),
          desktop: const DesktopAddNewProductScreen(),
        );
      }
    );
  }
}
