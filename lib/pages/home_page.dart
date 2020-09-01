import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:newwz/models/articleModel.dart';
import 'package:newwz/models/categoryModel.dart';
import 'package:newwz/models/customAppBar.dart';
import 'package:newwz/pages/category_newsPage.dart';
import 'package:newwz/providers/categoryProvider.dart';
import 'package:newwz/providers/newsProvider.dart';
import 'package:newwz/pages/detailPage.dart';

class HomePage extends StatefulWidget {
  final String title;

  HomePage({this.title});

  @override
  _HomePageState createState() => _HomePageState(title);
}

class _HomePageState extends State<HomePage> {
  var title;

  _HomePageState(this.title);

  List<CategoryModel> _categories = new List<CategoryModel>();
  List<ArticleModel> _articles = new List<ArticleModel>();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _categories = getCategories();
    getArticleList();
  }

  getArticleList() async {
    NewsProvider newsProvider = new NewsProvider();
    await newsProvider.fetchNews();
    _articles = newsProvider.articlesList;
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar().customAppBar,
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            /// Categories...
            Container(
              padding: EdgeInsets.all(10),
              height: 80,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _categories.length,
                itemBuilder: (context, index) {
                  return CategoryTile(
                    imageUrl: _categories[index].imageUrl,
                    categoryName: _categories[index].categoryName,
                  );
                },
                scrollDirection: Axis.horizontal,
              ),
            ),

            /// news Articles...
            Expanded(
              child: Container(
                child: isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: _articles.length,
                        itemBuilder: (context, index) {
                          return NewsTile(
                            imageUrl: _articles[index].imageUrl,
                            newsTitle: _articles[index].title,
                            description: _articles[index].description,
                            publishedAt: DateFormat('yyyy-MM-dd ')
                                .format(_articles[index].publishedAt),
                            articleUrl: _articles[index].articleUrl,
                          );
                        }),
              ),
//                ),
//              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String imageUrl, categoryName;

  CategoryTile({this.imageUrl, this.categoryName});

  @override
  Widget build(BuildContext context) {
    var categoryTextStyle = TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w500,
    );

    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CategoryNewsPage(
                  category: categoryName.toLowerCase(),
                )));
      },
      child: Container(
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 1)),
        child: Stack(
          alignment: Alignment.center,
          overflow: Overflow.clip,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imageUrl,
                fit: BoxFit.fill,
                width: 130,
                height: 60,
              ),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black26,
              ),
              width: 130,
              height: 60,
              child: Text(
                categoryName,
                textAlign: TextAlign.center,
                style: categoryTextStyle,
                softWrap: true,
              ),
            ),
          ],
        ),
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
