import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:news_app/data/apis/articles_response/article.dart';
import 'package:news_app/data/apis/articles_response/articles_response.dart';
import 'package:news_app/data/apis/result.dart';
import 'package:news_app/data/apis/sources_response/source.dart';
import 'package:news_app/data/apis/sources_response/sources_response.dart';
import 'package:news_app/models/category_model.dart';

class ApiService {
  static const String baseUrl = "newsapi.org";
  static const String apiKey = "15ce30f4fff8484994d5342ceb229830";
  static const String sourcesEndPoint = "/v2/top-headlines/sources";
  static const String articlesEndPoint = "/v2/everything";

   Future<Result<List<Source>>> getSources(CategoryModel category) async {
    try {
      Uri url = Uri.https(baseUrl, sourcesEndPoint, {
        'apiKey': apiKey,
        'category': category.id,
      });

      http.Response serverResponse = await http.get(url);
      var json = jsonDecode(serverResponse.body);
      SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
      if (sourcesResponse.status == 'error') {
        return ServerError(
          code: sourcesResponse.code ?? '',
          message: sourcesResponse.message ?? 'Failed to load sources',
        );
      } else {
        return Success(data: sourcesResponse.sources ?? []);
      }
    } catch (exeption) {
      if (exeption is SocketException) {
        return Error(message: 'No Internet connection 😑');
      }
      if (exeption is HttpException) {
        return Error(message: "Couldn't find the post 😱");
      }
      if (exeption is FormatException) {
        return Error(message: "Bad response format 👎");
      }
      return Error(message: exeption.toString());
    }
  }

   Future<Result<List<Article>>> getArticles(
    Source source, [
    String? searchKey,
  ]) async {
    try {
      Uri url = Uri.https(baseUrl, articlesEndPoint, {
        'apiKey': apiKey,
        'sources': source.id,
        'q': searchKey,
      });
      http.Response serverResponse = await http.get(url);
      var json = jsonDecode(serverResponse.body);
      ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);
      if (articlesResponse.status == 'error') {
        return ServerError(
          code: articlesResponse.code ?? '',
          message: articlesResponse.message ?? 'Failed to load articles',
        );
      } else {
        return Success(data: articlesResponse.articles ?? []);
      }
    } catch (exeption) {
      if (exeption is SocketException) {
        return Error(message: 'No Internet connection 😑');
      }
      if (exeption is HttpException) {
        return Error(message: "Couldn't find the post 😱");
      }
      if (exeption is FormatException) {
        return Error(message: "Bad response format 👎");
      }
      return Error(message: exeption.toString());
    }
  }
}
