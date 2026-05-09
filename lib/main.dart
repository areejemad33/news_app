import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/resources/routes_manager.dart';
import 'package:news_app/di/di.dart';
import 'package:news_app/providers/search_provider.dart';
import 'package:provider/provider.dart';

import 'config/theme/theme_manager.dart';

void main() {
  configureDependencies();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SearchProvider(),
        ),
      ],
      child: const News(),
    ),
  );
}

class News extends StatelessWidget {
  const News({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: RoutesManager.routes,
        initialRoute: RoutesManager.homeScreen,
        theme: ThemeManager.light,
        darkTheme: ThemeManager.dark,
        themeMode: ThemeMode.light,
      ),
    );
  }
}
