import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:app/Features/Auth/Persention/ViewModel/sign_up_cubit.dart';
import 'package:app/Features/Auth/Persention/ViewModel/sign_up_state.dart';
import 'package:app/Features/Auth/Persention/view/widgets/boxgetcode.dart';

import 'package:app/Features/OnBording/Persention/view/widgets/custtomButtonNext.dart';
import 'package:app/core/Router/appRouter.dart';

import 'package:app/core/constant/image_manager/image_manager.dart';
import 'package:app/core/constant/textconst.dart';
import 'package:app/core/theme/styles.dart';

class Entercodebyemailbody extends StatelessWidget {
  const Entercodebyemailbody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Signupcubit, Signupstate>(
      listener: (context, state) {
        if (state is AcvtiveResetCodeLSecuess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('suecess')));
          Navigator.pushNamed(context, Approuter.changePass);
        } else if (state is AcvtiveResetCodeError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.ERRmessage)));
        }
        // TODO: implement listener
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 44),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SvgPicture.asset(
                  ImageManager.vrificationCodeWithEmail,
                  height: 256.h,
                  width: 344.3.w,
                ),
                SizedBox(height: 22.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    textAlign: TextAlign.center,
                    Textconst.getCodeE,
                    style: AppTextSyles.textpopns16color,
                  ),
                ),
                SizedBox(height: 22.h),

                SizedBox(height: 22.h),
                Pincodefeilds(
                  controller: context.read<Signupcubit>().feildsCOdeController,
                ),
                SizedBox(height: 22.h),
                state is AcvtiveResetCodeLoading
                    ? CircularProgressIndicator()
                    : Custtombuttonnext(
                        onTap: () {
                          final cubit = context.read<Signupcubit>();
                          final email = cubit.user;
                          cubit.activeCode(email1: email);
                        },
                        text: 'Verify Code',
                      ),
                SizedBox(height: 22.h),
                Text('00:46', style: AppTextSyles.textpopns16Sreachcolor),
                SizedBox(height: 22.h),
                Text('Resend Code', style: AppTextSyles.textpopns16Sreachcolor),
              ],
            ),
          ),
        );
      },
    );
  }
}
