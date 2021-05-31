class SearchResult {
  final String total;
  final List<Book> books;
  String page;

  SearchResult({
    required this.total,
    required this.books,
    this.page = ""
  });

  factory SearchResult.fromJson(Map<String, dynamic> json) {
    var list = json['books'] as List;
    print(list.runtimeType); //returns List<dynamic>
    List<Book> imagesList = list.map((i) => Book.fromJson(i)).toList();

    return SearchResult(
      total: json['total'] as String,
      page: json['page'] as String,
      books: imagesList,
    );
  }
}

class Book {
  final String title;
  final String subtitle;
  final String isbn13;
  final String price;
  final String image;
  final String url;


  Book({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.isbn13,
    required this.price,
    required this.url
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      image: json['image'] as String,
      url: json['url'] as String,
      price: json['price'] as String,
      isbn13: json['isbn13'] as String,
    );
  }
}