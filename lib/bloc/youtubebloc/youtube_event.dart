part of 'youtube_bloc.dart';

abstract class YoutubeEvent {
}

class fetchPlaylistEvent extends YoutubeEvent{
  final String playlistId;

  fetchPlaylistEvent({required this.playlistId});
}
