import 'package:flutter/material.dart';
import 'package:news_app/data/model/article.dart';
import 'package:news_app/common/styles.dart';
import 'package:news_app/pages/article_detail_page.dart';
import 'package:news_app/pages/article_web_view.dart';
import 'package:news_app/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      theme: ThemeData(
          primaryColor: primaryColor,
          accentColor: secondaryColor,
          scaffoldBackgroundColor: Colors.white,
          textTheme: myTextTheme,
          appBarTheme: AppBarTheme(
              textTheme: myTextTheme.apply(bodyColor: Colors.black),
              elevation: 0),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  primary: secondaryColor,
                  textStyle: TextStyle(),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0)))),
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => HomePage(),
        ArticleDetailPage.routeName: (context) => ArticleDetailPage(
              article: ModalRoute.of(context)?.settings.arguments as Article,
            ),
        ArticleWebView.routeName: (context) => ArticleWebView(
            url: ModalRoute.of(context)?.settings.arguments as String)
      },
    );
  }
}
