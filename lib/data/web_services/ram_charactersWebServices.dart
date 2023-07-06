import 'package:dio/dio.dart';
import 'package:got/constants/constants.dart';

class RAMCharactersWebServices{
 Dio dio=Dio();
RAMCharactersWebServices(){
  BaseOptions options =BaseOptions(
    baseUrl: RAMbaseurl,
    receiveDataWhenStatusError: true,
  );
  dio=Dio(options);
}
Future<List<dynamic>> getAllRAMCharacters()async{
  try{
    Response response= await dio.get(allRAMcharacters);
    print(response.data.toString());
    return response.data["results"];
  }catch(e){
    print(e.toString());
    return [];
  }
}
}