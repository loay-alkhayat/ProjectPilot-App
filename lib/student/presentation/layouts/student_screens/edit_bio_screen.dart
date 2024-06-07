import 'dart:ui';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectpilot/student/domain/parameters/add_bio_parameters.dart';
import 'package:projectpilot/student/presentation/blocs/main_bloc/cubit.dart';
import 'package:projectpilot/student/presentation/blocs/main_bloc/states.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../core/usecase/base_usecase.dart';
import '../../components/width_button.dart';

class EditBioScreen extends StatelessWidget {
  EditBioScreen({
    super.key,
  });

  final int studentIndex = -1;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final TextEditingController bioController = TextEditingController(
        text: MainCubit.get(context).getStudentInfoEntity!.data.bio);

    return Form(
      key: formKey,
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Edit Bio",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.sp),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 2.w),
                  child: Text(
                    "New Bio :",
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                TextFormField(
                  autofocus: true,
                  selectionWidthStyle: BoxWidthStyle.tight,
                  selectionControls: MaterialTextSelectionControls(),
                  cursorColor: AppColors.greyColor,
                  cursorOpacityAnimates: true,
                  textInputAction: TextInputAction.next,
                  controller: bioController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Your Bio';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Write Your Bio",
                      hintStyle: const TextStyle(color: AppColors.grey),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.w),
                          borderSide: BorderSide.none),
                      fillColor: AppColors.lightGrey,
                      filled: true),
                ),
                SizedBox(
                  height: 2.h,
                ),
                const Spacer(),
                BlocConsumer<MainCubit, MainStates>(
                  listener: (context, state) {
                    if (state is AddBioSuccessState) {
                      Navigator.pop(context);
                      MainCubit.get(context)
                          .getStudentInfo(const NoParameters());
                    }
                  },
                  builder: (context, state) {
                    return ConditionalBuilder(
                      condition: state is! AddBioLoadingState,
                      builder: (context) => widthButton(
                          paddingSize: 0,
                          textButton: "Edit Bio",
                          onPress: () {
                            if (formKey.currentState!.validate()) {
                              BioParameters parameters =
                                  BioParameters(bio: bioController.text);
                              MainCubit.get(context).addBio(parameters);
                            }
                          }),
                      fallback: (context) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  },
                ),
              ],
            ),
          )),
    );
  }
}
