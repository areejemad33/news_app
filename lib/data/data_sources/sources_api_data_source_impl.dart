import 'package:injectable/injectable.dart';
import 'package:news_app/data/apis/api_service.dart';
import 'package:news_app/data/apis/result.dart';
import 'package:news_app/data/data_sources/sources_data_source.dart';
import 'package:news_app/models/category_model.dart';
@Singleton(as: SourcesDataSource)
class SourcesApiDataSourceImpl implements SourcesDataSource {
   ApiService apiService;
  SourcesApiDataSourceImpl({required this.apiService});

  @override
  Future<Result> getSources(CategoryModel category) {
    return apiService.getSources(category);
  }
}
