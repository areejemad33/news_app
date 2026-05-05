// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:news_app/data/apis/api_service.dart' as _i108;
import 'package:news_app/data/data_sources/articles_api_data_source_impl.dart'
    as _i466;
import 'package:news_app/data/data_sources/articles_data_source.dart' as _i349;
import 'package:news_app/data/data_sources/sources_api_data_source_impl.dart'
    as _i118;
import 'package:news_app/data/data_sources/sources_data_source.dart' as _i530;
import 'package:news_app/data/repositories/articles_repo_impl.dart' as _i1069;
import 'package:news_app/data/repositories/articles_repositery.dart' as _i231;
import 'package:news_app/data/repositories/sources_repo_impl.dart' as _i160;
import 'package:news_app/data/repositories/sources_repositery.dart' as _i82;
import 'package:news_app/features/home/views/sources_view/articles_view_model.dart'
    as _i1025;
import 'package:news_app/features/home/views/sources_view/sources_view_model.dart'
    as _i352;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i108.ApiService>(() => _i108.ApiService());
    gh.singleton<_i349.ArticlesDataSource>(
      () => _i466.ArticlesApiDataSourceImpl(apiService: gh<_i108.ApiService>()),
    );
    gh.singleton<_i530.SourcesDataSource>(
      () => _i118.SourcesApiDataSourceImpl(apiService: gh<_i108.ApiService>()),
    );
    gh.singleton<_i82.SourcesRepository>(
      () => _i160.SourcesRepoImpl(
        sourcesDataSource: gh<_i530.SourcesDataSource>(),
      ),
    );
    gh.singleton<_i231.ArticlesRepositery>(
      () => _i1069.ArticlesRepoImpl(
        articlesDataSource: gh<_i349.ArticlesDataSource>(),
      ),
    );
    gh.factory<_i352.SourcesViewModel>(
      () => _i352.SourcesViewModel(
        sourcesRepository: gh<_i82.SourcesRepository>(),
      ),
    );
    gh.factory<_i1025.ArticlesViewModel>(
      () => _i1025.ArticlesViewModel(
        articlesRepositery: gh<_i231.ArticlesRepositery>(),
      ),
    );
    return this;
  }
}
