import 'package:bierdygame/app/modules/superAdmin/reportsAndAnalytics/controller/reports_and_analytics_controller.dart';
import 'package:bierdygame/app/modules/superAdmin/reportsAndAnalytics/widgets/custom_bar_graph.dart';
import 'package:bierdygame/app/modules/superAdmin/reportsAndAnalytics/widgets/custom_report_pie_chart.dart';
import 'package:bierdygame/app/modules/superAdmin/reportsAndAnalytics/widgets/reports_line_graph.dart';
import 'package:bierdygame/app/theme/app_colors.dart';
import 'package:bierdygame/app/theme/app_text_styles.dart';
import 'package:bierdygame/app/widgets/custom_elevated_button.dart';
import 'package:bierdygame/app/widgets/custom_tab_bar.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ReportsAndAnalytics extends GetView<ReportsAndAnalyticsController> {
  const ReportsAndAnalytics({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ReportsAndAnalyticsController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 22,
                      color: AppColors.primary,
                    ),
                  ),
                  SizedBox(width: 100.w),
                  Text(
                    "Reports And Analytics",
                    style: AppTextStyles.miniHeadings,
                  ),
                ],
              ),

              SizedBox(height: 15.h),
              Obx(
                () => CustomStatusTabBar(
                  title1: "Weekly",
                  title2: "Monthly",
                  title3: "Yearly",
                  selectedIndex: controller.selectedTab.value,
                  onChanged: controller.changeTab,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Obx(() {
                  switch (controller.selectedTab.value) {
                    case 0:
                      return _weeklyStats();
                    case 1:
                      return _monthlyStats();
                    default:
                      return _yearlyStats();
                  }
                }),
              ),
                            SizedBox(height: 30.h,),

              CustomElevatedButton(onPressed: (){}, btnName: "Export CSV / PDF"),
            ],
          ),
        ),
      ),
    );
  }

  /// List of All Clubs
  Widget _weeklyStats() {
    return SingleChildScrollView(
      child: Column(
        spacing: 10.0,
        children: [
          buildLineGraph(),
          buildBarGraph(title: "Games Played", gamesplayed: 1500),
          buildPieChart(
            playersPerClub: 112,
            percent1: 43,
            percent2: 43,
            title: "Players Per Club",
            indicatorText1: "indicatorText1",
            indicatorText2: "indicatorText2",
            indicatorText3: "indicator 3",
            color3: AppColors.darkBlue,
            sections: [
              PieChartSectionData(
                color: Color(0xffE6874E),
                value: 43,
                title: 43.toString(),
                radius: 25,
                titleStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              PieChartSectionData(
                color: Color(0xff00B67A),
                value: 43,
                title: 43.toString(),
                radius: 25,
                titleStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
               PieChartSectionData(
                color: AppColors.darkBlue,
                value: 43,
                title: 43.toString(),
                radius: 25,
                titleStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Active Clubs placeholder
  Widget _monthlyStats() => const Text("Monthly Stats");

  /// Blocked Clubs placeholder
  Widget _yearlyStats() => const Text("Yealry Stats");
}
