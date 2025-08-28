import 'package:app/Features/Favorite/Persention/View/widget/fav_icon.dart';
import 'package:app/Features/Favorite/Persention/vm/favorite_cubit/favorite_cubit.dart';
import 'package:app/Features/Home/persention/view/widget/card_widget.dart';
import 'package:app/Features/Cart/Persention/vm/cart_cubit/cart_cubit.dart';
import 'package:app/Features/Home/persention/view_model/product_state.dart';
import 'package:app/Features/Search/Persention/vm/search_cubit.dart';
import 'package:app/core/services/services_locator.dart';
import 'package:app/core/theme/colors.dart';
import 'package:app/core/widgets/custom_error_widget.dart';
import 'package:app/core/widgets/shimmer_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app/Features/Home/persention/view/widget/button_search.dart';
import 'package:app/Features/Home/persention/view/widget/custom_search_textfield.dart';
import 'package:app/core/constant/image_manager/image_manager.dart';
import 'package:app/core/theme/styles.dart';

class SearchPageBody extends StatefulWidget {
  SearchPageBody({super.key});

  @override
  State<SearchPageBody> createState() => _SearchPageBodyState();
}

class _SearchPageBodyState extends State<SearchPageBody> {
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
                      bool isFAv = false;
                      final product = state.product.list[index];
                      isFAv = state.product.list!.any(
                        (p) => p.id == product.id,
                      );
                      return cardAddProduct(
                        button: SizedBox(
                          width: 124.w,
                          height: 38.h,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              fixedSize: Size(10, 7),

                              side: BorderSide(
                                color: Constants.Textfeildborder,
                              ),
                            ),
                            onPressed: () {
                              context.read<cartCubit>().AddCart(
                                name: product.id,
                              );
                            },
                            child: Text(
                              'Add',
                              style: AppTextSyles.textpopns14bcolor,
                            ),
                          ),
                        ),
                        onTap: () {},
                        title: product.title,
                        realImage: product.images[0],
                        price: product.price,

                        image: IconButton(
                          onPressed: () {
                            setState(() {
                              isFAv = !isFAv;
                              isFAv = true;
                            });
                            if (isFAv) {
                              sl<getFavoriteCubit>().AddFAvoriete(
                                name: product.id,
                              );
                            } else {
                              sl<getFavoriteCubit>().DeleteFAvoriete(
                                name: product.id,
                              );
                            }
                          },
                          icon: isFAv
                              ? SvgPicture.asset(
                                  ImageManager.heartIcon,
                                  height: 24.h,
                                  width: 24.w,
                                )
                              : SvgPicture.asset(
                                  ImageManager.fillHeart,
                                  height: 24.h,
                                  width: 24.w,
                                ),
                        ),
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
              return SliverToBoxAdapter(
                child: CustomErrorWidget(
                  errorMessage: state.message.errMessage,
                ),
              );
            } else if (state is SaerchLoading) {
              return SliverGridShammer();
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
