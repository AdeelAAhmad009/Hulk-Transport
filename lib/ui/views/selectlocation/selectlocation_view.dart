import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hulk_transport/core/constants/assets.dart';
import 'package:hulk_transport/core/constants/colors.dart';
import 'package:hulk_transport/ui/custom_widgets/custom_app_bar_widget.dart';
import 'package:hulk_transport/ui/custom_widgets/custom_button.dart';
import 'package:hulk_transport/ui/custom_widgets/custom_image_widget.dart';
import 'package:hulk_transport/ui/custom_widgets/custom_text_field.dart';
import 'package:stacked/stacked.dart';

import 'selectlocation_viewmodel.dart';

class SelectlocationView extends StackedView<SelectlocationViewModel> {
  const SelectlocationView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SelectlocationViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              AppImages.imBGredWave,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: CustomTopAppBar(
                    onTapForNotifications: () {
                      // viewModel.navigateToNotificationsView();
                    },
                  ),
                ),

                20.verticalSpace,

                ///
                SingleChildScrollView(
                  child: SizedBox(
                    height: 650.h,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(13.r),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(13.r),
                                    child: CustomImageView(
                                      imagePath: AppImages.imMap,
                                      fit: BoxFit.cover,
                                      height: 650.h,
                                      width: 350.w,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16.w, vertical: 14.h),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        CustomImageView(
                                          imagePath: AppIcons.icPickLocation,
                                          height: 45.h,
                                          width: 45.w,
                                          onTap: () {
                                            viewModel
                                                .navigateToSeachlocationView();
                                          },
                                        ),
                                        30.verticalSpace,
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                          ),
                                          width: double.infinity,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                top: 20.h,
                                                left: 20.w,
                                                right: 20.w),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Select  Location",
                                                  style: AppTextStyles
                                                      .ktBoldTextStyle
                                                      .copyWith(
                                                    fontSize: 17.sp,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                14.verticalSpace,
                                                CustomTextField(
                                                  controller:
                                                      TextEditingController(),
                                                  text: "Where From",
                                                ),
                                                10.verticalSpace,
                                                CustomTextField(
                                                  controller:
                                                      TextEditingController(),
                                                  text: "Where To",
                                                ),
                                                30.verticalSpace,
                                                Text(
                                                  "Recent Rides",
                                                  style: AppTextStyles
                                                      .ktBoldTextStyle
                                                      .copyWith(
                                                    fontSize: 17.sp,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                10.verticalSpace,
                                                const RecentDriveWidget(
                                                  text: "Cooper Road",
                                                  time: "Two Days ago",
                                                ),
                                                5.verticalSpace,
                                                const RecentDriveWidget(
                                                  text: "Flower Show",
                                                  time: "Five Days ago",
                                                ),
                                                5.verticalSpace,

                                                const RecentDriveWidget(
                                                  text: "Nile Park Road",
                                                  time: "Six Days Ago",
                                                ),

                                                20.verticalSpace,
                                                CustomButton(
                                                  onPressed: () {
                                                    viewModel
                                                        .navigateToTypeselectionView();
                                                  },
                                                  text: "Next",
                                                ),

                                                10.verticalSpace,

                                                ///
                                                ///
                                                ///
                                                ///
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  SelectlocationViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SelectlocationViewModel();
}

class RecentDriveWidget extends StatelessWidget {
  final String text;
  final String time;
  const RecentDriveWidget({
    super.key,
    required this.text,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              text,
              style: AppTextStyles.ktBoldTextStyle.copyWith(
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              time,
              style: AppTextStyles.ktBoldTextStyle.copyWith(
                fontSize: 10.sp,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
        5.verticalSpace,
        Divider(
          color: const Color(0xFF7A7979).withOpacity(0.3),
          thickness: 1,
        ),
      ],
    );
  }
}
