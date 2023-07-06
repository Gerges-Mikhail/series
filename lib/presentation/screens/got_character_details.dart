import 'package:flutter/material.dart';
import 'package:got/data/models/got_character_model.dart';

import '../../constants/constants.dart';

class GotCharactersDetailsScreen extends StatelessWidget {
  final GOTCharacter gotcharacter;

  GotCharactersDetailsScreen({Key? key, required this.gotcharacter})
      : super(key: key);
  AppColors appColors = AppColors();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors.darkColor,
      body: CustomScrollView(
        slivers: [
          buildSliverappBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 18.0),
                      child: Container(
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: appColors.blackColor, //New
                                  blurRadius: 25.0,
                                  blurStyle: BlurStyle.outer,
                                  offset: Offset(0,0))
                            ],
                            borderRadius: BorderRadius.all(
                                Radius.circular(15.0) //                 <--- border radius here
                            ),
                            border: Border.all(color: appColors.tealColor)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.person,
                                color: appColors.tealColor,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Name",
                                style: TextStyle(
                                  color: appColors.tealColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),

                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Text(
                                gotcharacter.fullName!,
                                style:  TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 18.0),
                      child: Container(
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: appColors.blackColor, //New
                                  blurRadius: 25.0,
                                  blurStyle: BlurStyle.outer,
                                  offset: Offset(0,0))
                            ],
                            borderRadius: BorderRadius.all(
                                Radius.circular(15.0) //                 <--- border radius here
                            ),
                            border: Border.all(color: appColors.tealColor)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.family_restroom,
                                color: appColors.tealColor,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Family",
                                style: TextStyle(
                                  color: appColors.tealColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),

                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Text(
                                gotcharacter.family!,
                                style:  TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 18.0),
                      child: Container(
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: appColors.blackColor, //New
                                  blurRadius: 25.0,
                                  blurStyle: BlurStyle.outer,
                                  offset: Offset(0,0))
                            ],
                            borderRadius: BorderRadius.all(
                                Radius.circular(15.0) //                 <--- border radius here
                            ),
                            border: Border.all(color: appColors.tealColor)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.title,
                                color: appColors.tealColor,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Title",
                                style: TextStyle(
                                  color: appColors.tealColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),

                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Text(
                                gotcharacter.title!,
                                style:  TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 525,
              )
            ]),
          )
        ],
      ),
    );
  }

  Widget buildSliverappBar() {
    return SliverAppBar(
      backgroundColor: appColors.darkColor,
      expandedHeight: 500,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          gotcharacter.firstName!,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        background: Hero(
            tag: gotcharacter.id as Object,
            child: Image.network(
              gotcharacter.imageUrl!,
              fit: BoxFit.cover,
            )),
      ),
    );
  }
}
