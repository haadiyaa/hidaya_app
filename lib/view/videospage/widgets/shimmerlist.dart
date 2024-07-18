import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hidhayah/bloc/youtubebloc/youtube_bloc.dart';
import 'package:hidhayah/model/playlistmodel.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:hidhayah/view/videospage/view/playerscreen.dart';
import 'package:shimmer/shimmer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Shimmerlist extends StatefulWidget {
  Shimmerlist({
    super.key,
    required this.size,
    // required this.playListModel,
  });

  final Size size;
  // final PlayListModel playListModel;

  @override
  State<Shimmerlist> createState() => _ShimmerlistState();
}

class _ShimmerlistState extends State<Shimmerlist> {
  @override
  void initState() {
    super.initState();
    // BlocProvider.of<YoutubeBloc>(context)
    //     .add(fetchPlaylistEvent(playlistId1: Constants.kidsPlaylist,playlistId2: Constants.umarPlaylist,playlistId3: Constants.yaqeenInstitutelist));
  }

  @override
  Widget build(BuildContext context) {
    // playListModel=state.playListModel1;
    return SizedBox(
      height: widget.size.height * 0.2,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        separatorBuilder: (context, index) => Constants.width10,
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Shimmer.fromColors(
            baseColor: Constants.greenDark,
            highlightColor: Constants.greenDark2,
            child: Container(
              width: widget.size.width * 0.4,
              height: widget.size.height*0.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Constants.greenDark,
              ),
            ),
          );
        },
      ),
    );
  }
}
