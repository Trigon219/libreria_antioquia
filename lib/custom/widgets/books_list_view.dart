import 'package:flutter/material.dart';
import 'package:libreria_antioquia/custom/widgets/book_detail_view.dart';
import 'package:libreria_antioquia/entities/search_result.dart';
import 'package:libreria_antioquia/service/search_book_delegate.dart';

class BooksListViewContainer extends StatefulWidget {

  List<Book> foundedBooks;

  BooksListViewContainer({
    required this.foundedBooks
  });

  @override
  _BooksListViewContainerState createState() => _BooksListViewContainerState();

}

class _BooksListViewContainerState extends State<BooksListViewContainer> {

  ListView foundedBooksList = new ListView();

  @override
  Widget build(BuildContext context) {
    if (widget.foundedBooks.isNotEmpty) {
      setState(() {
        foundedBooksList = ListView.builder(
          itemCount: widget.foundedBooks.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              child: ListTile(
                  leading: Icon(Icons.book),
                  title: Text(widget.foundedBooks[index].title)
              ),
              onTap: () => {
                callGetBookDetailService(widget.foundedBooks[index]),
              }
            );
          },
        );
      });
      return foundedBooksList;
    } else {
      return Row(
        children: [
          new Flexible(child: TextField()),
          IconButton(onPressed: () => print("Hola mundo"), icon: new Icon(Icons.search))
        ],
      );
    }
  }



  void callGetBookDetailService(Book book) {
    SearchBookDelegate getBookDetailService = new SearchBookDelegate();
    getBookDetailService.GetBookDetail(book).then((value)  =>
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BookDetailView(bookDetail: value)),
        )
    );
  }
}