import 'package:news_app/data/apis/result.dart';
import 'package:news_app/models/category_model.dart';

abstract class SourcesRepository {
  Future<Result> getSources(CategoryModel category);
} 