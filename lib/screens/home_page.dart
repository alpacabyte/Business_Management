import 'package:business_management/widgets/left_navigation_bar.dart';
import 'package:business_management/widgets/title_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const TitleBar(),
          Expanded(
            child: Row(
              children: const [
                LeftNavigationBar(pageNo: 0),
              ],
            ),
          )
        ],
      ),
    );
  }
}
