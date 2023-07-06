
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:got/constants/constants.dart';
import 'package:got/data/models/got_character_model.dart';
import 'package:got/presentation/screens/got_character_details.dart';

class GOTCharacterItem extends StatelessWidget {
  final GOTCharacter character;
  GOTCharacterItem({Key? key, required this.character}) : super(key: key);
  AppColors appColors = AppColors();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: appColors.blackColor, //New
              blurRadius: 25.0,
              offset: Offset(10, 10))
        ],
        color: appColors.tealColor,
        borderRadius: BorderRadius.circular(8),
      ),

      child: GridTile(
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    GotCharactersDetailsScreen(gotcharacter: character)));
          },
          child: Hero(
            tag: character.id as Object,
            child: Container(
              color: Colors.grey,
              child: character.image!.isNotEmpty
                  ? FadeInImage.assetNetwork(
                      width: double.infinity,
                      height: double.infinity,
                      placeholder: 'images/loading.jpg',
                      alignment: Alignment.center,
                      image: character.imageUrl.toString(),
                      fit: BoxFit.cover,
                    )
                  : Image.asset('images/cairo.jpeg'),
            ),
          ),
        ),
        footer: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          color: appColors.lightColor.withOpacity(.5),
          alignment: Alignment.topCenter,
          child: Text(
            character.fullName!,
            style: TextStyle(
                height: 1.3,
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
