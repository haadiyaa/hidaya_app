import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({super.key, required this.videoId, this.nextvideoId});
  final String videoId;
  final String? nextvideoId;

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  late final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: widget.videoId,
    flags: const YoutubePlayerFlags(
      autoPlay: true,
    ),
  );
  @override
  Widget build(BuildContext context) {
    print(widget.videoId);
    return Scaffold(
      body: YoutubePlayer(
        controller: _controller,
        onEnded: (metaData) {
          if (widget.nextvideoId!=null) {
            _controller.load(widget.nextvideoId!);
            _controller.play();
          }
          else{
            _controller.pause();
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
