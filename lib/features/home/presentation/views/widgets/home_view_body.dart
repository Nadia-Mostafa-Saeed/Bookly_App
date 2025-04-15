import 'package:bookly_app/core/utils/constants.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/featured_best_seller_list_view_bloc_builder.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/featured_books_list_view_bloc_builder.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: kPadding,
                child: CustomAppBar(),
              ),
              FeaturedBooksListViewBlocBuilder(),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: kPadding,
                child: Text(
                  'Best Seller',
                  style: Styles.textStyle18,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              //FeaturedBestSellerListView(),
            ],
          ),
        ),
        SliverFillRemaining(
          child: Padding(
            padding: kPadding,
            child: FeaturedBestSellerListViewBlocBuilder(),
          ),
        ),
      ],
    );
  }
}
