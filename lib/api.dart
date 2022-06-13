import 'dart:convert';
import 'package:flutter/foundation.dart';

import 'model.dart';
import 'package:http/http.dart' as http;

SearchResponse parsePhotos(String responseBody) {
  final parsed = jsonDecode(responseBody);
  return SearchResponse.fromJson(parsed);
}

Future<SearchResponse> fetchPhotos(http.Client client, String searchText, { int page = 0 }) async {
  int limit = 10;
  int offset = page * limit;
  final response = await client.get(Uri.parse('https://api.giphy.com/v1/gifs/search?type=gifs&limit=$limit&offset=$offset&api_key=3rgXBKNKDmcA5Ykg9i&q=$searchText'));
  return compute(parsePhotos, response.body);
}
Future<SearchResponse> fetchTrending(http.Client client, { int page = 0 }) async {
  int limit = 10;
  int offset = page * limit;
  final response = await client.get(Uri.parse('https://api.giphy.com/v1/gifs/trending?type=gifs&limit=$limit&offset=$offset&api_key=3rgXBKNKDmcA5Ykg9i'));
  return compute(parsePhotos, response.body);
}