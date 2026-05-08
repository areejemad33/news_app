import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/data/apis/articles_response/article.dart';
import 'package:news_app/core/resources/colors_manager.dart';
import 'package:news_app/features/home/widgets/article_bottom_sheet.dart';

class ArticleItem extends StatelessWidget {
  ArticleItem({super.key, required this.article});
  Article article;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(24),
      ),
    ),
    builder: (context) {
      return ArticleBottomSheet(
        article: article,
      );
    
    },
    
  );
  
},
      child: Container(
        padding: REdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r), 
          border: Border.all(color: ColorsManager.white, width: 1)
        ),
        child: Column(
          children: [
      CachedNetworkImage(
          imageUrl: article.urlToImage ?? '',
          placeholder: (context, url) => Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => Icon(Icons.error),
       ),          SizedBox(height: 10.h,),
            Text(article.title  ?? '', style: GoogleFonts.inter(fontSize: 16.sp, fontWeight: FontWeight.bold, color: ColorsManager.white),),
            SizedBox(height: 10.h,),
            Row(
              children: [
                      Expanded(child: Text(article.author  ?? '', style: GoogleFonts.inter(fontSize: 12.sp, fontWeight: FontWeight.w500, color: ColorsManager.grey),)),
            Text(article.publishedAt  ?? '', style: GoogleFonts.inter(fontSize: 12.sp, fontWeight: FontWeight.w500, color: ColorsManager.grey),),
        
              ],
            )
        
          ],
        ),
      ),
    );
  }
}
