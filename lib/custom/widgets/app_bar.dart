import 'package:flutter/material.dart';
import 'package:libreria_antioquia/service/search_book_delegate.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final Icon iconAppBar;


  MyAppBar({
    this.title = "Librería Antiooquia",
    this.iconAppBar = const Icon(Icons.search)
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text('Librería Antioquia'),
      actions: <Widget>[IconButton(onPressed: (){
        showSearch(context: context, delegate: SearchBookDelegate());
      }, icon: Icon(Icons.search))],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

}