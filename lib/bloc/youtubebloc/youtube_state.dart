part of 'youtube_bloc.dart';

abstract class YoutubeState {
  const YoutubeState();
}

final class YoutubeInitial extends YoutubeState {}
 class fetchPlaylistState extends YoutubeState {
  final PlayListModel playListModel1;
  final PlayListModel playListModel2;
  final PlayListModel playListModel3;

  fetchPlaylistState({required this.playListModel1,required this.playListModel2,required this.playListModel3});
 }