part of 'youtube_bloc.dart';

abstract class YoutubeEvent {
}

class fetchPlaylistEvent extends YoutubeEvent{
  final String playlistId;

  fetchPlaylistEvent({required this.playlistId});
}
class fetchPlaylistEvent2 extends YoutubeEvent{
  final String playlistId;

  fetchPlaylistEvent2({required this.playlistId});
}
class fetchPlaylistEvent3 extends YoutubeEvent{
  final String playlistId;

  fetchPlaylistEvent3({required this.playlistId});
}