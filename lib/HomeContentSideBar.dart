// ignore_for_file: file_names

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tiktok/models/Video.dart';

class HomeContentSideBar extends StatefulWidget {
  const HomeContentSideBar({Key? key, required this.video}) : super(key: key);
  final Video video;

  @override
  _HomeContentSideBarState createState() => _HomeContentSideBarState();
}

class _HomeContentSideBarState extends State<HomeContentSideBar> with SingleTickerProviderStateMixin
{
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5)
    );
    animationController.repeat();

    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle style = Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 13, color: Colors.white);
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          profileImageButton(),
          homeSideBarItems("like", widget.video.likes, style),
          homeSideBarItems("chat", widget.video.comments, style),
          homeSideBarItems("share", "Partager", style),
          AnimatedBuilder(
            animation: animationController,
            child: Stack(children: [
              SizedBox(
                height: 50,
                width: 50,
                child: Image.asset("assets/images/icons/disc.png")
              )
            ],),
            builder: (context, child){
              return Transform.rotate(angle: 2 * pi * animationController.value, child: child);
            },
          )
        ],
      ),
    );
  }

  profileImageButton()
  {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        Container(height: 50, width: 50, decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(25),
          image: const DecorationImage(image: AssetImage("assets/images/profile.jpg"), fit: BoxFit.cover)
        )),
        Positioned(
          bottom: -10,
          child: Container(
            decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(25)),
            child: const Icon(Icons.add, size: 20, color: Colors.white),
          ),
        )
      ],
    );
  }

  homeSideBarItems(String iconName, String label, TextStyle style)
  {
    return Column(
      children: [
        Image.asset("assets/images/icons/$iconName.png", height: 50, width: 50),
        const SizedBox(height: 5),
        Text(label, style: style)
      ],
    );
  }
}
