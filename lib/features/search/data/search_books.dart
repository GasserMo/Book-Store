import 'dart:convert';

import 'package:bookly/features/home/data/models/book/book.model.dart';
import 'package:http/http.dart' as http;

class FetchUsers {
  List<BookModel> results = [];
  var data = [];
  Future<List<BookModel>> fetchBooks({required String query}) async {
    try {
      final response = await http.get(Uri.parse(
          'https://www.googleapis.com/books/v1/volumes?q=computer science'));
      if (response.statusCode == 200) {
        data = json.decode(response.body)['items'];
        results = data.map((data) => BookModel.fromJson(data)).toList();
        if (query.isNotEmpty) {
          results = results.where((element) {
            final title = element.volumeInfo!.title!.toLowerCase();
            final authors = element.volumeInfo!.authors ?? [];
            final lowercaseQuery = query.toLowerCase();
            return title.contains(lowercaseQuery) ||
                authors.any(
                    (author) => author.toLowerCase().contains(lowercaseQuery));
          }).toList();
        }
      } else {
      }
    } catch (e) {
    }
    return results;
  }

}
