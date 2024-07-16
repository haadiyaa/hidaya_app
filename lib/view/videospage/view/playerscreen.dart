import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({super.key, required this.videoId});
  final String videoId;

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  
  late final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: widget.videoId,
    flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
    ),
);
  @override
  Widget build(BuildContext context) {
    print(widget.videoId);
    return Scaffold(
      body: YoutubePlayer(controller: _controller),
    );
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}