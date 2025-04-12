import 'package:bookly_app/features/home/domain/entitites/book_entity.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_list_view_item.dart';
import 'package:flutter/material.dart';

class FeaturedBestSellerListView extends StatelessWidget {
  const FeaturedBestSellerListView({
    super.key,
    required this.books,
  });

  final List<BookEntity> books;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: BookListViewItem(
            book: books[index],
          ),
        );
      },
    );
  }
}
