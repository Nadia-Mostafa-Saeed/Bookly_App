import 'package:bookly_app/features/home/presentation/views/widgets/custom_app_bar_book_details.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          CustomAppBarBookDetails(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * .17),
            child: CustomBookImage(),
          ),
        ],
      ),
    );
  }
}
