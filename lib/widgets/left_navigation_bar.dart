import 'package:business_management/functions/size_config.dart';
import 'package:business_management/main.dart';
import 'package:business_management/screens/home_page.dart';
import 'package:business_management/screens/products_page.dart';
import 'package:business_management/screens/settings_page.dart';
import 'package:flutter/material.dart';

class LeftNavigationBar extends StatelessWidget {
  const LeftNavigationBar({
    Key? key,
    required this.pageNo,
  }) : super(key: key);

  final int pageNo;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Material(
      color: backgroundColorHeavy,
      elevation: 10,
      child: SizedBox(
        width: 250,
        child: Column(
          children: [
            const SizedBox(height: 35),
            ShaderMask(
              shaderCallback: (Rect bounds) => const RadialGradient(
                center: Alignment.center,
                radius: 0.5,
                colors: [Colors.blue, Colors.red],
                tileMode: TileMode.mirror,
              ).createShader(bounds),
              child: const Icon(
                Icons.settings_input_antenna,
                color: Color(0xff6e0a1e),
                size: 100,
              ),
            ),
            SizedBox(
              height: SizeConfig.safeBlockHorizontal * 5,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _NavigationButtons(
                    icon: Icons.home,
                    text: "Home",
                    isCurrentPage: pageNo == 0,
                    buttonNo: 0,
                  ),
                  const SizedBox(height: 30),
                  _NavigationButtons(
                    icon: Icons.inventory_2_outlined,
                    text: "Products",
                    isCurrentPage: pageNo == 1,
                    buttonNo: 1,
                  ),
                  const SizedBox(height: 30),
                  _NavigationButtons(
                    icon: Icons.settings,
                    text: "Settings",
                    isCurrentPage: pageNo == 2,
                    buttonNo: 2,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.safeBlockHorizontal * 15,
            ),
          ],
        ),
      ),
    );
  }
}

class _NavigationButtons extends StatelessWidget {
  const _NavigationButtons({
    Key? key,
    required this.icon,
    required this.text,
    required this.isCurrentPage,
    required this.buttonNo,
  }) : super(key: key);

  final IconData icon;
  final String text;
  final bool isCurrentPage;
  final int buttonNo;

  @override
  Widget build(BuildContext context) {
    const List<Widget> pages = [
      HomePage(),
      ProductsPage(),
      Settings(),
    ];
    return Column(
      children: [
        IconButton(
          icon: Icon(
            icon,
            color: isCurrentPage ? Colors.white : Colors.grey,
          ),
          iconSize: 50,
          onPressed: () => Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder: (context, anim1, anim2) => pages[buttonNo],
              transitionDuration: Duration.zero,
            ),
          ),
        ),
        if (isCurrentPage)
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700,
              letterSpacing: 2,
            ),
          ),
      ],
    );
  }
}
