import 'dart:async';
import 'dart:convert';
import 'package:hidhayah/secrets/secrets.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hidhayah/model/playlistmodel.dart';

part 'youtube_event.dart';
part 'youtube_state.dart';

class YoutubeBloc extends Bloc<YoutubeEvent, YoutubeState> {
  YoutubeBloc() : super(YoutubeInitial()) {
    on<fetchPlaylistEvent>(_fetchPlaylist);
  }

  FutureOr<void> _fetchPlaylist(
      fetchPlaylistEvent event, Emitter<YoutubeState> emit) async {
    PlayListModel playListModel1;
    PlayListModel playListModel2;
    PlayListModel playListModel3;
    print('object');

    try {
      final response1 = await http.get(
          Uri.parse(
              '${Secrets.youtubePlaylistUrl}${Secrets.part}${Secrets.playlistId}${Constants.kidsPlaylist}${Secrets.key}'),
          headers: {
            "Accept": "application/json",
          });
      final response2 = await http.get(
          Uri.parse(
              '${Secrets.youtubePlaylistUrl}${Secrets.part}${Secrets.playlistId}${Constants.umarPlaylist}${Secrets.key}'),
          headers: {
            "Accept": "application/json",
          });
      final response3 = await http.get(
          Uri.parse(
              '${Secrets.youtubePlaylistUrl}${Secrets.part}${Secrets.playlistId}${Constants.yaqeenInstitutelist}${Secrets.key}'),
          headers: {
            "Accept": "application/json",
          });
      print(response1.body);
      print(response2.body);
      print(response3.body);
      final data1 = jsonDecode(response1.body);
      final data2 = jsonDecode(response2.body);
      final data3 = jsonDecode(response3.body);
      if (response1.statusCode == 200 &&
          response2.statusCode == 200 &&
          response3.statusCode == 200) {
        print('success');
        playListModel1 = PlayListModel.fromJson(data1);
        playListModel2 = PlayListModel.fromJson(data2);
        playListModel3 = PlayListModel.fromJson(data3);
        emit(fetchPlaylistState(
            playListModel1: playListModel1,
            playListModel2: playListModel2,
            playListModel3: playListModel3));
      } else {
        print('failure');
      }
    } catch (e) {
      print('exception $e');
    }
  }

}
