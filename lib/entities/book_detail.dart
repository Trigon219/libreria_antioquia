class BookDetail {
  final String error;
  final String title;
  final String subtitle;
  final String authors;
  final String publisher;
  final String isbn10;
  final String isbn13;
  final String pages;
  final String year;
  final String rating;
  final String desc;
  final String price;
  final String image;
  final String url;


  BookDetail({
    required this.error,
    required this.title,
    required this.url,
    required this.price,
    required this.isbn13,
    required this.isbn10,
    required this.image,
    required this.subtitle,
    required this.authors,
    required this.desc,
    required this.pages,
    required this.publisher,
    required this.rating,
    required this.year
  });


  factory BookDetail.fromJson(Map<String, dynamic> json) {
    return BookDetail(
      error: json['error'] as String,
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      image: json['image'] as String,
      url: json['url'] as String,
      price: json['price'] as String,
      isbn13: json['isbn13'] as String,
      isbn10: json['isbn10'] as String,
      authors: json['authors'] as String,
      desc: json['desc'] as String,
      pages: json['pages'] as String,
      publisher: json['publisher'] as String,
      rating: json['rating'] as String,
      year: json['year'] as String,
    );
  }
}