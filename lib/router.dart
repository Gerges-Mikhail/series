import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:got/business-logic/bb_cubit.dart';
import 'package:got/business-logic/got_characters_cubit.dart';
import 'package:got/business-logic/ram_characters_cubit.dart';
import 'package:got/constants/constants.dart';
import 'package:got/data/repositories/breakingbadRespository.dart';
import 'package:got/data/repositories/got_charactersrepository.dart';
import 'package:got/data/repositories/ram_charactersrepository.dart';
import 'package:got/data/web_services/breakingbadWebServices.dart';
import 'package:got/data/web_services/gotwebServices.dart';
import 'package:got/data/web_services/ram_charactersWebServices.dart';
import 'package:got/presentation/screens/BreakingBadCharacterScreen.dart';
import 'package:got/presentation/screens/gotcharacters_screen.dart';

import 'presentation/screens/ramcharacters_screen.dart';

class AppRouter {
  late RAMCharactersRepository ramcharactersRepository;
  late RAMCharactersCubit ramcharactersCubit;
  late BBRepository bbRepository;
  late BbCubit bbCubit;
  late GOTCharactersRepository gotCharactersRepository;
  late GOTCharactersCubit gotCharactersCubit;

  AppRouter() {
    ramcharactersRepository =
        RAMCharactersRepository(RAMCharactersWebServices());
    ramcharactersCubit = RAMCharactersCubit(ramcharactersRepository);
    bbRepository = BBRepository(BBWebServices());
    bbCubit = BbCubit(bbRepository);
    gotCharactersRepository =
        GOTCharactersRepository(GOTCharactersWebServices());
    gotCharactersCubit = GOTCharactersCubit(gotCharactersRepository);
  }

  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case GOTcharactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => gotCharactersCubit,
            child: const GOTCharactersScreen(),
          ),
        );
      case BBcharactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => bbCubit,
            child: const BreakingBadCharacterScreen(),
          ),
        );
      case RAMcharactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => ramcharactersCubit,
            child: const RAMCharactersScreen(),
          ),
        );
    }
    return null;
  }
}
