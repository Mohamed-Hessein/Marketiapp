import 'package:app/Features/Cart/Persention/vm/cart_cubit/cart_cubit.dart';
import 'package:app/Features/Cart/Persention/vm/cart_cubit/cart_state.dart';
import 'package:app/Features/Favorite/Persention/vm/favorite_cubit/favorite_cubit.dart';
import 'package:app/Features/Favorite/Persention/vm/favorite_cubit/favorite_state.dart';
import 'package:app/core/constant/image_manager/image_manager.dart';
import 'package:app/core/services/services_locator.dart';
import 'package:app/core/theme/colors.dart';
import 'package:app/core/theme/styles.dart';
import 'package:dartz/dartz.dart' as product;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomCartButton extends StatelessWidget {
  CustomCartButton({super.key, this.id});
  final id;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<cartCubit, CartState>(
      builder: (context, state) {
        final isCart = context.watch<cartCubit>().isCart(id);
        return SizedBox(
          width: 232.w,
          height: 48.h,
          child: TextButton(
            style: TextButton.styleFrom(
              fixedSize: Size(10, 7),

              side: isCart
                  ? BorderSide(color: Constants.Textfeildborder)
                  : BorderSide(color: Constants.Textfeildborder),
            ),
            onPressed: () {
              if (isCart) {
                context.read<cartCubit>().DeleteCart(name: id);
              }
              context.read<cartCubit>().AddCart(name: id);
            },
            child: isCart
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        ImageManager.cartIconOnly,
                        width: 28.w,
                        height: 28.h,
                      ),
                      Text(
                        'Add To Cart',
                        style: AppTextSyles.textpopns14bcolor,
                      ),
                    ],
                  )
                : SvgPicture.asset(ImageManager.basketIcon),
          ),
        );
      },
    );
  }
}
