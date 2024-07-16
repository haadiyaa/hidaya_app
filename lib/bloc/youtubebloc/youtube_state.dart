part of 'youtube_bloc.dart';

abstract class YoutubeState {
  const YoutubeState();
}

final class YoutubeInitial extends YoutubeState {}
 class fetchPlaylistState extends YoutubeState {
  final PlayListModel playListModel;

  fetchPlaylistState({required this.playListModel});
 }
