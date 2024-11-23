import 'package:chat_app/src/core/utils/app_colors.dart';
import 'package:chat_app/src/core/utils/app_theme.dart';
import 'package:chat_app/src/core/utils/assets/assets.gen.dart';
import 'package:chat_app/src/core/utils/assets/translations/keys.dart';
import 'package:chat_app/src/core/utils/constants.dart';
import 'package:chat_app/src/modules/chat_screen/presentation/controller/cubit/chat_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputTextField extends StatelessWidget {
  const InputTextField({
    super.key,
    required this.cubit,
  });

  final ChatCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0.h,
      color: AppColors.textIputBackGroud,
      padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 8.0.h),
      margin: EdgeInsetsDirectional.only(start: 16.0.w),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 40.0.h,
              child: TextFormField(
                controller: cubit.messageController,
                scrollPadding: EdgeInsets.zero,
                cursorColor: AppColors.white,
                decoration: InputDecoration(
                  hintText: chat_screen.type_a_message.tr(),
                  helperStyle: AppTheme.textTheme.displaySmall?.copyWith(
                    color: AppColors.hintColor,
                    fontWeight: FontWeight.w400,
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.0.w),
                  filled: true,
                  fillColor: AppColors.appBlack,
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 0,
                      color: AppColors.appBlack,
                    ),
                    borderRadius: BorderRadius.circular(12.0.r),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 0,
                      color: AppColors.appBlack,
                    ),
                    borderRadius: BorderRadius.circular(12.0.r),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 0,
                      color: AppColors.appBlack,
                    ),
                    borderRadius: BorderRadius.circular(12.0.r),
                  ),
                ),
              ),
            ),
          ),
          Constatnts.width12,
          cubit.isSendLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.white,
                    strokeWidth: 2.0,
                  ),
                )
              : SizedBox(
                  width: 24.0.w,
                  height: 24.0.h,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      if (cubit.messageController.text.isEmpty) {
                        // customToast('you must enter some data'.tr());
                      } else {
                        // cubit.postChatData();
                      }
                    },
                    icon: const Icon(
                      Icons.menu,
                      color: AppColors.primary,
                    ),
                  ),
                ),
          Constatnts.width12,
          SizedBox(
            width: 24.0.w,
            height: 24.0.h,
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                // cubit.pickPDF();
              },
              icon: Assets.icons.vector.svg(
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
