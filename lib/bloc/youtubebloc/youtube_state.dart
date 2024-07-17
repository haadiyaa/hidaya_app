part of 'youtube_bloc.dart';

abstract class YoutubeState {
  const YoutubeState();
}

final class YoutubeInitial extends YoutubeState {}
 class fetchPlaylistState extends YoutubeState {
  final PlayListModel playListModel;

  fetchPlaylistState({required this.playListModel});
 }
  class fetchPlaylistState2 extends YoutubeState {
  final PlayListModel playListModel;

  fetchPlaylistState2({required this.playListModel});
 }

 class fetchPlaylistState3 extends YoutubeState {
  final PlayListModel playListModel;

  fetchPlaylistState3({required this.playListModel});
 }