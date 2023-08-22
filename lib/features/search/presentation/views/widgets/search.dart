import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/data/models/book/book.model.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:bookly/features/search/data/search_books.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class Search extends SearchDelegate {
  FetchUsers _userList = FetchUsers();

  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      hintColor: Colors.white,
      appBarTheme: AppBarTheme(
        color: kPrimaryColor,
        iconTheme: theme.primaryIconTheme.copyWith(color: Colors.white),
        titleTextStyle: theme.textTheme.titleMedium,
        toolbarTextStyle: theme.textTheme.bodySmall,
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: Colors.white, // Set your desired cursor color here
      ),
      inputDecorationTheme: InputDecorationTheme(
        focusColor: Colors.white,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              color: Colors.white), // Set your desired focus color here
        ),
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {}

  @override
  Widget? buildLeading(BuildContext context) {}

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      color: kPrimaryColor,
      child: Expanded(
          child: FutureBuilder<List<BookModel>>(
              future: _userList.fetchBooks(query: query),
              builder: (context, snapshot) {
                var data = snapshot.data;
                if (!snapshot.hasData) {
                  return Center(
                    child:
                        CircularProgressIndicator(), // Show loading indicator
                  );
                }

                if (data == null || data.isEmpty) {
                  return const Center(
                    child: Text(
                      'No Books Found',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: data?.length,
                  itemBuilder: ((context, index) {
                    return Card(
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: GestureDetector(
                        onTap: () {
                          GoRouter.of(context).push(AppRouter.kBookDetailsView,
                              extra: data![index]);
                        },
                        child: ListTile(
                          leading: Image.network(
                              data![index].volumeInfo?.imageLinks?.thumbnail ??
                                  ''),
                           title: Text(
                            data?[index].volumeInfo!.title as String,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Styles.textStyle20
                                .copyWith(color: Colors.white,),
                          ),
                          subtitle: Text(
                            '${data?[index].volumeInfo!.authors}',
                            style: Styles.textStyle20
                                .copyWith(fontSize: 14, color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  }),
                );
              })),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      color: kPrimaryColor,
      child: Expanded(
          child: FutureBuilder<List<BookModel>>(
              future: _userList.fetchBooks(query: query),
              builder: (context, snapshot) {
                var data = snapshot.data;
                if (!snapshot.hasData) {
                  return Center(
                    child:
                        CircularProgressIndicator(), // Show loading indicator
                  );
                }

                if (data == null || data.isEmpty) {
                  return const Center(
                    child: Text(
                      'No Books Found',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: data?.length,
                  itemBuilder: ((context, index) {
                    return Container(
                      margin: EdgeInsets.only(left:10,right:10, top: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.black.withOpacity(0.2)
                      ),
                      
                      child: GestureDetector(
                        onTap: () {
                          GoRouter.of(context).push(AppRouter.kBookDetailsView,
                              extra: data![index]);
                        },
                        child: ListTile(
                          leading:CustomBookImage(
                            imageUrl:
                            data![index].volumeInfo?.imageLinks?.thumbnail ??
                                '',
                          ),
                          title: Text(
                            data?[index].volumeInfo!.title as String,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Styles.textStyle20
                                .copyWith(color: Colors.white,),
                          ),
                          subtitle: Text(
                            '${data?[index].volumeInfo!.authors}',
                            style: Styles.textStyle20
                                .copyWith(fontSize: 14, color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  }),
                );
              })),
    );
  }
  
}
