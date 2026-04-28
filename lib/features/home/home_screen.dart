import 'package:flutter/material.dart';
import 'package:news_app/features/home/views/categories_view/categories_view.dart';
import 'package:news_app/features/home/views/sources_view/sources_view.dart';
import 'package:news_app/features/home/widgets/custom_drawer.dart';
import 'package:news_app/providers/home_screen_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        
      ),
      drawer: CustomDrawer(),
      body: Provider.of<HomeScreenProvider>(context).homeScreenView,
    );
  }
}
