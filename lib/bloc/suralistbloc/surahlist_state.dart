part of 'surahlist_bloc.dart';

abstract class SurahlistState {}

class SurahlistInitial extends SurahlistState {}

class SurahLoadingState extends SurahlistState {}
class SurahlistFetchState extends SurahlistState {
  final SurahListModel surahListModel;

  SurahlistFetchState({required this.surahListModel});
}

class SurahFetchErrorState extends SurahlistState {
  final String msg;

  SurahFetchErrorState({required this.msg});
}

class SurahFetchState extends SurahlistState {
  final SurahModel surahModel;

  SurahFetchState({required this.surahModel});
}
