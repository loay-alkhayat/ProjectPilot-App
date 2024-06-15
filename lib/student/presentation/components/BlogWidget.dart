import 'package:flutter/material.dart';
import 'package:projectpilot/core/assets_paths/app_png_paths.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/constants/app_colors.dart';

class BlogWidget extends StatefulWidget {
  final String mainText;
  final String blogText;
  final String? blogImage;
  final String? blogDate;

  const BlogWidget({
    super.key,
    required this.mainText,
    required this.blogText,
    required this.blogDate,
    this.blogImage,
  });

  @override
  _BlogWidgetState createState() => _BlogWidgetState();
}

class _BlogWidgetState extends State<BlogWidget> {
  bool pressExpand = false;
  int maxLines = 2;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(4.w),
      onTap: () {
        setState(() {
          pressExpand = !pressExpand;
          pressExpand == true ? maxLines = 25 : maxLines = 2;
        });
      },
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: const AssetImage(pngPaths.blogImage),
            backgroundColor: Colors.transparent,
            radius: 7.w,
          ),
          SizedBox(
            width: 2.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.mainText,
                  style:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 17.sp),
                ),
                Text(
                  widget.blogDate!, // Adding the date here
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: AppColors.grey,
                  ),
                ),
                AnimatedSize(
                  alignment: Alignment.centerLeft,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.linear,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  reverseDuration: const Duration(milliseconds: 500),
                  child: Text(
                    widget.blogText,
                    maxLines: maxLines,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 15.sp,
                    ),
                  ),
                ),
                maxLines == 2 && widget.blogText.characters.length > 95
                    ? Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "ReadMore...",
                          style: TextStyle(
                            color: AppColors.grey,
                            fontSize: 13.sp,
                          ),
                          softWrap: true,
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
