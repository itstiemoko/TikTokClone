// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:tiktok/HomeContentSideBar.dart';
import 'package:tiktok/models/tiktok_data.dart';
import 'package:tiktok/video_content/HomeContentVideoDetails.dart';
import 'package:tiktok/video_content/VideoView.dart';

class HomePageContent extends StatefulWidget {
  const HomePageContent({Key? key}) : super(key: key);

  @override
  _HomePageContentState createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {

  bool isForYouSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){
                setState(() {
                  isForYouSelected = false;
                });
              },
              child:  Text("Abonnements", style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: !isForYouSelected ? 18 : 15, color: !isForYouSelected ? Colors.white : Colors.grey)),
            ),
            Text("   |   ", style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 15, color: Colors.grey)),
            GestureDetector(
              onTap: (){
                setState(() {
                  isForYouSelected = true;
                });
              },
              child: Text("Pour toi", style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: isForYouSelected ? 18 : 15, color: isForYouSelected ? Colors.white : Colors.grey)),
            )
          ],
        )
      ),
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: videos.length,
        itemBuilder: (context, pageIndex){
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              VideoView(video: videos[pageIndex]),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 3,
                      child: SizedBox(
                        child: HomeContentVideoDetails(video: videos[pageIndex]),
                        height: MediaQuery.of(context).size.height / 4,
                      )
                  ),
                  Expanded(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height / 1.75,
                        child: HomeContentSideBar(video: videos[pageIndex]),
                      )
                  )
                ],
              )
            ],
          );
        },
      )
    );
  }
}
