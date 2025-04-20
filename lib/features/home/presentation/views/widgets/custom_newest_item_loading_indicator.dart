import 'package:flutter/material.dart';

class CustomNewestItemLoadingIndicator extends StatelessWidget {
  const CustomNewestItemLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 2.5 / 4,
            child: Container(
              color: Colors.grey[50],
            ),
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 16,
                  width: 150,
                  color: Colors.grey[50],
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  height: 16,
                  width: 150,
                  color: Colors.grey[50],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
