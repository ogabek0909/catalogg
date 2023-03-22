import 'package:catalogg/desktop/widgets/desktop_slider_afisha_widget.dart';
import 'package:catalogg/mobile/widgets/mobile_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'widgets/mobile_footer_widget.dart';

class MobileHomeScreen extends StatelessWidget {
  const MobileHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: CustomScrollView(
        slivers: [
          const MobileAppBarWidget(),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  SizedBox(
                    height: 530,
                    child: Row(
                      children: const [
                        Expanded(child: SliderWidget()),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  const SizedBox(
                    height: 530,
                    child: AfishaWidget(),
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(child: MobileFooterWidget(),)
        ],
      ),
    );
  }
}
