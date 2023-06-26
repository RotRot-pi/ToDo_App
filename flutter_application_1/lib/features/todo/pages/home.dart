import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/utils/constants.dart';
import 'package:flutter_application_1/common/widgets/app_style.dart';
import 'package:flutter_application_1/common/widgets/custom_sizedbox.dart';
import 'package:flutter_application_1/common/widgets/custom_textfield.dart';
import 'package:flutter_application_1/common/widgets/reusable_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
    with SingleTickerProviderStateMixin {
  late final TextEditingController search;
  late TabController tabController;
  @override
  void initState() {
    search = TextEditingController();
    tabController = TabController(length: 2, vsync: this);

    super.initState();
  }

  @override
  void dispose() {
    search.dispose();
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(85.h),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableText(
                        text: 'Dashboard',
                        style: appTextStyle(
                            18, AppConstants.light, FontWeight.bold)),
                    Container(
                      width: 25.w,
                      height: 25.h,
                      decoration: BoxDecoration(
                        color: AppConstants.light,
                        borderRadius: BorderRadius.circular(9),
                      ),
                      child: GestureDetector(
                        onTap: () {},
                        child: const Icon(
                          Icons.add,
                          color: AppConstants.bkDark,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const CustomSizedBox(
                height: 20,
              ),
              CustomTextField(
                hintText: 'Search',
                controller: search,
                prefixIcon: Container(
                  padding: EdgeInsets.all(14.h),
                  child: GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      AntDesign.search1,
                      color: AppConstants.greyLight,
                    ),
                  ),
                ),
                suffixIcon: const Icon(
                  FontAwesome.sliders,
                  color: AppConstants.greyLight,
                ),
              ),
              const CustomSizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView(
            children: [
              const CustomSizedBox(
                height: 25,
              ),
              Row(
                children: [
                  const Icon(
                    FontAwesome.tasks,
                    size: 20,
                    color: AppConstants.light,
                  ),
                  const CustomSizedBox(
                    width: 10,
                  ),
                  ReusableText(
                    text: "Today's Task",
                    style:
                        appTextStyle(18, AppConstants.light, FontWeight.bold),
                  ),
                ],
              ),
              const CustomSizedBox(
                height: 25,
              ),
              Container(
                decoration: BoxDecoration(
                    color: AppConstants.light,
                    borderRadius: BorderRadius.circular(AppConstants.radius)),
                child: TabBar(
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: BoxDecoration(
                        color: AppConstants.greyLight,
                        borderRadius:
                            BorderRadius.circular(AppConstants.radius)),
                    controller: tabController,
                    labelPadding: EdgeInsets.zero,
                    isScrollable: false,
                    labelColor: AppConstants.blueLight,
                    labelStyle: appTextStyle(
                      24,
                      AppConstants.blueLight,
                      FontWeight.w700,
                    ),
                    unselectedLabelColor: AppConstants.light,
                    tabs: [
                      Tab(
                        child: SizedBox(
                            width: AppConstants.width,
                            child: ReusableText(
                              text: 'Pending',
                              style: appTextStyle(
                                16,
                                AppConstants.bkDark,
                                FontWeight.bold,
                              ),
                            )),
                      ),
                      Tab(
                        child: SizedBox(
                          width: AppConstants.width * .5,
                          child: Center(
                              child: ReusableText(
                            text: 'Completed',
                            style: appTextStyle(
                                16, AppConstants.bkDark, FontWeight.bold),
                          )),
                        ),
                      )
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
