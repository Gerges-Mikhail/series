import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:got/business-logic/ram_characters_cubit.dart';
import 'package:got/presentation/widgets/appBarActions.dart';
import 'package:got/presentation/widgets/ramcharacter_item.dart';

import '../../constants/constants.dart';
import '../../data/models/ram_characters_model.dart';
import '../widgets/appbar_title.dart';
import '../widgets/loading.dart';

class RAMCharactersScreen extends StatefulWidget {
  const RAMCharactersScreen({Key? key}) : super(key: key);

  @override
  State<RAMCharactersScreen> createState() => _RAMCharactersScreenState();
}
class _RAMCharactersScreenState extends State<RAMCharactersScreen> {
  late List<RAMCharacter> allCharacters;
  late List<RAMCharacter> searchedForCharacters;
  bool _isSearching = false;
  final _searchTextController = TextEditingController();
  AppColors appColors = AppColors();
  bool _isClickedSearch = false;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<RAMCharactersCubit>(context).getAllRAMCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColors.tealColor,
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pushNamed(context, BBcharactersScreen);
          },
          child: Icon(Icons.next_week_rounded,color: appColors.darkColor,),
        ),
        title: _isSearching
            ? _buildSearchField()
            : Text('Rick and Morty',style: TextStyle(color: appColors.darkColor),),
        actions: buildAppBarrActionsRAM(_isClickedSearch, _clearSearch, _startsearch, pop),
      ),
      body: OfflineBuilder(
        connectivityBuilder: (
          BuildContext context,
          ConnectivityResult connectivity,
          Widget child,
        ) {
          final bool connected = connectivity != ConnectivityResult.none;
          if (connected) {
            return buildBlocWidget();
          } else {
            return Center(
              child: Column(
                children: const [
                  Icon(
                    Icons.signal_wifi_statusbar_connected_no_internet_4_sharp,
                    size: 60,
                    color: Colors.red,
                  ),
                  Text("Please Check Your Internet Connection")
                ],
              ),
            );
          }
        },
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        backgroundColor: appColors.tealColor,
        children: [
          FloatingActionButton.small(
            backgroundColor: appColors.tealColor,
            heroTag: null,
            child: const Icon(Icons.other_houses),
            onPressed: () {
              Navigator.pushNamed(context, GOTcharactersScreen);
            },
          ),
          FloatingActionButton.small(
            backgroundColor: appColors.tealColor,
            heroTag: null,
            child: const Icon(Icons.search),
            onPressed: () {
              // buildAppBarrActions(
              //     _isClickedSearch, _clearSearch, _startsearch, pop);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _searchTextController,
      cursorColor: Colors.cyan,
      decoration:  InputDecoration(
        hintText: 'Find Ricky and Morty character',
        border: InputBorder.none,
        hintStyle:  TextStyle(
          color: appColors.darkColor,
        ),
      ),
      style:  TextStyle(
        color: appColors.darkColor,
      ),
      onChanged: (searchedCharacter) {
        addSearchedForItemsToSearchedList(searchedCharacter);
      },
    );
  }


  Widget buildBlocWidget() {
    return BlocBuilder<RAMCharactersCubit, RAMCharactersState>(
        builder: (context, state) {
      if (state is RAMCharactersloaded) {
        allCharacters = (state).ramcharacters;
        return buildLoadedListWidgets();
      } else {
        return showLoadingIndicator();
      }
    });
  }

  Widget buildLoadedListWidgets() {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildCharactersList(),
        ],
      ),
    );
  }

  Widget buildCharactersList() {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
        ),
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: _searchTextController.text.isEmpty
            ? allCharacters.length
            : searchedForCharacters.length,
        itemBuilder: (context, index) {
          return RAMCharacterItem(
            character: _searchTextController.text.isEmpty
                ? allCharacters[index]
                : searchedForCharacters[index],
          );
        });
  }

  void addSearchedForItemsToSearchedList(String searchedCharacter) {
    searchedForCharacters = allCharacters
        .where((character) =>
            character.name!.toLowerCase().startsWith(searchedCharacter))
        .toList();
    setState(() {});
  }
  void pop() {
    Navigator.pop(context);
  }
  void _startsearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));
    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearching() {
    _clearSearch();
    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearch() {
    setState(() {
      _searchTextController.clear();
    });
  }
}
