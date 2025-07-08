import 'package:flutter/material.dart';
import 'package:perplexity_clone/theme/app_color.dart';

import 'package:perplexity_clone/widgets/inputbox.dart';
import 'package:perplexity_clone/widgets/side_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SideBar(),
          Expanded(
            child: Column(
              children: [
                Spacer(),
                Inputbox(),
                Spacer(),

                Wrap(
                  children: [
                    Padding(
                      padding: EdgeInsetsGeometry.symmetric(horizontal: 12),
                      child: Text(
                        'Pro',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.footerGrey,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsGeometry.symmetric(horizontal: 12),
                      child: Text(
                        'Enterpirze',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.footerGrey,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsGeometry.symmetric(horizontal: 12),
                      child: Text(
                        'Store',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.footerGrey,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsGeometry.symmetric(horizontal: 12),
                      child: Text(
                        'Blogs',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.footerGrey,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsGeometry.symmetric(horizontal: 12),
                      child: Text(
                        'Career',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.footerGrey,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsGeometry.symmetric(horizontal: 12),
                      child: Text(
                        'English (English)',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.footerGrey,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
