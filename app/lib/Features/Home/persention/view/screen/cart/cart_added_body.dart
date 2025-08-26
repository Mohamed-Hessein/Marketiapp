import 'package:app/Features/Home/persention/view_model/cart_cubit/cart_cubit.dart';
import 'package:app/Features/Home/persention/view_model/cart_cubit/cart_state.dart';
import 'package:app/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app/Features/Home/persention/view/widget/add_catgory_card.dart';
import 'package:app/Features/Home/persention/view/widget/custom_search_textfield.dart';
import 'package:app/core/constant/image_manager/image_manager.dart';
import 'package:app/core/theme/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartAddedBody extends StatelessWidget {
  const CartAddedBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                      Text('Phones', style: AppTextSyles.textpopns20color),
                      SizedBox(height: 4.h),
                    ],
                  ),
                ),
                SizedBox(
                  height: 812.h,
                  width: 375,
                  child: BlocConsumer<cartCubit, CartState>(
                    listener: (context, state) {
                      // TODO: implement listener
                    },
                    builder: (context, state) {
                      if (state is CArtSuecss) {
                        return ListView.builder(
                          itemCount: state.product.list.length,
                          itemBuilder: (context, index) {
                            bool isAdded = false;
                            final cart = state.product.list[index];
                            isAdded = state.product.list.any(
                              (p) => p.id == cart.id,
                            );
                            return CartAddedWidget(
                              button: SizedBox(
                                width: 200.w,
                                height: 38.h,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    fixedSize: Size(10, 7),

                                    side: BorderSide(
                                      color: Constants.Textfeildborder,
                                    ),
                                  ),
                                  onPressed: () {
                                    if (isAdded) {
                                      context.read<cartCubit>().DeleteCart(
                                        name: cart.id,
                                      );
                                    } else {
                                      context.read<cartCubit>().AddCart(
                                        name: cart.id,
                                      );
                                    }
                                  },
                                  child: isAdded
                                      ? SvgPicture.asset(
                                          ImageManager.basketIcon,
                                        )
                                      : Text(
                                          'Add',
                                          style: AppTextSyles.textpopns14bcolor,
                                        ),
                                ),
                              ),
                              iamge: cart.images[0],
                              text: cart.title,
                            );
                          },
                        );
                      } else if (state is CartLoading) {
                        return Center(child: CircularProgressIndicator());
                      } else if (state is CartError) {
                        return Text(state.message.errMessage);
                      } else {
                        return SizedBox.shrink();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
