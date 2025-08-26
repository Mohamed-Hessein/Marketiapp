import 'package:app/Features/Home/persention/view/widget/add_catgory_card.dart';
import 'package:app/Features/Home/persention/view/widget/card_widget.dart';
import 'package:app/Features/Home/persention/view/widget/catogry_card.dart';
import 'package:app/Features/Home/persention/view/widget/list_view_product_card.dart';
import 'package:app/Features/Home/persention/view_model/brand_cubit.dart';
import 'package:app/Features/Home/persention/view_model/cart_cubit/cart_cubit.dart';
import 'package:app/Features/Home/persention/view_model/product_cubit.dart';
import 'package:app/Features/Home/persention/view_model/product_state.dart';
import 'package:app/core/Router/appRouter.dart';
import 'package:app/core/constant/image_manager/image_manager.dart';
import 'package:app/core/theme/colors.dart';
import 'package:app/core/theme/styles.dart';
import 'package:dartz/dartz.dart' as product;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListviewcardHomePgae extends StatelessWidget {
  const ListviewcardHomePgae({super.key});

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
              final prodcutreal = state.product.list[index];
              return cardAddProduct(
                button: SizedBox(
                  width: 124.w,
                  height: 38.h,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      fixedSize: Size(10, 7),

                      side: BorderSide(color: Constants.Textfeildborder),
                    ),
                    onPressed: () {
                      context.read<cartCubit>().AddCart(name: product.id);
                    },
                    child: Text('Add', style: AppTextSyles.textpopns14bcolor),
                  ),
                ),
                price: prodcutreal.price,
                title: prodcutreal.title,
                realImage: prodcutreal.images[0],
                image: ImageManager.heartIcon,
                onTap: () {
                  Navigator.pushNamed(context, Approuter.bestForYou);
                },
              );
            },
            length: state.product.list.length,
            heigth: 215.h,
          );
        } else if (state is ProductLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is ProductError) {
          return Text(state.message.errMessage);
        } else {
          return SizedBox();
        }
      },
    );
  }
}

class ListviewcardBrands extends StatelessWidget {
  const ListviewcardBrands({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BrandsCubit, BrandsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is ProductBrandsSuecss) {
          return ListViewProduct(
            itemBuilder: (context, index) {
              final prodcutreal1 = state.product[index];
              CatgoryWidget(
                onTap: () {},
                colum: Column(
                  children: [
                    Text('${prodcutreal1.emoji}'),
                    SizedBox(height: 12),
                    Text("${prodcutreal1.name}"),
                  ],
                ),
              );
            },
            heigth: 215.h,
          );
        } else if (state is ProductBrandsLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is ProductBrandsError) {
          return Text(state.message.errMessage);
        } else {
          return SizedBox();
        }
      },
    );
  }
}
