import 'package:flutter/material.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:hidhayah/utils/styles/textstyle.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({super.key, required this.videoId, this.nextvideoId, required this.text, required this.desc, required this.date});
  final String videoId;
  final String? nextvideoId;
  final String text;                                                                                          
  final String desc;                                                                                          
  final String date;                                                                                          

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
      backgroundColor: Constants.greenDark,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            YoutubePlayer(
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
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(widget.text,style: TextStyles.boldHead,),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text('Published at : ${widget.date}',style: TextStyles.size16thin,),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(widget.desc,style: TextStyles.size18,),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
