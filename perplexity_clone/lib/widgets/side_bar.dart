import 'package:flutter/material.dart';
import 'package:perplexity_clone/theme/app_color.dart';

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
      width: isCollapsed ? 64 : 125,
      color: AppColors.sideNav,
      child: Column(
        crossAxisAlignment: isCollapsed
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),

          Icon(Icons.auto_awesome_mosaic, color: Colors.white, size: 30),

          const SizedBox(height: 24),

          Row(
            mainAxisAlignment: isCollapsed
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
                child: Icon(Icons.add, color: AppColors.iconGrey, size: 24),
              ),
              isCollapsed
                  ? const SizedBox()
                  : Text(
                      "Home",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ],
          ),

          Container(
            margin: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
            child: Icon(Icons.search, color: AppColors.iconGrey, size: 24),
          ),

          Container(
            margin: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
            child: Icon(Icons.language, color: AppColors.iconGrey, size: 24),
          ),

          Container(
            margin: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
            child: Icon(
              Icons.auto_awesome,
              color: AppColors.iconGrey,
              size: 24,
            ),
          ),

          Container(
            margin: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
            child: Icon(
              Icons.cloud_outlined,
              color: AppColors.iconGrey,
              size: 24,
            ),
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
