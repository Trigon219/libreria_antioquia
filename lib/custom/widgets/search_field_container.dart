import 'package:flutter/material.dart';
import 'package:libreria_antioquia/service/search_book_delegate.dart';

class SearchFieldContainer extends StatelessWidget {

  SearchFieldContainer();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        new Flexible(child: TextField()),
        IconButton(
            onPressed: () => showSearch(context: context, delegate: SearchBookDelegate()),
            icon: new Icon(Icons.search))
      ],
    );
  }

}