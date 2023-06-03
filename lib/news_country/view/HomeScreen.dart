import 'package:flutter/material.dart';
import 'package:newscountry/news_country/modal/news_modal.dart';
import 'package:newscountry/news_country/provider/news_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class News_Screen extends StatefulWidget {
  const News_Screen({Key? key}) : super(key: key);

  @override
  State<News_Screen> createState() => _News_ScreenState();
}

class _News_ScreenState extends State<News_Screen> {
  news_provider? pt;
  news_provider? pf;

  @override
  Widget build(BuildContext context) {
    pt = Provider.of<news_provider>(context, listen: true);
    pf = Provider.of<news_provider>(context, listen: false);
    return SafeArea(
        child: Scaffold(
      body: FutureBuilder(
        future: pt!.getdata(con: pt!.selecteindex!),
        builder: (context, snapshot) {
          // if (snapshot.hasError) {
          //   return Text("Error :- ${snapshot.hasError}");
          // } else if (snapshot.hasData) {
          //   NewsModal newsModal = snapshot.data!;
            return Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        height: 5.h,
                        width: 80.w,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(10)),
                        child: TextField(
                            decoration: InputDecoration(
                                prefixIcon:
                                    Icon(Icons.search, color: Colors.black),
                                label: Text(
                                  "Search news",
                                  style: TextStyle(color: Colors.black),
                                ),
                                enabledBorder: InputBorder.none)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 7),
                      child: CircleAvatar(
                          backgroundColor: Colors.grey.shade300,
                          radius: 18,
                          child: Icon(
                            Icons.notifications,
                            color: Colors.grey,
                          )),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, ),
                  child: Row(
                    children: [
                      Text(
                        "News country",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return InkWell(onTap: () {
                         pf!.Changeindex('${pt!.flag[index].country}');
                        Navigator.pushNamed(context, 'box',arguments: index);
                      },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 30.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.black),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
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
                                    child: Image.asset(
                                      "${pt!.flag[index].I}",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    "Country data",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    "${pt!.flag[index].n}",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: pt!.flag.length
                  ),
                ),
              ],
            );
          }
          // return Center(child: CircularProgressIndicator());
        // },
      ),
    ));
  }
}
