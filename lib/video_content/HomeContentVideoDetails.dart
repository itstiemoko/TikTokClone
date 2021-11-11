// ignore_for_file: file_names

import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:tiktok/models/Video.dart';

class HomeContentVideoDetails extends StatelessWidget {
  const HomeContentVideoDetails({Key? key, required this.video}) : super(key: key);
  final Video video;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text("@${video.videoPostBy.username}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
          const SizedBox(height: 8),
          ExpandableText(
            "Hello guys !!!" * 10,
            style: const TextStyle(fontSize: 15, color: Colors.white),
            expandText: "Plus",
            collapseText: "Moins",
            maxLines: 2,
            linkColor: Colors.blue,
            expandOnTextTap: true,
            collapseOnTextTap: true,
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.music_note, size: 20, color: Colors.white),
              const SizedBox(width: 8),
              SizedBox(
                  height: 20,
                  width: MediaQuery.of(context).size.width / 2,
                  child: Marquee(
                    text: "Nom audio...",
                    velocity: 10,
                    style: const TextStyle(color: Colors.white),
                  )
              )
            ],
          )
        ],
      ),
    );
  }
}
