import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/data/models/book/book.model.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly/features/home/presentation/views/widgets/books_action.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({Key? key, required this.book}) : super(key: key);
final BookModel book;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .2),
          child: CustomBookImage(imageUrl:book.volumeInfo!.imageLinks?.thumbnail??'' ),
        ),
        SizedBox(
          height: 15,
        ),
        Text(book.volumeInfo!.title!,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          
            textAlign: TextAlign.center,
            style: Styles.textStyle30.copyWith(fontWeight: FontWeight.bold)),
        SizedBox(
          height: 3,
        ),
        Opacity(
          opacity: 0.7,
          child: Text(book.volumeInfo!.authors![0],
              overflow: TextOverflow.clip,
              style: Styles.textStyle18.copyWith(fontStyle: FontStyle.italic)),
        ),
        SizedBox(
          height: 18,
        ),
        BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        SizedBox(
          height: 20,
        ),
        BooksAction(
          bookModel: book,
        ),
      ],
    );
  }
}
