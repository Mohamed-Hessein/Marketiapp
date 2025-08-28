import 'package:app/Features/Home/persention/view/widget/Grid_view_product.dart';
import 'package:app/Features/Home/persention/view/widget/catogry_card.dart';
import 'package:app/Features/Home/persention/view_model/brand_cubit.dart';
import 'package:app/Features/Home/persention/view_model/product_cubit.dart';
import 'package:app/Features/Home/persention/view_model/product_state.dart';
import 'package:app/Features/product_by_brands/Persention/vm/product_by_brands_cubit.dart';
import 'package:app/core/Router/appRouter.dart';
import 'package:app/core/services/services_locator.dart';
import 'package:app/core/widgets/custom_error_widget.dart';
import 'package:app/core/widgets/shammar.dart';
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
  @override
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BrandsCubit, BrandsState>(
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
                  // productbyBrndsCubit.getBrandPRoduct(name: brands.name);
                  Navigator.pushNamed(
                    context,
                    Approuter.brandProduct,
                    arguments: brands.name,
                  );
                },
                title: "${brands.name}",
              );
            },
            scrollDir: scrollDirction,
            hieght: hieght,
            crossAxisCount: colum,
          );
        } else if (state is ProductBrandsLoading) {
          return GridViewProduct(
            itemCount: 20,
            itemBuilder: (context, index) {
              return BrandsShimmer();
            },
            scrollDir: scrollDirction,
            hieght: hieght,
            crossAxisCount: colum,
          );
        } else if (state is ProductBrandsError) {
          return CustomErrorWidget(errorMessage: state.message.errMessage);
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
