import 'package:dio/dio.dart';
import 'package:got/constants/constants.dart';

class GOTCharactersWebServices{
  Dio dio=Dio();
  GOTCharactersWebServices(){
    BaseOptions options =BaseOptions(
      baseUrl: GOTbaseurl,
      receiveDataWhenStatusError: true,

    );
    dio=Dio(options);
  }
  Future<List<dynamic>> getAllGOTCharacters()async{
    try{
      Response response= await dio.get(allGOTcharacters);
      print(response.data.toString());
      return response.data;
    }catch(e){
      print(e.toString());
      return [];
    }
  }
}