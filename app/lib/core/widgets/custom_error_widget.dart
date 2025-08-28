import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, this.errorMessage});
  final errorMessage;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Center(
        child: Text(errorMessage, style: TextStyle(color: Colors.red)),
      ),
    );
  }
}
