import 'package:bookly/features/home/data/models/book/book.model.dart';
import 'package:bookly/features/home/presentation/manger/cubit/similar_book_cubit/cubit/similar_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({Key? key, required this.bookModel}) : super(key: key);
  final BookModel bookModel;
  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
void initState() {
  BlocProvider.of<SimilarBooksCubit>(context).fetchSimilarBookss(
    category: widget.bookModel.volumeInfo!.categories![0]
  );
  super.initState();
}
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BookDetailsViewBody(
          bookModel: widget.bookModel,
        ),
      ),
    );
  }
}
