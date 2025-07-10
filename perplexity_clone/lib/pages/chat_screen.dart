import 'package:flutter/material.dart';
import 'package:perplexity_clone/theme/app_color.dart';
import 'package:perplexity_clone/widgets/answer_section.dart';
import 'package:perplexity_clone/widgets/search_sources.dart';
import 'package:perplexity_clone/widgets/side_bar.dart';

class ChatScreen extends StatelessWidget {
  final String query;
  const ChatScreen({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SideBar(),
          const SizedBox(width: 100),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(query, style: TextStyle(fontSize: 32)),
                    const SizedBox(height: 24),
                    SearchSources(),
                    const SizedBox(height: 24),
                    AnswerSection(),
                  ],
                ),
              ),
            ),
          ),
          Placeholder(strokeWidth: 0, color: AppColors.background),
        ],
      ),
    );
  }
}
