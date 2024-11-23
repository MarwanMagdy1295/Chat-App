import 'package:chat_app/src/core/utils/app_colors.dart';
import 'package:chat_app/src/core/utils/app_theme.dart';
import 'package:chat_app/src/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SenderMassege extends StatelessWidget {
  final String massege;
  final String time;
  const SenderMassege({
    super.key,
    required this.massege,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.end,
      children: [
        Container(
          margin: EdgeInsetsDirectional.only(end: 16.0.w, start: 80.0.w),
          decoration: BoxDecoration(
            color: AppColors.secondry,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.0.r),
              topRight: Radius.circular(12.0.r),
              bottomLeft: Radius.circular(12.0.r),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                child: Text(
                  'I just, I mean, I find it relaxing.',
                  style: AppTheme.textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColors.white,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                  end: 6.0.w,
                  bottom: 6.0.w,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '12.00',
                      style: AppTheme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.white,
                      ),
                    ),
                    Constatnts.width4,
                    const Icon(
                      Icons.check,
                      color: AppColors.white,
                      size: 14.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
