import 'package:flutter/foundation.dart';
import 'package:newscountry/news_country/modal/news_modal.dart';
import 'package:newscountry/utils/Api_news_country.dart';

class news_provider extends ChangeNotifier {

  String selecteindex='us';

   Changeindex(String? index)
  {
    selecteindex = index!;
    notifyListeners();
  }

  Future<NewsModal> getdata({required String con}) async {
    Api_News apiNews = Api_News();
    return await apiNews.getnewsdata(country: con);
  }

  List<NewsModal> flag = [
    NewsModal(I: "assets/images/n1.png", n: "US",country: "US"),
    NewsModal(I: "assets/images/n2.png", n: "IN",country: "IN"),
    NewsModal(I: "assets/images/n3.png", n: "CA",country: "CA"),
    NewsModal(I: "assets/images/n4.png", n: "CN",country: "CN"),
    NewsModal(I: "assets/images/n5.jpeg", n: "JP",country: "JP"),
    NewsModal(I: "assets/images/n6.png", n: "FR",country: "FR"),
  ];
}
