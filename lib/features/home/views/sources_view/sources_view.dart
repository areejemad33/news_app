import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/resources/colors_manager.dart';
import 'package:news_app/features/home/views/sources_view/article_item.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/source_model.dart';

class SourcesView extends StatelessWidget {
  SourcesView({super.key});
  List<SourceModel> sources = [
    SourceModel(id: "abc-news", name: "ABC News"),
    SourceModel(id: "abc-news", name: "ABC News"),
    SourceModel(id: "abc-news", name: "ABC News"),
    SourceModel(id: "abc-news", name: "ABC News"),
    SourceModel(id: "abc-news", name: "ABC News"),
    SourceModel(id: "abc-news", name: "ABC News"),
    SourceModel(id: "abc-news", name: "ABC News"),
    SourceModel(id: "abc-news", name: "ABC News"),
  ];
    List<ArticleModel> articles = [
    ArticleModel(title: "40-year-old man falls 200 feet to his death while canyoneering at national park",
     description: "A 40-year-old man has fallen approximately 200 feet to his death while canyoneering with three others at Zion National Park in Utah, authorities confirmed.\r\nThe incident occurred on Saturday when the… [+1529 chars]",
      author: "john", 
      publishAt: "2026-04-12T21:25:17Z"),

        ArticleModel(title: "40-year-old man falls 200 feet to his death while canyoneering at national park",
     description: "A 40-year-old man has fallen approximately 200 feet to his death while canyoneering with three others at Zion National Park in Utah, authorities confirmed.\r\nThe incident occurred on Saturday when the… [+1529 chars]",
      author: "john", 
      publishAt: "2026-04-12T21:25:17Z"),
        ArticleModel(title: "40-year-old man falls 200 feet to his death while canyoneering at national park",
     description: "A 40-year-old man has fallen approximately 200 feet to his death while canyoneering with three others at Zion National Park in Utah, authorities confirmed.\r\nThe incident occurred on Saturday when the… [+1529 chars]",
      author: "john", 
      publishAt: "2026-04-12T21:25:17Z"),
        ArticleModel(title: "40-year-old man falls 200 feet to his death while canyoneering at national park",
     description: "A 40-year-old man has fallen approximately 200 feet to his death while canyoneering with three others at Zion National Park in Utah, authorities confirmed.\r\nThe incident occurred on Saturday when the… [+1529 chars]",
      author: "john", 
      publishAt: "2026-04-12T21:25:17Z"),
        ArticleModel(title: "40-year-old man falls 200 feet to his death while canyoneering at national park",
     description: "A 40-year-old man has fallen approximately 200 feet to his death while canyoneering with three others at Zion National Park in Utah, authorities confirmed.\r\nThe incident occurred on Saturday when the… [+1529 chars]",
      author: "john", 
      publishAt: "2026-04-12T21:25:17Z"),  ArticleModel(title: "40-year-old man falls 200 feet to his death while canyoneering at national park",
     description: "A 40-year-old man has fallen approximately 200 feet to his death while canyoneering with three others at Zion National Park in Utah, authorities confirmed.\r\nThe incident occurred on Saturday when the… [+1529 chars]",
      author: "john", 
      publishAt: "2026-04-12T21:25:17Z"),  ArticleModel(title: "40-year-old man falls 200 feet to his death while canyoneering at national park",
     description: "A 40-year-old man has fallen approximately 200 feet to his death while canyoneering with three others at Zion National Park in Utah, authorities confirmed.\r\nThe incident occurred on Saturday when the… [+1529 chars]",
      author: "john", 
      publishAt: "2026-04-12T21:25:17Z"),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: sources.length,
          child: TabBar(
            tabAlignment: TabAlignment.start,
            dividerColor: Colors.transparent,
            indicatorColor: ColorsManager.white,
            isScrollable: true,
            labelStyle:GoogleFonts.inter(fontSize: 16.sp , fontWeight: FontWeight.bold, color: ColorsManager.white),
            unselectedLabelStyle:GoogleFonts.inter(fontSize: 14.sp , fontWeight: FontWeight.w500, color: ColorsManager.white),

            tabs: sources.map((source) => Tab(text: source.name)).toList(),
          ),

        ),
      Expanded(child: ListView.separated(
              itemBuilder: (_,index) =>  
              ArticleItem
              (article: articles[index]),
              separatorBuilder: (_, index) => SizedBox(
          height: 16.h,
         ), 
              itemCount: articles.length)),
      

      ],
    );
  }
}
