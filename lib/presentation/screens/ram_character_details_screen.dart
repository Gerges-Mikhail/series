import 'package:flutter/material.dart';
import 'package:got/data/models/ram_characters_model.dart';

import '../../constants/constants.dart';
import '../widgets/appBarActions.dart';

class RAMCharactersDetailsScreen extends StatelessWidget {
  final RAMCharacter ramcharacter;

  const RAMCharactersDetailsScreen({Key? key, required this.ramcharacter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors.whiteColor,
      body: CustomScrollView(
        slivers: [
          buildSliverappBar(),
          SliverList(
            delegate: SliverChildListDelegate(
                [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    //name
                    Padding(
                      padding: const EdgeInsets.only(bottom: 18.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: appColors.tealColor,
                            boxShadow: [
                              BoxShadow(
                                  color: appColors.tealColor, //New
                                  blurRadius: 25.0,
                                  blurStyle: BlurStyle.outer,
                                  offset: const Offset(0,0))
                            ],
                            borderRadius: const BorderRadius.all(
                                Radius.circular(15.0) //
                            ),
                            border: Border.all(color: appColors.tealColor)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.person,
                                color: appColors.whiteColor,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Name",
                                style: TextStyle(
                                  color: appColors.whiteColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),

                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              Text(
                                ramcharacter.name!,
                                style:  const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    //Species
                    Padding(
                      padding: const EdgeInsets.only(bottom: 18.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: appColors.tealColor,
                            boxShadow: [
                              BoxShadow(
                                  color: appColors.tealColor, //New
                                  blurRadius: 25.0,
                                  blurStyle: BlurStyle.outer,
                                  offset: const Offset(0,0))
                            ],
                            borderRadius: const BorderRadius.all(
                                const Radius.circular(15.0) //
                            ),
                            border: Border.all(color: appColors.tealColor)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.merge_type_rounded,
                                color: appColors.whiteColor,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Species",
                                style: TextStyle(
                                  color: appColors.whiteColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),

                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              Text(
                                ramcharacter.species!,
                                style:  const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    //status
                    Padding(
                      padding: const EdgeInsets.only(bottom: 18.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: appColors.tealColor,
                            boxShadow: [
                              BoxShadow(
                                  color: appColors.tealColor, //New
                                  blurRadius: 25.0,
                                  blurStyle: BlurStyle.outer,
                                  offset: const Offset(0,0))
                            ],
                            borderRadius: const BorderRadius.all(
                                Radius.circular(15.0) //
                            ),
                            border: Border.all(color: appColors.tealColor)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.live_help,
                                color: appColors.whiteColor,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Status",
                                style: TextStyle(
                                  color: appColors.whiteColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),

                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              Text(
                                ramcharacter.status!,
                                style:  const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    //Gender
                    Padding(
                      padding: const EdgeInsets.only(bottom: 18.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: appColors.tealColor,
                            boxShadow: [
                              BoxShadow(
                                  color: appColors.tealColor, //New
                                  blurRadius: 25.0,
                                  blurStyle: BlurStyle.outer,
                                  offset: const Offset(0,0))
                            ],
                            borderRadius: const BorderRadius.all(
                                const Radius.circular(15.0) //
                            ),
                            border: Border.all(color: appColors.tealColor)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.male,
                                color: appColors.whiteColor,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Gender",
                                style: TextStyle(
                                  color: appColors.whiteColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),

                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              Text(
                                ramcharacter.gender!,
                                style:  const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    //First Created
                    Padding(
                      padding: const EdgeInsets.only(bottom: 18.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: appColors.tealColor,
                            boxShadow: [
                              BoxShadow(
                                  color: appColors.tealColor, //New
                                  blurRadius: 25.0,
                                  blurStyle: BlurStyle.outer,
                                  offset: const Offset(0,0))
                            ],
                            borderRadius: const BorderRadius.all(
                                Radius.circular(15.0) //
                            ),
                            border: Border.all(color: appColors.tealColor)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Created",
                                style: TextStyle(
                                  color: appColors.whiteColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Text(
                                ramcharacter.created!.trim(),
                                style:  const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    //Origin
                    Padding(
                      padding: const EdgeInsets.only(bottom: 18.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: appColors.tealColor,
                            boxShadow: [
                              BoxShadow(
                                  color: appColors.tealColor, //New
                                  blurRadius: 25.0,
                                  blurStyle: BlurStyle.outer,
                                  offset: const Offset(0,0))
                            ],
                            borderRadius: const BorderRadius.all(
                                const Radius.circular(15.0) //
                            ),
                            border: Border.all(color: appColors.tealColor)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.crop_original,
                                color: appColors.whiteColor,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Origin",
                                style: TextStyle(
                                  color: appColors.whiteColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),

                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              Text(
                                ramcharacter.origin?.name ?? "",
                                style:  const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    //Location
                    Padding(
                      padding: const EdgeInsets.only(bottom: 18.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: appColors.tealColor,
                            boxShadow: [
                              BoxShadow(
                                  color: appColors.tealColor, //New
                                  blurRadius: 25.0,
                                  blurStyle: BlurStyle.outer,
                                  offset: const Offset(0,0))
                            ],
                            borderRadius: const BorderRadius.all(
                                Radius.circular(15.0) //
                            ),
                            border: Border.all(color: appColors.tealColor)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: appColors.whiteColor,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Location",
                                style: TextStyle(
                                  color: appColors.whiteColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),

                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              Text(
                                ramcharacter.location?.name ?? "",
                                style:  const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    //Number of Episodes
                    Padding(
                      padding: const EdgeInsets.only(bottom: 18.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: appColors.tealColor,
                            boxShadow: [
                              BoxShadow(
                                  color: appColors.tealColor, //New
                                  blurRadius: 25.0,
                                  blurStyle: BlurStyle.outer,
                                  offset: const Offset(0,0))
                            ],
                            borderRadius: const BorderRadius.all(
                                const Radius.circular(15.0) //
                            ),
                            border: Border.all(color: appColors.tealColor)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.numbers,
                                color: appColors.whiteColor,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Number of Episodes",
                                style: TextStyle(
                                  color: appColors.whiteColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),

                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                ramcharacter.episode?.length.toString() ?? "",
                                style:  const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
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
      backgroundColor: appColors.tealColor,
      expandedHeight: 400,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          ramcharacter.name!,
          style: TextStyle(
            color: Colors.brown.shade900,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        background: Hero(
            tag: ramcharacter.id as Object,
            child: Image.network(
              ramcharacter.image!,
              fit: BoxFit.fill,
            )),
      ),
    );
  }
}
