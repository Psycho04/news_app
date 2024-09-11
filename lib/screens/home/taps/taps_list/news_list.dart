import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/data/api/api_manager.dart';
import 'package:news_app/data/model/article.dart';
import 'package:news_app/data/model/articles_response.dart';
import 'package:news_app/data/model/source.dart';
import 'package:news_app/screens/home/taps/taps_list/full%20article/full_article.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsList extends StatelessWidget {
  final Source source;
  const NewsList({super.key, required this.source});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ArticlesResponse>(
      future: ApiManager.getArticles(source.id!),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        } else if (snapshot.hasData) {
          return buildNewsList(snapshot.data!.articles!);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget buildNewsList(List<Article> list) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return articleToNews(context, list[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget articleToNews(BuildContext context, Article article) {  
  return Padding(  
    padding: EdgeInsets.symmetric(  
        horizontal: MediaQuery.of(context).size.height * 0.025),  
    child: InkWell(  
      onTap: () {  
        // Navigate to the Full Article Detail screen  
        Navigator.push(  
          context,  
          MaterialPageRoute(  
            builder: (context) => FullArticleDetail(article: article),  
          ),  
        );  
      },  
      child: Card(  
        child: Column(  
          crossAxisAlignment: CrossAxisAlignment.start,  
          children: [  
            ClipRRect(  
              borderRadius: BorderRadius.circular(15),  
              child: CachedNetworkImage(  
                fit: BoxFit.cover,  
                imageUrl: article.urlToImage!,  
                height: MediaQuery.of(context).size.height * 0.25,  
                placeholder: (context, url) =>  
                    const Center(child: CircularProgressIndicator()),  
                errorWidget: (context, url, error) => const Icon(Icons.error),  
              ),  
            ),  
            Text(  
              article.source!.name!,  
              style: const TextStyle(  
                  fontSize: 13,  
                  fontWeight: FontWeight.w400,  
                  color: Color(0xff79828B)),  
            ),  
            Text(  
              article.title!,  
              style: const TextStyle(  
                fontSize: 15,  
                fontWeight: FontWeight.w500,  
                color: Color(0xff42505C),  
              ),  
            ),  
            Row(  
              mainAxisAlignment: MainAxisAlignment.end,  
              children: [  
                Text(  
                  getTimeAgo(article.publishedAt!),  
                  style: const TextStyle(  
                    fontSize: 15,  
                    fontWeight: FontWeight.w400,  
                    color: Color(0xffA3A3A3),  
                  ),  
                ),  
              ],  
            ),  
            const SizedBox(height: 20),  
          ],  
        ),  
      ),  
    ),  
  );  
}

  String getTimeAgo(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    return timeago.format(dateTime);
  }
}
