import 'package:app/Features/Cart/Persention/vm/cart_cubit/cart_cubit.dart';
import 'package:app/Features/Cart/Persention/vm/cart_cubit/cart_state.dart';
import 'package:app/Features/Cart/Persention/widgets/custom_text_button.dart';
import 'package:app/core/extention/theme_extn.dart';
import 'package:app/core/theme/colors.dart';
import 'package:app/core/widgets/cart_shimmer.dart';
import 'package:app/core/widgets/custom_error_widget.dart';
import 'package:dartz/dartz.dart' as product;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app/Features/Home/persention/view/widget/card_cart.dart';
import 'package:app/Features/Home/persention/view/widget/custom_search_textfield.dart';
import 'package:app/core/constant/image_manager/image_manager.dart';
import 'package:app/core/theme/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartPageBody extends StatelessWidget {
  const CartPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await context.read<cartCubit>().getCart();
      },
      child: Padding(
        padding: EdgeInsets.only(top: 14.h),
        child: CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  CustomSearchTextfield(
                    assetImagesuf: ImageManager.filterIcon,
                    assetImage: ImageManager.serachIcon,
                    hintText: 'What are you looking for ?',
                    wigeth: 35.w,
                    height: 35.h,
                  ),
                  SizedBox(height: 16.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Text(
                          'Cart',
                          style: context.theme.textTheme.titleMedium,
                        ),
                        SizedBox(height: 4.h),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            BlocConsumer<cartCubit, CartState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                if (state is CArtSuecss) {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: state.product.list.length,
                      (context, index) {
                        bool isAdded = false;
                        final cart = state.product.list[index];
                        isAdded = state.product.list.any(
                          (p) => p.id == cart.id,
                        );
                        return CartAddedWidget(
                          button: BlocBuilder<cartCubit, CartState>(
                            builder: (context, state) {
                              final isCart = context.watch<cartCubit>().isCart(
                                cart.id,
                              );
                              return SizedBox(
                                width: 124.w,
                                height: 38.h,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    fixedSize: Size(10, 7),

                                    side: isCart
                                        ? BorderSide(
                                            color: Constants.Textfeildborder,
                                          )
                                        : BorderSide(
                                            color: Constants.Textfeildborder,
                                          ),
                                  ),
                                  onPressed: () {
                                    if (isCart) {
                                      context.read<cartCubit>().DeleteCart(
                                        name: cart.id,
                                      );
                                    }
                                    context.read<cartCubit>().AddCart(
                                      name: cart.id,
                                    );
                                  },
                                  child: isCart
                                      ? SvgPicture.asset(
                                          ImageManager.basketIcon,
                                        )
                                      : Text(
                                          'Add',
                                          style: AppTextSyles.textpopns14bcolor,
                                        ),
                                ),
                              );
                            },
                          ),
                          iamge: cart.images[0],
                          text: cart.title,
                          rating: cart.rating,
                          timeOut: cart.discountPercentage,
                          price: cart.price,
                        );
                      },
                    ),
                  );
                } else if (state is CartLoading) {
                  return SliverToBoxAdapter(child: ListCartShimmer());
                } else if (state is CartError) {
                  return SliverToBoxAdapter(
                    child: CustomErrorWidget(
                      errorMessage: state.message.errMessage,
                    ),
                  );
                } else {
                  return SliverToBoxAdapter(child: SizedBox.shrink());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ListCartShimmer extends StatelessWidget {
  const ListCartShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return CartAddedShimmer();
      },
      itemCount: 10,
    );
  }
}
