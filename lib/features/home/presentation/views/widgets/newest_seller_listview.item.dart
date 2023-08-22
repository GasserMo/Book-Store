import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/features/home/data/models/book/book.model.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/styles.dart';

class NewestSellerListViewItem extends StatelessWidget {
  const NewestSellerListViewItem({Key? key, required this.bookModel}) : super(key: key);
final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsView,
        extra: bookModel);
      },
      child: SizedBox(
        height: 125,
        child: Row(children: [
          CustomBookImage(imageUrl: bookModel.volumeInfo?.imageLinks?.thumbnail?? ''),
          const SizedBox(
            width: 30,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Text(bookModel.volumeInfo!.title!,maxLines: 2,
                      overflow: TextOverflow.ellipsis, style: Styles.textStyle20),
                ),
               const SizedBox(
                  height: 3,
                ),
                Text(bookModel.volumeInfo!.authors![0],
                    overflow: TextOverflow.clip, style: Styles.textStyle14),
               const SizedBox(
                  height: 3,
                ),
                Row(
                  children: [
                    Text('19.99',
                        overflow: TextOverflow.clip,
                        style: Styles.textStyle18
                            .copyWith(fontWeight: FontWeight.bold)),
                    const Spacer(),
                   const BookRating(),
                  ],
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
