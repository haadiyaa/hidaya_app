import 'dart:async';
import 'dart:convert';
import 'package:hidhayah/secrets/secrets.dart';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:hidhayah/model/playlistmodel.dart';

part 'youtube_event.dart';
part 'youtube_state.dart';

class YoutubeBloc extends Bloc<YoutubeEvent, YoutubeState> {
  YoutubeBloc() : super(YoutubeInitial()) {
    on<fetchPlaylistEvent>(_fetchPlaylist);
  }

  FutureOr<void> _fetchPlaylist(
      YoutubeEvent event, Emitter<YoutubeState> emit) async {
        PlayListModel playListModel;
        print('object');
    //GET https://youtube.googleapis.com/youtube/v3/playlistItems?part=contentDetails&part=snippet&playlistId=PLkNN0jULK8JC0NHd3EsNGNn2mPKF34-yB&key=[YOUR_API_KEY]

    try {
      final response = await http.get(
          Uri.parse(
              '${Secrets.youtubePlaylistUrl}${Secrets.part}${Secrets.playlistId}PLkNN0jULK8JC0NHd3EsNGNn2mPKF34-yB${Secrets.key}'),
          headers: {
            "Accept": "application/json",
          });
      print(response.body);
      final data=jsonDecode(response.body);
      if (response.statusCode == 200) {
        print('success');
        playListModel=PlayListModel.fromJson(data);
        emit(fetchPlaylistState(playListModel: playListModel));
      } else {
        print('failure');
      }
    } catch (e) {
      print('exception $e');
    }
  }
}
