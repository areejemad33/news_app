import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/resources/colors_manager.dart';
import 'package:news_app/features/home/views/sources_view/article_item.dart';
import 'package:news_app/providers/search_provider.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController controller = TextEditingController();

  final ScrollController scrollController = ScrollController();

  Timer? debounce;

  @override
  void initState() {
    super.initState();

    final provider = context.read<SearchProvider>();

    /// pagination
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent - 300 &&
          !provider.isLoading &&
          provider.hasMore &&
          controller.text.trim().isNotEmpty) {
        provider.searchArticles(controller.text);
      }
    });
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
    final provider = context.watch<SearchProvider>();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Container(
          height: 52.h,
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              color: ColorsManager.white,
              width: 1,
            ),
          ),
          child: Row(
            children: [
              /// search icon
              const Icon(
                Icons.search,
                color: ColorsManager.white,
                size: 30,
              ),

              SizedBox(width: 10.w),

              /// text field
              Expanded(
                child: TextField(
                  controller: controller,
                  autofocus: true,
                  style: const TextStyle(
                    color: ColorsManager.white,
                  ),

                  onChanged: (value) {
                    if (debounce?.isActive ?? false) {
                      debounce!.cancel();
                    }

                    debounce = Timer(
                      const Duration(milliseconds: 500),
                      () {
                        provider.searchArticles(
                          value,
                          reset: true,
                        );
                      },
                    );
                  },

                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search",
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
                icon: const Icon(
                  Icons.close,
                  color: ColorsManager.white,
                ),
              ),
            ],
          ),
        ),
      ),

      body: Column(
        children: [
          SizedBox(height: 16.h),

          Expanded(
            child: controller.text.trim().isEmpty
                ? const Center(
                    child: Text(
                      "Search for articles",
                      style: TextStyle(
                        color: ColorsManager.white,
                        fontSize: 18,
                      ),
                    ),
                  )
                : provider.articles.isEmpty && !provider.isLoading
                    ? const Center(
                        child: Text(
                          "No articles found",
                          style: TextStyle(
                            color: ColorsManager.white,
                            fontSize: 18,
                          ),
                        ),
                      )
                    : ListView.builder(
                        controller: scrollController,
                        itemCount:
                            provider.articles.length +
                                (provider.hasMore ? 1 : 0),

                        itemBuilder: (context, index) {
                          /// loading item
                          if (index == provider.articles.length) {
                            return const Padding(
                              padding: EdgeInsets.all(16),
                              child: Center(
                                child:
                                    CircularProgressIndicator(),
                              ),
                            );
                          }

                          return ArticleItem(
                            article:
                                provider.articles[index],
                          );
                        },
                      ),
          ),
        ],
      ),
    );
  }
}