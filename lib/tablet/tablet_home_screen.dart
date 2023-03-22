import 'package:catalogg/desktop/widgets/desktop_slider_afisha_widget.dart';
import 'package:catalogg/tablet/widgets/tablet_app_bar_widget.dart';
import 'package:flutter/material.dart';

import 'widgets/teblet_footer_widget.dart';

class TabletHomeScreen extends StatelessWidget {
  const TabletHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: CustomScrollView(
        slivers: [
          const TableAppBarWidget(),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: const [
                  SizedBox(
                    height: 530,
                    child: SliderWidget(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 530,
                    child: AfishaWidget(),
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: TabletFooterWidget(),
          ),
        ],
      ),
    );
  }
}
