import 'package:app/models/news.dart';
import 'package:app/services/api_service.dart';
import 'package:app/views/read_news_view.dart';
import 'package:app/widgets/primary_card.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Future<List<News>> getNews;

  @override
  void initState() {
    super.initState();
    getNews = ApiService().getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          FutureBuilder(
            future: getNews,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<News> news = snapshot.data;

                return ListView.builder(
                  itemCount: news.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemBuilder: (context, index) {
                    var _home = news[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ReadNewsView(news: _home),
                          ),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        height: 135.0,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 8.0,
                        ),
                        child: PrimaryCard(
                          news: _home,
                        ),
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text(("${snapshot.error}"));
              }

              return Container();
            },
          ),
        ],
      ),
    );
  }
}
