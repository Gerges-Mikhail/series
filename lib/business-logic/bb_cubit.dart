import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:got/data/models/breakingbadModel.dart';
import 'package:got/data/repositories/breakingbadRespository.dart';
import 'package:meta/meta.dart';

part 'bb_state.dart';

class BbCubit extends Cubit<BbState> {
  final BBRepository BBcharactersRepostry;
  List<BBCharacterModel> BBcharacters = [];
  late List<BBCharacterModel> allBBCharacters;
  late List<BBCharacterModel> searchedForCharacters;
  BbCubit(this.BBcharactersRepostry) : super(BbInitial());
  static BbCubit get(context) => BlocProvider.of(context);
  List<BBCharacterModel> getAllBBCharacters() {
    BBcharactersRepostry.getAllBBCharacter().then((characters) {
      emit(BBCharacterLoaded(characters));
      this.BBcharacters = characters;
    });
    return BBcharacters;
  }

}
