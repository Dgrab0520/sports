import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sports/main_page.dart';
import 'package:sports/sub_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(
          name: '/',
          page: () => const MainPage(),
        ),
        GetPage(
          name: '/item_sub/:param',
          page: () => const SubPage(),
        ),
      ],
      initialRoute: "/",
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
