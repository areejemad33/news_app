import 'package:news_app/data/apis/api_service.dart';
import 'package:news_app/data/apis/result.dart';
import 'package:news_app/data/apis/sources_response/source.dart';
import 'package:news_app/data/data_sources/articles_data_source.dart';

class ArticlesApiDataSourceImpl implements ArticlesDataSource {
  ApiService apiService;
  ArticlesApiDataSourceImpl({required this.apiService});
  @override
  Future<Result<dynamic>> getArticles(Source source) {
  return apiService.getArticles(source);
  }

}
