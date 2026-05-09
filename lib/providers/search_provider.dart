import 'package:flutter/material.dart';
import 'package:news_app/data/apis/api_service.dart';
import 'package:news_app/data/apis/articles_response/article.dart';
import 'package:news_app/data/apis/result.dart';

class SearchProvider extends ChangeNotifier {
  List<Article> articles = [];

  bool isLoading = false;

  bool hasMore = true;

  int page = 1;

  Future<void> searchArticles(
    String query, {
    bool reset = false,
  }) async {
    if (query.trim().isEmpty) {
      articles.clear();
      notifyListeners();
      return;
    }

    if (reset) {
      page = 1;
      articles.clear();
      hasMore = true;
    }

    isLoading = true;

    notifyListeners();

    final Result<List<Article>> result =
        await ApiService().searchArticles(query, page);

    if (result is Success<List<Article>>) {
      if (result.data.isEmpty) {
        hasMore = false;
      } else {
        articles.addAll(result.data);

        page++;
      }
    }

    isLoading = false;

    notifyListeners();
  }
}