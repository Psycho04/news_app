import 'package:flutter/material.dart';
import 'package:news_app/data/api/api_manager.dart';
import 'package:news_app/data/model/source.dart';
import 'package:news_app/data/model/sources_response.dart';
import 'package:news_app/screens/home/taps/taps_list/news_list.dart';

class TapsList extends StatefulWidget {
  final String categoryId;
  const TapsList(
    this.categoryId, {
    super.key,
  });

  @override
  State<TapsList> createState() => _TapsListState();
}

class _TapsListState extends State<TapsList> {
  int selectedTap = 0;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourcesResponse>(
      future: ApiManager.getSources(widget.categoryId),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        } else if (snapshot.hasData) {
          return buildTapsList(snapshot.data!.sources!);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget buildTapsList(List<Source> sources) {
    List<Widget> taps = sources
        .map((source) =>
            mapSourceToTap(source, selectedTap == sources.indexOf(source)))
        .toList();
    List<Widget> tapsBody =
        sources.map((source) => NewsList(source: source)).toList();
    return DefaultTabController(
      length: sources.length,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TabBar(
            tabs: taps,
            isScrollable: true,
            indicatorColor: Colors.transparent,
            onTap: (index) {
              setState(() {
                selectedTap = index;
              });
            },
          ),
          Expanded(child: TabBarView(children: tapsBody)),
        ],
      ),
    );
  }

  Widget mapSourceToTap(Source source, bool isSelected) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.012),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: const Color(0xff39A552), width: 2),
          color: isSelected ? const Color(0xff39A552) : Colors.white),
      child: Text(
        source.name!,
        style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: isSelected ? Colors.white : const Color(0xff39A552)),
      ),
    );
  }
}
