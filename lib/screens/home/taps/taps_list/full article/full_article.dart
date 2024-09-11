import 'package:flutter/material.dart';
import 'package:news_app/data/model/article.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';

class FullArticleDetail extends StatelessWidget {
  final Article article;

  const FullArticleDetail({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff39A552),
        title: Text(
          article.title ?? "Article",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                article.urlToImage ?? '',
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height*0.3,
                width: double.infinity,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.error, size: 50),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.source?.name ??
                        'Unknown Source',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff79828B),
                    ),
                  ),
                  Text(
                    article.title ??
                        'No title available.',
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
                  SizedBox(height: MediaQuery.of(context).size.height * 0.07),
                  Text(
                    article.content ?? 'No content available.',
                    style: const TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  GestureDetector(
                    onTap: () => _launchURL(article.url!),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('View Full Article'),
                        Icon(Icons.arrow_forward),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getTimeAgo(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    return timeago.format(dateTime);
  }

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
}
