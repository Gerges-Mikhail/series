part of 'bb_cubit.dart';

@immutable
abstract class BbState {}

class BbInitial extends BbState {}
class BBCharacterLoaded extends BbState {
  final List<BBCharacterModel> getCharacters;
  BBCharacterLoaded(this.getCharacters);
}