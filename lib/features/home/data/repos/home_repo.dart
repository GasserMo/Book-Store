import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/features/home/data/models/book/book.model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo{
  Future<Either<Failure, List<BookModel>>>fetchNewestSellerBooks();
  Future<Either<Failure, List<BookModel>>>fetchFeaturedBooks();
    Future<Either<Failure, List<BookModel>>>fetchSimilarBooks(
      {
        required String category
      }
    );

}