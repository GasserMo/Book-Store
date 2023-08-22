import 'package:bookly/core/utils/functions/launch_url.dart';
import 'package:bookly/features/home/data/models/book/book.model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/widgets/custom_button.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({Key? key, required this.bookModel}) : super(key: key);
final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
                onPressed: (){},
                title: '${bookModel.saleInfo!.saleability}',
                textColor: Colors.black,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15)),
                backgroundColor: Colors.white),
          ),
          Expanded(
            child: CustomButton(
              onPressed: ()async{
                launchCustomUrl(context, bookModel.volumeInfo!.previewLink!);
              },
                title: 'Free Preview',
                textColor: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
                backgroundColor: Color(0xffEF8262)),
          ),
        ],
      ),
    );
  }
}
