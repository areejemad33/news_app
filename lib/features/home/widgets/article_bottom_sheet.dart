import 'package:flutter/material.dart';
import 'package:news_app/core/resources/colors_manager.dart';
import 'package:news_app/data/apis/articles_response/article.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleBottomSheet extends StatelessWidget {
  final Article article;

  const ArticleBottomSheet({
    super.key,
    required this.article,
  });

Future<void> launchArticle() async {
  final Uri uri = Uri.parse(article.url ?? "");

  await launchUrl(
    uri,
    mode:  LaunchMode.inAppBrowserView,
  );
}

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: MediaQuery.of(context).size.height * 0.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// IMAGE
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              article.urlToImage ??
                  "",
              height: 220,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 16),

    

      

          /// DESCRIPTION
          Text(
            article.content ?? "",
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: ColorsManager.black,
            ),
          ),

          const Spacer(),

          /// BUTTON
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorsManager.black,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () async {
  Navigator.pop(context);

  await launchArticle();
},
              child:  Text("View Full Article", style: Theme.of(context).textTheme.titleSmall,),
            ),
          ),
        ],
      ),
    );
  }
}