import 'package:app/Features/Home/persention/view/widget/Grid_view_product.dart';
import 'package:app/Features/Home/persention/view/widget/catogry_card.dart';
import 'package:app/Features/Home/persention/view_model/product_cubit.dart';
import 'package:app/Features/Home/persention/view_model/product_state.dart';
import 'package:app/core/constant/image_manager/image_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GridCtagoryWidget extends StatefulWidget {
  const GridCtagoryWidget({super.key, this.scrollDI, this.height});
  final height;
  final scrollDI;
  @override
  State<GridCtagoryWidget> createState() => _GridCtagoryWidgetState();
}

class _GridCtagoryWidgetState extends State<GridCtagoryWidget> {
  @override
  void initState() {
    context.read<catgoryCubit>().getProductCatgoru();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<catgoryCubit, CatgoryState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is ProductCatgroySuecss) {
          return GridViewProduct(
            itemBuilder: (context, index) {
              final catgroy = state.product[index];
              final image = catgroy.image;
              return CatgoryWidget(colum: Image.network(image!), onTap: () {});
            },
            hieght: widget.height,
            scrollDir: widget.scrollDI,
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
