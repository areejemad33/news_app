import 'package:flutter/material.dart';
import 'package:news_app/apis/api_service.dart';
import 'package:news_app/apis/articles_response/article.dart';
import 'package:news_app/apis/result.dart';
import 'package:news_app/apis/sources_response/source.dart';

class ArticlesViewModel extends ChangeNotifier {
  ArticlesState state = ArticlesInitial();
  void emit(ArticlesState newState) {
    state = newState;
    notifyListeners();
  }

  Future<void> loadArticles(Source source) async {
    emit(ArticlesLoading());
    var result = await ApiService.getArticles(source);

    notifyListeners();
    switch (result) {
      case Success():
        {
          emit(ArticlesSucces(articles: result.data));
        }
      case ServerError():
        {
          emit(ArticlesError(message: result.message));
        }
      case Error():
        {
          emit(ArticlesError(message: result.message));
        }
    }
  }
}

abstract class ArticlesState {}

class ArticlesInitial extends ArticlesState {}

class ArticlesSucces extends ArticlesState {
  List<Article> articles;
  ArticlesSucces({required this.articles});
}

class ArticlesLoading extends ArticlesState {}

class ArticlesError extends ArticlesState {
  String message;
  ArticlesError({required this.message});
}
