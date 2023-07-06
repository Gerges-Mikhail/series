import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:got/constants/constants.dart';
import 'package:got/data/models/got_character_model.dart';

import '../data/repositories/got_charactersrepository.dart';

part 'got_characters_state.dart';

class GOTCharactersCubit extends Cubit<GotCharactersState> {
  final GOTCharactersRepository charactersRepostry;
  List<GOTCharacter> gotcharacters = [];
  late List<GOTCharacter> allCharacters;
  late List<GOTCharacter> searchedForCharacters;
  GOTCharactersCubit(this.charactersRepostry) : super(GOTCharactersInitial());

  List<GOTCharacter> getAllGOTCharacters() {
    charactersRepostry.getAllGOTCharacters().then((characters) {
      emit(GOTCharactersloaded(characters));
      this.gotcharacters = characters;
    });
    return gotcharacters;
  }


}

