part of 'surahlist_bloc.dart';

abstract class SurahlistEvent {
  const SurahlistEvent();
}

class SurahlistFetchEvent extends SurahlistEvent {}

class SurahFetchEvent extends SurahlistEvent {
  final String index;
  SurahFetchEvent({required this.index});
}
