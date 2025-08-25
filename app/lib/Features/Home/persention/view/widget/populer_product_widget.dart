import 'package:app/Features/Home/persention/view/widget/card_widget.dart';
import 'package:app/Features/Home/persention/view/widget/list_view_product_card.dart';
import 'package:app/Features/Home/persention/view_model/details_cubit.dart';
import 'package:app/Features/Home/persention/view_model/product_cubit.dart';
import 'package:app/Features/Home/persention/view_model/product_state.dart';
import 'package:app/core/Router/appRouter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopulerProductWidget extends StatelessWidget {
  const PopulerProductWidget({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is ProductSuecss) {
          return ListViewProduct(
            itemBuilder: (context, index) {
              final products = state.product.list[index];
              return cardProduct(
                price: products.price,
                title: products.title,
                realImage: products.images[0],
                onTap: () {
                  Navigator.pushNamed(context, Approuter.details);
                },
              );
            },
            length: state.product.list.length,
            heigth: 160.h,
          );
        } else if (state is ProductLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is ProductError) {
          return Text(state.message.errMessage);
        } else {
          return SizedBox();
        }
        ;
      },
    );
  }
}
