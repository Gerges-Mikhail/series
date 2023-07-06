import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:got/business-logic/bb_cubit.dart';
import 'package:got/constants/constants.dart';
import 'package:got/data/models/breakingbadModel.dart';
import 'package:got/presentation/widgets/appBarActions.dart';
import 'package:got/presentation/widgets/appbar_title.dart';
import 'package:got/presentation/widgets/breakingbadCharacterItem.dart';
import 'package:got/presentation/widgets/errorConnectionWidget.dart';
import 'package:got/presentation/widgets/loading.dart';

class BreakingBadCharacterScreen extends StatefulWidget {
  const BreakingBadCharacterScreen({Key? key}) : super(key: key);

  @override
  State<BreakingBadCharacterScreen> createState() => _BreakingBadCharacterScreenState();
}

class _BreakingBadCharacterScreenState extends State<BreakingBadCharacterScreen> {
  late List<BBCharacterModel> allCharacters;
  late List<BBCharacterModel> searchedForCharacters;
  bool _isClickedSearch = false;
  final _searchTextController = TextEditingController();
  AppColors appColors = AppColors();
  @override
  void dispose() {
    super.dispose();
    _searchTextController.dispose();
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<BbCubit>(context).getAllBBCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors.lightColor,
      appBar: AppBar(
        backgroundColor: appColors.darkColor,
        centerTitle: true,
        title: _isClickedSearch
            ? _buildSearchField()
            : buildAppBarrTitle("Breaking Bad"),
        leading: InkWell(
            onTap: () {
              Navigator.pushReplacementNamed(context, GOTcharactersScreen);
            },
            child: Container(
              margin: EdgeInsets.fromLTRB(10, 2, 0, 2),
              child: Icon(
                Icons.next_week_rounded,
                color: appColors.tealColor,
              ),
            )),
        actions: buildAppBarrActions(
            _isClickedSearch, _clearSearch, _startsearch, pop),
      ),
      body: OfflineBuilder(
        connectivityBuilder: (
            BuildContext context,
            ConnectivityResult connectivity,
            Widget child,
            ) {
          final bool connected = connectivity != ConnectivityResult.none;
          if (connected) {
            return BlocBuilder<BbCubit, BbState>(
                builder: (context, state) {
                  if (state is BBCharacterLoaded) {
                    allCharacters = (state).getCharacters;
                    return buildCharactersList();
                  } else {
                    return showLoadingIndicator();
                  }
                });
          } else {
            return ErrorConnectionWidget();
          }
        },
        child: Center(
          child: CircularProgressIndicator(
            color: appColors.tealColor,
          ),
        ),
      ),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        backgroundColor: appColors.lightColor,
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
              buildAppBarrActions(
                  _isClickedSearch, _clearSearch, _startsearch, pop);
            },
          ),
        ],
      ),
    );
  }

  Widget buildCharactersList() {
    return SingleChildScrollView(
      child: Column(
        children: [
          GridView.builder(
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
                return BBCharacterItem(
                  character: _searchTextController.text.isEmpty
                      ? allCharacters[index]
                      : searchedForCharacters[index],
                );
              }),
        ],
      ),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _searchTextController,
      cursorColor: Colors.cyan,
      decoration: InputDecoration(
        hintText: 'Find Game of thrones character',
        border: InputBorder.none,
        hintStyle: TextStyle(
          color: appColors.lightColor,
        ),
      ),
      style: TextStyle(
        color: appColors.thirdColor,
      ),
      onChanged: (searchedCharacter) {
        addSearchedForItemsToSearchedList(searchedCharacter);
      },
    );
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
      _isClickedSearch = true;
    });
  }

  void _stopSearching() {
    _clearSearch();
    setState(() {
      _isClickedSearch = false;
    });
  }

  void _clearSearch() {
    setState(() {
      _searchTextController.clear();
    });
  }
}
