import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:newwz/models/customAppBar.dart';
import 'package:newwz/models/articleModel.dart';
import 'package:newwz/providers/categoryNewsProvider.dart';

import 'detailPage.dart';

class CategoryNewsPage extends StatefulWidget {
  CategoryNewsPage({this.category});
  final category;
  @override
  _CategoryNewsPageState createState() => _CategoryNewsPageState();
}

class _CategoryNewsPageState extends State<CategoryNewsPage> {
  List<ArticleModel> _categoryArticles = new List<ArticleModel>();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getCategoryArticleList(widget.category);
  }

  getCategoryArticleList(String category) async {
    CategoryNewsProvider newsProvider = new CategoryNewsProvider();
    await newsProvider.fetchCategoryNews(category: category);
    _categoryArticles = newsProvider.articlesList;
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar().customAppBar,
      body: Container(
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                shrinkWrap: true,
                itemCount: _categoryArticles.length,
                itemBuilder: (context, index) {
                  return NewsTile(
                    imageUrl: _categoryArticles[index].imageUrl,
                    newsTitle: _categoryArticles[index].title,
                    description: _categoryArticles[index].description,
                    publishedAt: DateFormat('yyyy-MM-dd ')
                        .format(_categoryArticles[index].publishedAt),
                    articleUrl: _categoryArticles[index].articleUrl,
                  );
                }),
      ),
    );
  }
}

class NewsTile extends StatelessWidget {
  final String imageUrl, newsTitle, description, publishedAt, articleUrl;

  NewsTile({
    @required this.imageUrl,
    @required this.newsTitle,
    @required this.description,
    @required this.publishedAt,
    @required this.articleUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Column(
        children: <Widget>[
          Card(
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.fill,
              height: 300,
              width: 430,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DetailPage(
                  articleUrl: articleUrl,
                ),
              ));
            },
            title: Text(
              newsTitle,
            ),
            subtitle: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  child: Text(
                    description,
                    // softWrap: true,
//                    overflow: TextOverflow.clip,
                  ),
                  width: 350,
                ),
                Expanded(
                  child: Container(
                    child: Text(
                      'Published At $publishedAt',
                      // softWrap: true,
                      // overflow: TextOverflow.clip,
                      textAlign: TextAlign.end,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
