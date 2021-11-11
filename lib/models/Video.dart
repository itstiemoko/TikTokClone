// ignore_for_file: file_names

import 'package:tiktok/models/User.dart';

//Tiktok Video model
class Video
{
  final String videoUrl;
  final User videoPostBy;
  final String likes;
  final String comments;

  Video(this.videoUrl, this.videoPostBy, this.likes, this.comments);
}