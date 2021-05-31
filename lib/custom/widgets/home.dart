import 'package:flutter/material.dart';

import 'app_bar.dart';
import 'body_main_container.dart';
import 'book_detail_view.dart';

class Home extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Center(
        child: Container(
            decoration: BoxDecoration(color: Colors.blueGrey),
            alignment: Alignment.topCenter,
            child: BodyMainContainer(books: [])
        ),
      ),
    );
  }

}