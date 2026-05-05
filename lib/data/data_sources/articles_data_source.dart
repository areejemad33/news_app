import 'package:news_app/data/apis/result.dart';
import 'package:news_app/data/apis/sources_response/source.dart';

abstract class ArticlesDataSource {
  Future<Result> getArticles(Source source);
}