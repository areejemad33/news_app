import 'package:news_app/data/apis/result.dart';
import 'package:news_app/models/category_model.dart';

abstract class SourcesDataSource {
  Future<Result> getSources(CategoryModel category);
}
