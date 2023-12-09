import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:moviles/models/popular_model.dart';

class PopularApi {

  Uri link = Uri.parse('https://api.themoviedb.org/3/movie/popular?api_key=&language=es-MX&page=1');  

  Future<List<PopularModel>?> getAllPopular() async {
    var res = await http.get(link);
    if( res.statusCode == 200 ){
      var jsonResult = jsonDecode(res.body)['results'] as List;
      return jsonResult.map((popular) => PopularModel.fromMap(popular)).toList();
    }else{
      return null;
    }
  }


}