import 'package:flutter/material.dart';
import 'package:newscountry/news_country/provider/news_provider.dart';
import 'package:newscountry/news_country/view/details_screen.dart';
import 'package:newscountry/news_country/view/HomeScreen.dart';
import 'package:newscountry/news_country/view/news_details.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => news_provider(),
      )
    ],
    child: Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (context) => News_Screen(),
             'box': (context) => news_box(),
             'detail': (context) => News_Details(),
          },
        );
      },
    ),
  ));
}
