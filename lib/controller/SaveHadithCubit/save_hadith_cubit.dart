import 'package:bloc/bloc.dart';
import 'package:hadith/controller/SaveHadithCubit/save_hadith_state.dart';
import 'package:hadith/model/hadith_model.dart';

class SaveHadith extends Cubit<HadithSavedState> {
  SaveHadith() : super(InitialState());

  List<Hadith> hadiths = [];
  saveHadith(Hadith hadith) {
    emit(InitialState());
    hadiths.add(hadith);
    emit(HadithSavedSuccessfully());
  }
}
