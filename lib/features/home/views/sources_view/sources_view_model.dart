import 'package:flutter/material.dart';
import 'package:news_app/apis/api_service.dart';
import 'package:news_app/apis/result.dart';
import 'package:news_app/apis/sources_response/source.dart';
import 'package:news_app/models/category_model.dart';

class SourcesViewModel extends ChangeNotifier {
 SourcesState state = SourcesInitial();
 void emit(SourcesState newState) {
    state = newState;
    notifyListeners();
  }

  Future<void> loadSources(CategoryModel category) async {
    emit(SourcesLoading());
    var result = await ApiService.getSources(category);
  
    switch (result) {
      case Success():
        {
          emit(SourcesSucces(sources: result.data));
        }
      case ServerError():
        {
          emit(SourcesError(message: result.message));
        }
      case Error():
        {
          emit(SourcesError(message: result.message));
        }
    }
  }
}

sealed class SourcesState {}

class SourcesInitial extends SourcesState {}

class SourcesLoading extends SourcesState {}

class SourcesSucces extends SourcesState {
  List<Source> sources;
  SourcesSucces({required this.sources});
}

class SourcesError extends SourcesState {
  String message;
  SourcesError({required this.message});
}

