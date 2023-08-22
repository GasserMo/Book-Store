import 'package:bookly/features/home/data/models/book/book.model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/styles.dart';

class BookRating extends StatelessWidget {
  const BookRating({Key? key, this.mainAxisAlignment = MainAxisAlignment.start,})
      : super(key: key);
  final MainAxisAlignment mainAxisAlignment;
  
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Icon(
          FontAwesomeIcons.solidStar,
          size: 14,
          color: Color(0xffFFDD4F),
        ),
        SizedBox(
          width: 6,
        ),
        Text(
          '4.5',
          style: Styles.textStyle16,
        ),
        SizedBox(
          width: 6,
        ),
        Text('(245)', style: Styles.textStyle14)
      ],
    );
  }
}
