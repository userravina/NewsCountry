class NewsModal {
  String? status;
  int? totalResults;
  List<ArticleModal>? articlesList = [];
  String? I,n,country;

  NewsModal({this.status, this.totalResults, this.articlesList,this.I,this.n,this.country});

  factory NewsModal.fromjson(Map m1)
  {

    List l1 = m1['articles'];
    return NewsModal(status: m1['status'],
        totalResults: m1['totalResults'],
        articlesList: l1
            .map((e) => ArticleModal.frojson(e))
            .toList(),);
  }
}

class ArticleModal {
  String? author, title, description, url, urlToImage, publishedAt, content;
  SourceModal? source;

  ArticleModal(
      {this.title, this.description, this.url, this.author, this.content, this.publishedAt, this.source, this.urlToImage});

  factory ArticleModal.frojson(Map m1)
  {
    return ArticleModal(description: m1['description'],
        title: m1['title'],
        url: m1['url'],
        author: m1['author'],
        content: m1['content'],
        publishedAt: m1['publishedAt'],
        urlToImage: m1['urlToImage'],
        source: SourceModal.fromjson(m1['source']));
  }
}

class SourceModal {
  String? id, name;

  SourceModal({this.id, this.name});

  factory SourceModal.fromjson(Map m1)
  {
    return SourceModal(id: m1['id'], name: m1['name']);
  }
}
