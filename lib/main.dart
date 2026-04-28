import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/theme/theme_manager.dart';
import 'package:news_app/core/resources/routes_manager.dart';

void main() {
  runApp(const News());
}

class News extends StatelessWidget {
  const News({super.key});

  
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(393, 852) ,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_,_) => MaterialApp(
        debugShowCheckedModeBanner: false,
      routes: RoutesManager.routes ,
      initialRoute:RoutesManager.homeScreen ,
      theme: ThemeManager.light,
      darkTheme:  ThemeManager.dark,
      themeMode: ThemeMode.light,
       
      ),
    );

    
  }
}



