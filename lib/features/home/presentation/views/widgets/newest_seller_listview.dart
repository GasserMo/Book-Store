import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:bookly/features/home/presentation/manger/cubit/newest_books_cubit/newest_book_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/newest_seller_listview.item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestSellerListView extends StatelessWidget {
  const NewestSellerListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBookCubit, NewestBookState>(
      builder: (context, state) {
        if(state is NewestBookSuccess){
          return ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 10,
          itemBuilder: ((context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: NewestSellerListViewItem(
                bookModel: state.books[index],
              ),
            );
          }),
        );
        }else if(state is NewestBookFailure){
          return CustomErrorWidget(errMessage: state.errMessage);
        }else{
          return CircluarLoading();
        }
        
      },
    );
  }
}
