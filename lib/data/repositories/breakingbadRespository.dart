import 'package:got/data/models/breakingbadModel.dart';
import 'package:got/data/web_services/breakingbadWebServices.dart';

class BBRepository {
  final BBWebServices bbWebServices;

  BBRepository(this.bbWebServices);

  Future<List<BBCharacterModel>> getAllBBCharacter() async {
    final characters = await bbWebServices.getAllCharacter();
    return characters
        .map((character) => BBCharacterModel.fromJson(character))
        .toList();
  }
}
