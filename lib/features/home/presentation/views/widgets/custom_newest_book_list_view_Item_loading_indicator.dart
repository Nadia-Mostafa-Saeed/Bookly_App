import 'package:bookly_app/core/widgets/custom_fading_widget.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_newest_item_loading_indicator.dart';
import 'package:flutter/material.dart';

class CustomNewestBookListViewItemLoadingIndicator extends StatelessWidget {
  const CustomNewestBookListViewItemLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: CustomNewestItemLoadingIndicator(),
    ));
  }
}
