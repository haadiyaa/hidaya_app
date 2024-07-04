import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hidhayah/model/hadithmodel.dart';

part 'hadith_event.dart';
part 'hadith_state.dart';

class HadithBloc extends Bloc<HadithEvent, HadithState> {
  HadithBloc() : super(HadithInitial()) {
    on<HadithEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
