import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/data/apis/api_service.dart';
import 'package:news_app/data/apis/articles_response/article.dart';
import 'package:news_app/data/apis/sources_response/source.dart';
import 'package:news_app/core/resources/colors_manager.dart';
import 'package:news_app/data/data_sources/articles_api_data_source_impl.dart';
import 'package:news_app/data/data_sources/sources_api_data_source_impl.dart';
import 'package:news_app/data/repositories/articles_repo_impl.dart';
import 'package:news_app/data/repositories/sources_repo_impl.dart';
import 'package:news_app/di/di.dart';
import 'package:news_app/features/home/views/sources_view/article_item.dart';
import 'package:news_app/features/home/views/sources_view/articles_view_model.dart';
import 'package:news_app/features/home/views/sources_view/sources_view_model.dart';
import 'package:news_app/models/category_model.dart';
import 'package:provider/provider.dart';

class SourcesView extends StatefulWidget {
  SourcesView({super.key, required this.category});
  CategoryModel category;

  @override
  State<SourcesView> createState() => _SourcesViewState();
}

class _SourcesViewState extends State<SourcesView> {
  late SourcesViewModel sourcesViewModel;
  late ArticlesViewModel articlesViewModel;
  @override
  void initState() {
    super.initState();
    fetchData();
  } 

  void fetchData() async {
    sourcesViewModel = serviceLocator.get<SourcesViewModel>();
    articlesViewModel = serviceLocator.get<ArticlesViewModel>();
    await sourcesViewModel.loadSources(widget.category);
    if (sourcesViewModel.state is SourcesSucces) {
      final sources = (sourcesViewModel.state as SourcesSucces).sources;

      if (sources.isNotEmpty) {
        articlesViewModel.loadArticles(sources.first);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: sourcesViewModel),
        ChangeNotifierProvider.value(value: articlesViewModel),
      ],
      child: Column(
        children: [
          Consumer<SourcesViewModel>(
            builder: (_, viewModel, _) {
              var state = viewModel.state;

              switch (state) {
                case SourcesLoading():
                  {
                    return Center(child: CircularProgressIndicator());
                  }
                case SourcesError():
                  {
                    return Center(
                      child: Text(
                        state.message,
                        style: GoogleFonts.inter(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: ColorsManager.white,
                        ),
                      ),
                    );
                  }
                case SourcesSucces():
                  {
                    List<Source> sources = state.sources;

                    return DefaultTabController(
                      length: sources.length,
                      child: Column(
                        children: [
                          TabBar(
                            onTap: (index) {
                              articlesViewModel.loadArticles(sources[index]);
                            },
                            tabAlignment: TabAlignment.start,
                            dividerColor: Colors.transparent,
                            indicatorColor: ColorsManager.white,
                            isScrollable: true,
                            labelStyle: GoogleFonts.inter(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: ColorsManager.white,
                            ),
                            unselectedLabelStyle: GoogleFonts.inter(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: ColorsManager.white,
                            ),
                            tabs: sources
                                .map((source) => Tab(text: source.name))
                                .toList(),
                          ),
                        ],
                      ),
                    );
                  }
                case SourcesInitial():
                  {
                    return Container();
                  }
              }
            },
          ),

          Consumer<ArticlesViewModel>(
            builder: (_, viewModel, _) {
              var state = viewModel.state;
              switch (state) {
                case ArticlesLoading():
                  return Center(child: CircularProgressIndicator());

                case ArticlesError():
                  return Center(child: Text(state.message));

                case ArticlesSucces():
                  List<Article> articles = state.articles;
                  return Expanded(
                    child: ListView.separated(
                      separatorBuilder: (_, index) => SizedBox(height: 16.h),
                      itemCount: articles.length,
                      itemBuilder: (_, index) {
                        return ArticleItem(article: articles[index]);
                      },
                    ),
                  );

                default:
                  return Container();
              }
            },
          ),
        ],
      ),
    );
  }
}
