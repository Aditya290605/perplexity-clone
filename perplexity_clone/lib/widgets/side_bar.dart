import 'package:flutter/material.dart';
import 'package:perplexity_clone/theme/app_color.dart';
import 'package:perplexity_clone/widgets/nav_bar_buttons.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  bool isCollapsed = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: isCollapsed ? 64 : 155,
      color: AppColors.sideNav,
      child: Column(
        crossAxisAlignment: isCollapsed
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),

          Icon(Icons.auto_awesome_mosaic, color: Colors.white, size: 30),

          const SizedBox(height: 24),
          NavBarButtons(
            isCollapsed: isCollapsed,
            text: 'Home',
            icon: Icons.add,
          ),

          NavBarButtons(
            isCollapsed: isCollapsed,
            text: 'Search',
            icon: Icons.search,
          ),

          NavBarButtons(
            isCollapsed: isCollapsed,
            text: 'Languages',
            icon: Icons.language,
          ),

          NavBarButtons(
            isCollapsed: isCollapsed,
            text: 'Discover',
            icon: Icons.auto_awesome,
          ),

          NavBarButtons(
            isCollapsed: isCollapsed,
            text: 'Library',
            icon: Icons.cloud_outlined,
          ),

          const Spacer(),

          GestureDetector(
            onTap: () {
              setState(() {
                isCollapsed = !isCollapsed;
              });
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
              child: Icon(
                isCollapsed
                    ? Icons.keyboard_arrow_right
                    : Icons.keyboard_arrow_left,
                color: AppColors.iconGrey,
                size: 24,
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
