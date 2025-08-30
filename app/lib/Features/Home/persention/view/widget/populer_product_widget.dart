import 'package:app/Features/Home/persention/view/widget/card_widget.dart';
import 'package:app/Features/Home/persention/view/widget/list_view_product_card.dart';
import 'package:app/Features/details/Persention/vm/details_cubit.dart';
import 'package:app/Features/Home/persention/view_model/product_cubit.dart';
import 'package:app/Features/Home/persention/view_model/product_state.dart';
import 'package:app/core/Router/appRouter.dart';
import 'package:app/core/widgets/custom_error_widget.dart';
import 'package:app/core/widgets/shammar.dart';
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
                rating: products.rating,
                onTap: () {},
              );
            },
            length: state.product.list.length,
            heigth: 160.h,
          );
        } else if (state is ProductLoading) {
          return ListViewProduct(
            itemBuilder: (context, index) {
              return ShimmerCardProduct();
            },
            length: 10,
            heigth: 160.h,
          );
        } else if (state is ProductError) {
          return CustomErrorWidget(errorMessage: state.message.errMessage);
        } else {
          return SizedBox();
        }
        ;
      },
    );
  }
}
