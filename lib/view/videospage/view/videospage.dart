import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:hidhayah/utils/constants/yotubeitems.dart';
import 'package:hidhayah/view/videospage/view/playerscreen.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideosPage extends StatelessWidget {
  const VideosPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Constants.black,
      appBar: AppBar(
        title: const Text('Watch Videos'),
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            SizedBox(
              width: size.width,
              height: size.height * 0.3,
              child: Swiper(
                autoplay: true,
                itemCount: videoUrls.length,
                pagination: const SwiperPagination(),
                control: const SwiperControl(),
                itemBuilder: (context, index) {
                  final videoId =
                      YoutubePlayer.convertUrlToId(videoUrls[index]);
                  return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>
                                    PlayerScreen(videoId: videoId)));
                      },
                      child: Stack(
                        children: [
                          Container(
                            height: size.height * 0.3,
                            width: size.width,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  YoutubePlayer.getThumbnail(videoId: videoId!),
                                ),
                                fit: BoxFit.cover,
                              ),
                              color: Constants.greenDark,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          Container(
                            height: size.height * 0.3,
                            width: size.width,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Constants.transparent,
                                  Constants.transparent,
                                  Constants.black,
                                ],
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ],
                      ));
                },
              ),
            )
          ],
        ),
        // child: Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: ListView.separated(
        //     separatorBuilder: (context, index) => Constants.height5,
        //     itemCount: videoUrls.length,
        //     itemBuilder: (BuildContext context, int index) {
        //       final videoId=YoutubePlayer.convertUrlToId(videoUrls[index]);
        //       return GestureDetector(
        //         onTap: () {
        //           Navigator.push(context, MaterialPageRoute(builder: (_)=>PlayerScreen(videoId: videoId)));
        //         },
        //         child: Container(
        //           height: size.height * 0.3,
        //           width: size.width,
        //           decoration: BoxDecoration(
        //             image: DecorationImage(image: NetworkImage(YoutubePlayer.getThumbnail(videoId: videoId!),),fit: BoxFit.cover,),
        //             color: Constants.greenDark,
        //             borderRadius: BorderRadius.circular(10),
        //           ),
        //         ),
        //       );
        //     },
        //   ),
        // ),
      ),
    );
  }
}
