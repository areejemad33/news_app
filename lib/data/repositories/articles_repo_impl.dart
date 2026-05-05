import 'package:injectable/injectable.dart';
import 'package:news_app/data/apis/result.dart';
import 'package:news_app/data/apis/sources_response/source.dart';
import 'package:news_app/data/data_sources/articles_data_source.dart';
import 'package:news_app/data/repositories/articles_repositery.dart';
@Singleton(as: ArticlesRepositery)
class ArticlesRepoImpl implements ArticlesRepositery {
  ArticlesDataSource articlesDataSource;
  ArticlesRepoImpl({required this.articlesDataSource});
  @override
  Future<Result<dynamic>> getArticles(Source source) {
    return articlesDataSource.getArticles(source);
  }

}