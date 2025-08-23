import 'package:app/Features/Home/persention/view/widget/Grid_view_product.dart';
import 'package:app/Features/Home/persention/view/widget/catogry_card.dart';
import 'package:app/Features/Home/persention/view_model/brand_cubit.dart';
import 'package:app/Features/Home/persention/view_model/product_cubit.dart';
import 'package:app/Features/Home/persention/view_model/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardOfBrandsHomeview extends StatefulWidget {
  const CardOfBrandsHomeview({
    super.key,
    this.scrollDirction,
    this.hieght,
    this.colum,
  });
  final scrollDirction;
  final hieght;
  final colum;
  @override
  State<CardOfBrandsHomeview> createState() => _CardOfBrandsHomeviewState();
}

class _CardOfBrandsHomeviewState extends State<CardOfBrandsHomeview> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<BrandsCubit>().getProductBrands();
    super.initState();
  }

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

              return CatgoryWidget(
                colum: Column(
                  children: [
                    Text('${brands.emoji}'),
                    SizedBox(height: 12),
                    Text("${brands.name}"),
                  ],
                ),
                onTap: () {},
              );
            },
            scrollDir: widget.scrollDirction,
            hieght: widget.hieght,
            crossAxisCount: widget.colum,
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
