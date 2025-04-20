import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_action.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.book});

  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .2),
          child: CustomBookImage(
            image: book.image ?? '',
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Text(
          book.title,
          style: Styles.textStyle30.copyWith(fontWeight: FontWeight.normal),
        ),
        SizedBox(
          height: 6,
        ),
        Opacity(
          opacity: .7,
          child: Text(
            book.authorName!,
            style: Styles.textStyle18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(
          height: 18,
        ),
        BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
          rating: book.rating ?? 0,
        ),
        SizedBox(
          height: 37,
        ),
        BooksAction(),
      ],
    );
  }
}
