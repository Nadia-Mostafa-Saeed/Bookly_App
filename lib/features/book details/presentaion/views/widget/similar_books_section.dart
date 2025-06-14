import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/book%20details/presentaion/views/widget/similar_books_list_view.dart';
import 'package:flutter/material.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'You can also like',
          style: Styles.textStyle16.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: 16,
        ),
        SimilarBooksListView(),
      ],
    );
  }
}
