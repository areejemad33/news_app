import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/resources/colors_manager.dart';
import 'package:news_app/data/apis/api_service.dart';
import 'package:news_app/data/apis/articles_response/article.dart';
import 'package:news_app/data/apis/result.dart';
import 'package:news_app/features/home/views/sources_view/article_item.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController controller = TextEditingController();

  final ScrollController scrollController = ScrollController();

  List<Article> articles = [];

  bool isLoading = false;

  bool hasMore = true;

  int page = 1;

  Timer? debounce;

  @override
  void initState() {
    super.initState();

    getArticles();

    /// pagination
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent - 300 &&
          !isLoading &&
          hasMore) {
        getArticles();
      }
    });
  }

  Future<void> getArticles({bool reset = false}) async {
    if (reset) {
      page = 1;

      articles.clear();

      hasMore = true;
    }

    isLoading = true;

    setState(() {});

    Result<List<Article>> result;

    if (controller.text.trim().isNotEmpty) {
      result = await ApiService().searchArticles(controller.text, page);
    } else {
      result = await ApiService().getGeneralArticles(page);
    }

    if (result is Success<List<Article>>) {
      if (result.data.isEmpty) {
        hasMore = false;
      } else {
        articles.addAll(result.data);

        page++;
      }
    }

    isLoading = false;

    setState(() {});
  }

  @override
  void dispose() {
    debounce?.cancel();

    controller.dispose();

    scrollController.dispose();


    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,

        title: Container(
          height: 52.h,

          padding: EdgeInsets.symmetric(horizontal: 12.w),

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: ColorsManager.white, width: 1),
          ),

          child: Row(
            children: [
              /// search icon
              const Icon(Icons.search, color: ColorsManager.white, size: 30),

              SizedBox(width: 10.w),

              /// text field
              Expanded(
                child: TextField(
                  controller: controller,
                  autofocus: true,

                  onChanged: (value) {
                    if (debounce?.isActive ?? false) {
                      debounce!.cancel();
                    }

                    debounce = Timer(const Duration(milliseconds: 500), () {
                      getArticles(reset: true);
                    });
                  },

                  style: const TextStyle(color: ColorsManager.white),

                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search ",
                    hintStyle: TextStyle(
                      color: ColorsManager.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),

              /// close icon
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close, color: ColorsManager.white),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 16.h),
          Expanded(
            child: ListView.builder(
              controller: scrollController,

              itemCount: articles.length + (hasMore ? 1 : 0),

              itemBuilder: (context, index) {
                /// loading item
                if (index == articles.length) {
                  return const Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }

                return ArticleItem(article: articles[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
