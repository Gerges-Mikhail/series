import 'package:dio/dio.dart';
import 'package:got/constants/constants.dart';

class BBWebServices {
  Dio dio = Dio();
  BBWebServices() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: BBbaseurl,
      receiveDataWhenStatusError: true,
    );
    dio = Dio(baseOptions);
  }
  // get method to get all characters of breaking bad
  Future<List<dynamic>> getAllCharacter() async {
    try {
      Response response = await dio.get(allBBcharacters);
      print(response.data.toString());
      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
