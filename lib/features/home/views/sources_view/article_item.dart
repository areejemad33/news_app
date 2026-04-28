import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/resources/assets_manager.dart';
import 'package:news_app/core/resources/colors_manager.dart';
import 'package:news_app/models/article_model.dart';

class ArticleItem extends StatelessWidget {
  ArticleItem({super.key, required this.article});
  ArticleModel article;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r), 
        border: Border.all(color: ColorsManager.white, width: 1)
      ),
      child: Column(
        children: [
          Image.asset(ImageAssets.business, width: double.infinity, fit: BoxFit.fill,),
          SizedBox(height: 10.h,),
          Text(article.title , style: GoogleFonts.inter(fontSize: 16.sp, fontWeight: FontWeight.bold, color: ColorsManager.white),),
          SizedBox(height: 10.h,),
          Row(
            children: [
                    Expanded(child: Text(article.author , style: GoogleFonts.inter(fontSize: 12.sp, fontWeight: FontWeight.w500, color: ColorsManager.grey),)),
          Text(article.publishAt , style: GoogleFonts.inter(fontSize: 12.sp, fontWeight: FontWeight.w500, color: ColorsManager.grey),),
      
            ],
          )
      
        ],
      ),
    );
  }
}
