import 'package:bookly_app/features/home/presentation/views/widgets/custom_newest_book_list_view_Item_loading_indicator.dart';
import 'package:flutter/material.dart';

class NewestBooksListViewLoadingIndicator extends StatelessWidget {
  const NewestBooksListViewLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        itemCount: 15,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: CustomNewestBookListViewItemLoadingIndicator(),
          );
        },
      ),
    );
  }
}
