import 'package:app/Features/Home/persention/view/widget/Grid_view_product.dart';
import 'package:app/Features/Home/persention/view/widget/catogry_card.dart';
import 'package:app/Features/Home/persention/view_model/brand_cubit.dart';
import 'package:app/Features/Home/persention/view_model/product_cubit.dart';
import 'package:app/Features/Home/persention/view_model/product_state.dart';
import 'package:app/core/Router/appRouter.dart';
import 'package:app/core/services/services_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardOfBrandsHomeview extends StatelessWidget {
  CardOfBrandsHomeview({
    super.key,
    this.scrollDirction,
    this.hieght,
    this.colum,
  });
  final scrollDirction;
  final hieght;
  final colum;
  final productbyBrndsCubit = sl<BrandProdctCubit>();
  final brandsCubit = sl<BrandsCubit>();
  @override
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BrandsCubit, BrandsState>(
      bloc: brandsCubit..getProductBrands(),
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is ProductBrandsSuecss) {
          return GridViewProduct(
            itemCount: state.product.length,
            itemBuilder: (context, index) {
              final brands = state.product[index];

              return CatgoryBrandsWidget(
                colum: brands.emoji,
                onTap: () {
                  productbyBrndsCubit.getBrandPRoduct(name: brands.name);
                  Navigator.pushNamed(context, Approuter.brandProduct);
                },
                title: "${brands.name}",
              );
            },
            scrollDir: scrollDirction,
            hieght: hieght,
            crossAxisCount: colum,
          );
        } else if (state is ProductBrandsLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is ProductBrandsError) {
          return Text(state.message.errMessage);
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
