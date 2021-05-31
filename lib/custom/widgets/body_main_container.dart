import 'package:flutter/material.dart';
import 'package:libreria_antioquia/custom/widgets/books_list_view.dart';
import 'package:libreria_antioquia/entities/search_result.dart';

class BodyMainContainer extends StatefulWidget {

  final List<Book> books;

  BodyMainContainer({
    required this.books
  });

  @override
  _BodyMainContainer createState() => _BodyMainContainer();

}

class _BodyMainContainer extends State<BodyMainContainer> {

  @override
  Widget build(BuildContext context) {
    if (widget.books.isNotEmpty) {
      return BooksListViewContainer(foundedBooks: widget.books);
    } else {
      return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/books.png"),
            fit: BoxFit.cover,
          ),
        ),
        width: 400,
        margin: EdgeInsets.all(10.0),
      );
    }
  }
}