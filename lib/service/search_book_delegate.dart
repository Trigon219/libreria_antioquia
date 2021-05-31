import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:libreria_antioquia/custom/widgets/body_main_container.dart';
import 'package:libreria_antioquia/entities/book_detail.dart';
import 'package:libreria_antioquia/entities/search_result.dart';

class SearchBookDelegate extends SearchDelegate<String> {
  List<String> recentsearches = [];
  List<Book> booksList = [];


  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(
        onPressed: (){
          query = "";
        },
        icon: Icon(Icons.clear))];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: (){
          close(context, "");
        },
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        )
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isNotEmpty) {
      addSearchToCache(query);
    }

    return FutureBuilder(
      future: loadSearchResult(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return BodyMainContainer(books: booksList);
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }


  @override
  Widget buildSuggestions(BuildContext context) {
    getRecentSearchesFromCache();
    final suggestionsList = query.isEmpty ? recentsearches:recentsearches.where((element) => element.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
              onTap: () {
                query = suggestionsList[index];
                showResults(context);
              },
              leading: Icon(Icons.book),
              title: RichText(
                text: TextSpan(
                  text: suggestionsList[index].substring(0, query.length),
                  style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold
                  ),
                  children: [
                    TextSpan(
                      text: suggestionsList[index].substring(query.length),
                      style: TextStyle(color: Colors.grey),
                    )
                  ]
                )
              ),
      ),
      itemCount: suggestionsList.length,
    );
  }

  void addSearchToCache(String query) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    recentsearches = prefs.getStringList('recentSearches') ?? [];
    if (!recentsearches.contains(query)) {
      if (recentsearches.length >= 5) {
          recentsearches.removeLast();
          recentsearches.insert(0, query);
      } else {
        recentsearches.insert(0, query);
      }
    }
    await prefs.setStringList('recentSearches', recentsearches);
  }

  void getRecentSearchesFromCache() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    recentsearches = prefs.getStringList('recentSearches') ?? [];
  }


  Future loadSearchResult() async {
    if (query.isNotEmpty) {
      String jsonString = await callServiceGetBooks();
      final jsonResponse = json.decode(jsonString);
      SearchResult result = new SearchResult.fromJson(jsonResponse);
      booksList.clear();
      booksList.addAll(result.books);
    }
  }

  Future<String> callServiceGetBooks() async {
    final url = "https://api.itbook.store/1.0/search/" + query;
    final response = await http.get(Uri.parse(url));
    return response.body;
  }

  Future<BookDetail> GetBookDetail(Book book) async {
    String jsonString = await callServiceGetBookDetail(book);
    final jsonResponse = json.decode(jsonString);
    return new BookDetail.fromJson(jsonResponse);
  }

  Future<String> callServiceGetBookDetail(Book book) async {
    final url = "https://api.itbook.store/1.0/books/" + book.isbn13;
    final response = await http.get(Uri.parse(url));
    return response.body;
  }
}