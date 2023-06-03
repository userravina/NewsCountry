import 'package:flutter/material.dart';
import 'package:newscountry/news_country/modal/my_modal.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../modal/news_modal.dart';
import '../provider/news_provider.dart';

class news_box extends StatefulWidget {
  const news_box({Key? key}) : super(key: key);

  @override
  State<news_box> createState() => _news_boxState();
}

class _news_boxState extends State<news_box> {
  news_provider? pt;
  news_provider? pf;

  @override
  Widget build(BuildContext context) {
    pt = Provider.of<news_provider>(context, listen: true);
    pf = Provider.of<news_provider>(context, listen: false);
    int d = ModalRoute.of(context)!.settings.arguments as int;
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: pt!.getdata(con: pt!.flag[d].country!),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("Error :- ${snapshot.hasError}");
            } else if (snapshot.hasData) {
              NewsModal newsModal = snapshot.data!;
              return Column(
                children: [
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "NEWS ${pf!.flag[d].n} COUNTRY",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
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
                              "${pt!.flag[d].I}",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "All News ${pt!.flag[d].n}",
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {

                            NewModal newmodal = NewModal(
                              urlToImage:
                                  newsModal.articlesList![index].urlToImage,
                              publishedAt:
                                  newsModal.articlesList![index].publishedAt,
                              author: newsModal.articlesList![index].author,
                              content: newsModal.articlesList![index].content,
                              title: newsModal.articlesList![index].title,
                              description: newsModal.articlesList![index].description,
                              name: newsModal.articlesList![index].source!.name,
                              I: pt!.flag[index].I,
                              n: pt!.flag[index].n
                            );

                            Navigator.pushNamed(context, 'detail',
                              arguments: newmodal);

                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 10.h,
                              width: 70.w,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 10.h,
                                    width: 50.w,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            "${newsModal.articlesList![index].urlToImage}"),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 10.h,
                                    width: 40.w,
                                    child: Row(children: [
                                      Expanded(
                                        child: Text(
                                            "${newsModal.articlesList![index].title}"),
                                      ),
                                    ]),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: newsModal.articlesList!.length,
                    ),
                  ),
                ],
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

// Container(
// height: 30.h,
// width: double.infinity,
// decoration: BoxDecoration(
// color: Colors.grey.shade300,
// borderRadius: BorderRadius.circular(15),
// border: Border.all(color: Colors.black),
// ),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Container(
// height: 23.h,
// width: double.infinity,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(15),
// border: Border.all(color: Colors.black),
// color: Colors.white,
// ),
// child: ClipRRect(
// borderRadius: BorderRadius.circular(15),
// child: Image.asset(
// "${newsModal.articlesList![index].urlToImage}",
// fit: BoxFit.cover,
// ),
// ),
// ),
// Padding(
// padding: const EdgeInsets.only(left: 10),
// child: Text(
// "${newsModal.articlesList![index].source!.id}",
// style: TextStyle(
// color: Colors.black,
// fontSize: 15,
// ),
// ),
// ),
// Padding(
// padding: const EdgeInsets.only(left: 10),
// child: Text(
// "${newsModal.articlesList![index].source!.name}",
// style: TextStyle(
// color: Colors.black,
// fontSize: 15,
// ),
// ),
// ),
// ],
// ),
// ),
