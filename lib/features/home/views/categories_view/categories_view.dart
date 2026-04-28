import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/features/home/views/categories_view/category_item.dart';
import 'package:news_app/models/category_model.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Good Morning \n Here is Some News For You", style: Theme.of(context).textTheme.titleMedium,),
        SizedBox(height: 16.h,),
      
          Expanded(
            child: ListView.separated(
              itemBuilder: (_,index) =>  
              CategoryItem(category: CategoryModel.categories[index]),
              separatorBuilder: (_, index) => SizedBox(
          height: 16.h,
         ), 
              itemCount: CategoryModel.categories.length)),
      
      


      ],
    );
  }
}