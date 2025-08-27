import 'package:app/Features/Home/persention/view/widget/Grid_view_product.dart';
import 'package:app/Features/Home/persention/view/widget/catogry_card.dart';
import 'package:app/Features/Home/persention/view_model/catgroy_product_cubit.dart';
import 'package:app/Features/Home/persention/view_model/product_cubit.dart';
import 'package:app/Features/Home/persention/view_model/product_state.dart';
import 'package:app/core/Router/appRouter.dart';
import 'package:app/core/constant/image_manager/image_manager.dart';
import 'package:app/core/services/services_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GridCtagoryWidget extends StatelessWidget {
  GridCtagoryWidget({super.key, this.scrollDI, this.height});
  final height;
  final scrollDI;
  final catgorproudctubit = sl<CatgroyProductCubit>();
  final catgrroyCubit = sl<catgoryCubit>();
  @override
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<catgoryCubit, CatgoryState>(
      bloc: catgrroyCubit..getProductCatgoru(),
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is ProductCatgroySuecss) {
          return GridViewProduct(
            itemBuilder: (context, index) {
              final catgroy = state.product[index];
              final image = catgroy.image;
              return CatgoryWidget(
                colum: Image.network(image!),
                onTap: () {
                  //   catgorproudctubit.getCatgroyPRoduct(name: catgroy.name);
                  Navigator.pushNamed(
                    context,
                    Approuter.catgroyProduct,
                    arguments: catgroy.name,
                  );
                },
              );
            },
            hieght: height,
            scrollDir: scrollDI,
            itemCount: state.product.length,
            crossAxisCount: 2,
          );
        } else if (state is ProductCatgroyLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is ProductCatgroyError) {
          return Text(state.message);
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
