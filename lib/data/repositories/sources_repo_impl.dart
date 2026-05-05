import 'package:news_app/data/apis/result.dart';
import 'package:news_app/data/data_sources/sources_data_source.dart';
import 'package:news_app/data/repositories/sources_repositery.dart';
import 'package:news_app/models/category_model.dart';

class SourcesRepoImpl  implements SourcesRepository {
  SourcesDataSource sourcesDataSource;
  SourcesRepoImpl({required this.sourcesDataSource});
  @override
  Future<Result<dynamic>> getSources(CategoryModel category) {
    return sourcesDataSource.getSources(category);
  }


}