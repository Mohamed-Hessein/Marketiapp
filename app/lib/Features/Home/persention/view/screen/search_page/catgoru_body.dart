import 'package:app/Features/Home/persention/view/widget/card_widget.dart';
import 'package:app/Features/Home/persention/view_model/product_state.dart';
import 'package:app/Features/Home/persention/view_model/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app/Features/Home/persention/view/widget/button_search.dart';
import 'package:app/Features/Home/persention/view/widget/custom_search_textfield.dart';
import 'package:app/core/constant/image_manager/image_manager.dart';
import 'package:app/core/theme/styles.dart';

class CatgoruBody extends StatelessWidget {
  CatgoruBody({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      scrollDirection: Axis.vertical,
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              CustomSearchTextfield(
                onSubmitted: (value) {
                  context.read<SearchCubit>().Search();
                },
                controler: context.read<SearchCubit>().controller,
                assetImagesuf: ImageManager.filterIcon,
                assetImage: ImageManager.serachIcon,
                hintText: 'What are you looking for ?',
                wigeth: 35.w,
                height: 35.h,
              ),
              SizedBox(height: 15.h),
              RowSearch(text: 'Popular Search', image: ImageManager.arrowDown),
            ],
          ),
        ),

        BlocConsumer<SearchCubit, SearchState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state is SaerchSuecss) {
              return NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification scrollInfo) {
                  if (scrollInfo.metrics.pixels ==
                      scrollInfo.metrics.maxScrollExtent) {
                    context.read<SearchCubit>().Search(isLoadMOre: true);
                  }
                  return true;
                },
                child: SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    childCount: state.product.list.length,
                    (context, index) {
                      final product = state.product.list[index];
                      return cardAddProduct(
                        onTap: () {},
                        title: product.title,
                        realImage: product.images[0],
                        price: product.price,
                        image: ImageManager.heartIcon,
                      );
                    },
                  ),

                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,

                    crossAxisSpacing: 5,
                    mainAxisSpacing: 10,
                    mainAxisExtent: 250.h,
                  ),
                ),
              );
            } else if (state is SaerchError) {
              return SliverToBoxAdapter(child: Text(state.message.errMessage));
            } else if (state is SaerchLoading) {
              return SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator()),
              );
            } else {
              return SliverToBoxAdapter(child: SizedBox.shrink());
            }
          },
        ),
      ],
    );
  }
}

class RowSearch extends StatelessWidget {
  const RowSearch({super.key, this.text, this.image});
  final text;
  final image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('$text', style: AppTextSyles.textpopns16color),
          SvgPicture.asset(image),
        ],
      ),
    );
  }
}
