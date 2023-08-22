import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:flutter/material.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text('You may also like',
              style: Styles.textStyle18.copyWith(fontWeight: FontWeight.bold)),
        ),
        SizedBox(
          height: 10,
        ),
        SimilarListView(),
      ],
    );
  }
}
