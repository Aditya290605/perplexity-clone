import 'package:flutter/material.dart';
import 'package:perplexity_clone/theme/app_color.dart';

class NavBarButtons extends StatelessWidget {
  final bool isCollapsed;
  final String text;
  final IconData icon;
  const NavBarButtons({
    super.key,
    required this.isCollapsed,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isCollapsed
          ? MainAxisAlignment.center
          : MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
          child: Icon(icon, color: AppColors.iconGrey, size: 24),
        ),
        isCollapsed
            ? const SizedBox()
            : Text(
                text,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
      ],
    );
  }
}
