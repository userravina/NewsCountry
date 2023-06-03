import 'package:flutter/material.dart';
import 'package:newscountry/news_country/modal/my_modal.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../modal/news_modal.dart';
import '../provider/news_provider.dart';

class News_Details extends StatefulWidget {
  const News_Details({Key? key}) : super(key: key);

  @override
  State<News_Details> createState() => _News_DetailsState();
}

class _News_DetailsState extends State<News_Details> {
  news_provider? pt;
  news_provider? pf;

  @override
  Widget build(BuildContext context) {
    pt = Provider.of<news_provider>(context, listen: true);
    pf = Provider.of<news_provider>(context, listen: false);

    NewModal d = ModalRoute.of(context)!.settings.arguments as NewModal;

    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "NEWS ${d.name}",
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    )),
                Container(
                  height: 23.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black),
                    color: Colors.white,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      "${d.urlToImage}",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(left: 15, top: 10, bottom: 10),
                child: Text(
                    "${d.name}"),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 15, top: 5, bottom: 10, right: 10),
            child: Text("${d.title}"),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 15, top: 0, bottom: 10, right: 10),
            child: Text("${d.description}"),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 15, top: 1, bottom: 10, right: 10),
            child: Text("${d.content}"),
          ),
          Row(
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(left: 15, top: 10, bottom: 10),
                child: Text("${d.author}"),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(left: 15, top: 10, bottom: 10),
                child:
                    Text("${d.publishedAt}"),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
