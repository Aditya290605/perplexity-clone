import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:perplexity_clone/theme/app_color.dart';

class Inputbox extends StatelessWidget {
  const Inputbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize:
            MainAxisSize.min, // ensures content takes only needed space
        children: [
          Text(
            "Where knowledge begins",
            style: GoogleFonts.ibmPlexMono(
              fontSize: 40,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            width: MediaQuery.of(context).size.width * 0.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.searchBarBorder, width: 2),
              color: AppColors.searchBar,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  minLines: 1,
                  maxLines: 10,

                  decoration: InputDecoration(
                    isDense: true,
                    hintText: 'Search anything ...',
                    hintStyle: TextStyle(
                      fontSize: 14,
                      color: AppColors.textGrey,
                    ),
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.auto_awesome, color: AppColors.iconGrey),
                        const SizedBox(width: 10),
                        Text("Focus"),
                        const SizedBox(width: 30),
                        Icon(Icons.add_rounded, color: AppColors.iconGrey),
                        const SizedBox(width: 10),
                        Text("Attach"),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(9),

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.submitButton,
                      ),
                      child: const Icon(Icons.arrow_right_alt),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
