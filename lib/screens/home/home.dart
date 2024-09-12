// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:news_app/data/model/category.dart';
import 'package:news_app/screens/home/taps/categories/categories_tap.dart';
import 'package:news_app/screens/home/taps/settings/settings_tap.dart';
import 'package:news_app/screens/home/taps/taps_list/taps_list.dart';
import 'package:news_app/widgets/app_drawer.dart';

class Home extends StatefulWidget {
  static const String routeName = 'Home';
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Widget currentTap;

  @override
  void initState() {
    super.initState();
    currentTap = CategoriesTap(onCategoryClick);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (currentTap is CategoriesTap) {
          return true;
        } else {
          currentTap = CategoriesTap(onCategoryClick);
          setState(() {});
          return false;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff39A552),
          title: const Text(
            'News App',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          )),
        ),
        body: currentTap,
        drawer: Drawer(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: double.infinity,
                color: const Color(0xff39A552),
                child: const Center(
                    child: Text(
                  'News App!',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                )),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              AppDrawer(
                title: 'Categories',
                icon: Icons.list,
                onTap: () {
                  currentTap = CategoriesTap(onCategoryClick);
                  Navigator.pop(context);
                  setState(() {});
                },
              ),
              AppDrawer(
                title: 'Settings',
                icon: Icons.settings,
                onTap: () {
                  currentTap = const SettingsTap();
                  Navigator.pop(context);
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onCategoryClick(Category category) {
    currentTap = TapsList(category.categoryId);
    setState(() {});
  }
}
