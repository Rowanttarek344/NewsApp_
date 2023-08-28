import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/NewsResponse.dart';
import 'package:news_app/models/category.dart';

import 'models/SourcesResponse.dart';

// https://newsapi.org/v2/top-headlines/sources?apiKey=d7256ea14bb64de596b18f0bd3ddc38e
// https://newsapi.org/v2/everything?sources=abc-news&apiKey=d7256ea14bb64de596b18f0bd3ddc38e
class ApiManager {
  static const String base_url = "newsapi.org";

  static Future<SourcesResponse> getSources(String category) async {
    var url = Uri.https(base_url, '/v2/top-headlines/sources', {
      'category':category,
      'apiKey': 'd7256ea14bb64de596b18f0bd3ddc38e',
    });
    try {
      var response = await http.get(url);
      var stringbody = response.body;
      var json = jsonDecode(stringbody);
      var obj = SourcesResponse.fromJson(json);
      return obj;
    } catch (e) {
      throw e;
    }
  }

   static Future<NewsResponse>getNews(String source) async{
    var url=Uri.https(base_url,"/v2/everything",{
      'sources':source,
      'apiKey':'d7256ea14bb64de596b18f0bd3ddc38e',
    });
    try{
      var response= await http.get(url);
      var bodystring=response.body;
      var json=jsonDecode(bodystring);
      var res= NewsResponse.fromJson(json);
      return res;
    }
    catch(e){
      throw e;
    }
  }
}
