import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/constants/app_colors.dart';

class ProposalWidget extends StatelessWidget {
  final String proposalName;
  final String proposalDescription;
  final String proposalPdf;

  ProposalWidget({
    Key? key,
    required this.proposalName,
    required this.proposalDescription,
    required this.proposalPdf,
  }) : super(key: key);

  bool expandedText = false;
  int? pad;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) => Card(
        margin: EdgeInsets.symmetric(horizontal: 5.w),
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        surfaceTintColor: AppColors.white,
        color: AppColors.white,
        shape: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(3.w),
        ),
        elevation: 3,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              color: AppColors.primary,
              height: proposalDescription.characters.length > 60
                  ? expandedText
                      ? 30.h
                      : 20.h
                  : 16.h,
              width: 1.w,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Proposal Name :",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17.sp,
                          ),
                        ),
                        SizedBox(
                          width: 1.w,
                        ),
                        Container(
                          width: 46.w,
                          child: Text(
                            proposalName,
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 16.sp,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            softWrap: true,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "Proposal Description :",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 17.sp,
                      ),
                    ),
                    AnimatedSize(
                      duration: const Duration(milliseconds: 500),
                      child: Text(
                        proposalDescription,
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 16.sp,
                        ),
                        maxLines: expandedText ? 4 : 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Proposal Pdf :",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17.sp,
                          ),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        InkWell(
                            borderRadius: BorderRadius.circular(4.w),
                            onTap: () async {
                              String prefixedUrl =
                                  'http://192.168.1.110:8000/$proposalPdf';
                              Uri uri = Uri.parse(prefixedUrl);
                              if (await canLaunchUrl(uri)) {
                                await launchUrl(uri);
                              } else {
                                throw 'Could not launch $uri';
                              }
                            },
                            child: Text(
                              "Download Now!",
                              style: TextStyle(
                                  fontSize: 16.sp, color: AppColors.primary),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    proposalDescription.characters.length > 60
                        ? Center(
                            child: Container(
                              width: 35.w,
                              height: 5.h,
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.circular(4.w),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    expandedText = !expandedText;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      expandedText
                                          ? "Hide Details"
                                          : "View Details",
                                      style: TextStyle(
                                        color: AppColors.white,
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 1.w,
                                    ),
                                    Icon(
                                      expandedText
                                          ? Icons.arrow_upward_rounded
                                          : Icons.arrow_downward_outlined,
                                      color: AppColors.white,
                                      size: 6.w,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
