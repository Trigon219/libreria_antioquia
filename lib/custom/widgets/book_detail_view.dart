import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:libreria_antioquia/custom/widgets/book_image.dart';
import 'package:libreria_antioquia/entities/book_detail.dart';

import 'app_bar.dart';

class BookDetailView extends StatelessWidget {

  final BookDetail bookDetail;

  BookDetailView({
    required this.bookDetail,
  });


  @override
  Widget build(BuildContext context) {
    final element = Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/books.png"),
          fit: BoxFit.cover,
        ),
      ),
      width: 400,
      margin: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BookImage(path: bookDetail.image, height: 250, width: 250),
          Container(
              margin: EdgeInsets.only(bottom: 10.0),
              child: Column(
                children: [
                  Text("Title",
                      style: TextStyle(
                          color: Colors.green, fontWeight: FontWeight.bold, fontSize: 18
                      )
                  ),
                  Text(bookDetail.title,
                      style: TextStyle(
                          color: Colors.white,
                      )
                  )
                ],
              )
          ),
          Container(
              margin: EdgeInsets.only(bottom: 10.0),
              child: Column(
                children: [
                  Text("Subtitle",
                      style: TextStyle(
                          color: Colors.green, fontWeight: FontWeight.bold, fontSize: 18
                      )
                  ),
                  Text(bookDetail.subtitle,
                      style: TextStyle(
                        color: Colors.white,
                      )
                  )
                ],
              )
          ),
          Container(
              margin:EdgeInsets.only(bottom: 10.0),
              child: Column(
                children: [
                  Text("Authors",
                      style: TextStyle(
                          color: Colors.green, fontWeight: FontWeight.bold, fontSize: 18
                      )
                  ),
                  Text(bookDetail.authors,
                      style: TextStyle(
                        color: Colors.white,
                      )
                  )
                ],
              )
          ),
          Container(
              margin: EdgeInsets.only(bottom: 10.0),
              child: Column(
                children: [
                  Text("Pages",
                      style: TextStyle(
                          color: Colors.green, fontWeight: FontWeight.bold, fontSize: 18
                      )
                  ),
                  Text(bookDetail.pages,
                      style: TextStyle(
                        color: Colors.white,
                      )
                  )
                ],
              )
          ),
          Container(
              margin: EdgeInsets.only(bottom: 10.0),
              child: Column(
                children: [
                  Text("Year",
                      style: TextStyle(
                          color: Colors.green, fontWeight: FontWeight.bold, fontSize: 18
                      )
                  ),
                  Text(bookDetail.year,
                      style: TextStyle(
                        color: Colors.white,
                      )
                  )
                ],
              )
          ),
          Container(
              margin: EdgeInsets.only(bottom: 10.0),
              child: Column(
                children: [
                  Text("Description",
                      style: TextStyle(
                          color: Colors.green, fontWeight: FontWeight.bold, fontSize: 18
                      )
                  ),
                  Text(bookDetail.desc,
                      style: TextStyle(
                        color: Colors.white,
                      )
                  )
                ],
              )
          ),
          Container(
              margin: EdgeInsets.only(bottom: 10.0),
              child: Column(
                children: [
                  Text("Price",
                      style: TextStyle(
                          color: Colors.green, fontWeight: FontWeight.bold, fontSize: 18
                      )
                  ),
                  Text(bookDetail.price,
                      style: TextStyle(
                        color: Colors.white,
                      )
                  )
                ],
              )
          )
        ],
      ),
    );

    return Scaffold(
      appBar: MyAppBar(),
      body: Center(
        child: Container(
            decoration: BoxDecoration(color: Colors.blueGrey),
            alignment: Alignment.topCenter,
            child: element
        ),
      ),
    );
  }


}