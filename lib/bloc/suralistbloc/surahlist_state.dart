part of 'surahlist_bloc.dart';

abstract class SurahlistState {}

class SurahlistInitial extends SurahlistState {}

class SurahLoadingState extends SurahlistState {}
class SurahFetchState extends SurahlistState {
  final SurahListModel surahListModel;

  SurahFetchState({required this.surahListModel});
}
