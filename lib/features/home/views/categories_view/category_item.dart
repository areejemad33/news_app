import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/providers/home_screen_provider.dart';
import 'package:provider/provider.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem({super.key, required this.category});
  CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Provider.of < HomeScreenProvider>(context, listen: false).goToSources(category);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: Image.asset(
          category.imagePath,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
