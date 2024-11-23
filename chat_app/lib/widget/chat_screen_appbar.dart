import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/src/core/utils/app_colors.dart';
import 'package:chat_app/src/core/utils/app_theme.dart';
import 'package:chat_app/src/core/utils/assets/assets.gen.dart';
import 'package:chat_app/src/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatScreenAppBar extends StatelessWidget {
  final String image;
  final String name;
  final String status;
  const ChatScreenAppBar({
    super.key,
    required this.image,
    required this.name,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(4.0),
        child: Container(
          color: AppColors.appBarBorderColor,
          height: 4.0,
        ),
      ),
      toolbarHeight: 48.0.h,
      leading: const Icon(
        Icons.arrow_back_ios,
        color: AppColors.primary,
      ),
      // IconButton(
      //   onPressed: Navigator.of(context).pop,
      //   icon: const Icon(
      //     Icons.arrow_back_ios,
      //     color: AppColors.primary,
      //   ),
      // ),
      titleSpacing: -10,
      title: Row(
        children: [
          CachedNetworkImage(
            imageUrl: image,
            imageBuilder: (context, imageProvider) => Container(
              height: 36.0,
              width: 36.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            placeholder: (context, url) => const SizedBox(
              height: 36.0,
              width: 36.0,
              child: Center(
                child: CircularProgressIndicator(
                  color: AppColors.primary,
                ),
              ),
            ),
            errorWidget: (context, url, error) => CircleAvatar(
              radius: 16.0.r,
              child: Assets.images.profilePicture.image(),
            ),
          ),
          Constatnts.width12,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: AppTheme.textTheme.displayMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 17.0.sp,
                  color: Colors.white,
                ),
              ),
              Text(
                status,
                style: AppTheme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withOpacity(.5),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
