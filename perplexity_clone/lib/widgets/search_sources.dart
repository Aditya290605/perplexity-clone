import 'package:flutter/material.dart';
import 'package:perplexity_clone/services/socket_connection.dart';
import 'package:perplexity_clone/theme/app_color.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SearchSources extends StatefulWidget {
  const SearchSources({super.key});

  @override
  State<SearchSources> createState() => _SearchSourcesState();
}

class _SearchSourcesState extends State<SearchSources> {
  bool isLoading = true;
  List searchSources = [
    {
      'title': 'Ind vs Aus Live Score 4th Test',
      'url':
          'https://www.moneycontrol.com/sports/cricket/ind-vs-aus-live-score-4th-test-shubman-gill-dropped-australia-win-toss-opt-to-bat-liveblog-12897631.html',
    },
    {
      'title': 'Ind vs Aus Live Boxing Day Test',
      'url':
          'https://timesofindia.indiatimes.com/sports/cricket/india-vs-australia-live-score-boxing-day-test-2024-ind-vs-aus-4th-test-day-1-live-streaming-online/liveblog/116663401.cms',
    },
    {
      'title': 'Ind vs Aus - 4 Australian Batters Score Half Centuries',
      'url':
          'https://economictimes.indiatimes.com/news/sports/ind-vs-aus-four-australian-batters-score-half-centuries-in-boxing-day-test-jasprit-bumrah-leads-indias-fightback/articleshow/116674365.cms',
    },
  ];

  @override
  void initState() {
    super.initState();
    SocketConnection().searchresultType.listen((data) {
      setState(() {
        searchSources = data['data'];
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.folder_copy_outlined,
              size: 20,
              color: AppColors.iconGrey,
            ),
            const SizedBox(width: 10),
            Text("Sources", style: TextStyle(fontSize: 18)),
          ],
        ),
        const SizedBox(height: 16),
        Skeletonizer(
          enabled: isLoading,
          child: Wrap(
            runSpacing: 16,
            spacing: 16,
            children: searchSources
                .map(
                  (res) => Container(
                    width: 150,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.cardColor,
                      border: Border.all(color: AppColors.cardColor),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          res['title'],
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 14,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          res['url'],
                          style: TextStyle(
                            fontSize: 10,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
