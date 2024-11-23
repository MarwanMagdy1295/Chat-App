import 'package:chat_app/src/core/utils/app_colors.dart';
import 'package:chat_app/src/core/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReciverMassege extends StatelessWidget {
  final String massege;
  final String time;
  const ReciverMassege({
    super.key,
    required this.massege,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.start,
      children: [
        Container(
          margin: EdgeInsetsDirectional.only(start: 16.0.w, end: 80.0.w),
          decoration: BoxDecoration(
            color: AppColors.reciverMassegeBGColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.0.r),
              topRight: Radius.circular(12.0.r),
              bottomRight: Radius.circular(12.0.r),
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
