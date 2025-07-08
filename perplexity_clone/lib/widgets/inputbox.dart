import 'package:flutter/material.dart';
import 'package:perplexity_clone/theme/app_color.dart';

class Inputbox extends StatelessWidget {
  const Inputbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.height * 0.2,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.searchBarBorder),
        color: AppColors.searchBar,
      ),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
