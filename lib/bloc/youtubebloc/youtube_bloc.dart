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
    on<fetchPlaylistEvent2>(_fetchPlaylist2);
    on<fetchPlaylistEvent3>(_fetchPlaylist3);
  }

  FutureOr<void> _fetchPlaylist(
      fetchPlaylistEvent event, Emitter<YoutubeState> emit) async {
        PlayListModel playListModel;
        print('object');

    try {
      final response = await http.get(
          Uri.parse(
              '${Secrets.youtubePlaylistUrl}${Secrets.part}${Secrets.playlistId}${event.playlistId}${Secrets.key}'),
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

  Future<void> _fetchPlaylist2(fetchPlaylistEvent2 event, Emitter<YoutubeState> emit) async {
    PlayListModel playListModel;
        print('object');

    try {
      final response = await http.get(
          Uri.parse(
              '${Secrets.youtubePlaylistUrl}${Secrets.part}${Secrets.playlistId}${event.playlistId}${Secrets.key}'),
          headers: {
            "Accept": "application/json",
          });
      print(response.body);
      final data=jsonDecode(response.body);
      if (response.statusCode == 200) {
        print('success');
        playListModel=PlayListModel.fromJson(data);
        emit(fetchPlaylistState2(playListModel: playListModel));
      } else {
        print('failure');
      }
    } catch (e) {
      print('exception $e');
    }
  }

  Future<void> _fetchPlaylist3(fetchPlaylistEvent3 event, Emitter<YoutubeState> emit) async {
    PlayListModel playListModel;
        print('object');
    //GET https://youtube.googleapis.com/youtube/v3/playlistItems?part=contentDetails&part=snippet&playlistId=PLkNN0jULK8JC0NHd3EsNGNn2mPKF34-yB&key=[YOUR_API_KEY]
    //PLkNN0jULK8JC0NHd3EsNGNn2mPKF34-yB

    try {
      final response = await http.get(
          Uri.parse(
              '${Secrets.youtubePlaylistUrl}${Secrets.part}${Secrets.playlistId}${event.playlistId}${Secrets.key}'),
          headers: {
            "Accept": "application/json",
          });
      print(response.body);
      final data=jsonDecode(response.body);
      if (response.statusCode == 200) {
        print('success');
        playListModel=PlayListModel.fromJson(data);
        emit(fetchPlaylistState3(playListModel: playListModel));
      } else {
        print('failure');
      }
    } catch (e) {
      print('exception $e');
    }
  }
}
