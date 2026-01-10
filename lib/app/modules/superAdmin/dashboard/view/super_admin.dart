import 'package:bierdygame/app/modules/superAdmin/notifications/view/notification_view.dart';
import 'package:bierdygame/app/widgets/custom_club_detail_grid.dart';
import 'package:bierdygame/app/widgets/custom_double_bar.dart';
import 'package:bierdygame/app/widgets/custom_profile_bar.dart';
import 'package:bierdygame/app/modules/superAdmin/widgets/custom_gradient_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SuperAdminDashboard extends StatelessWidget {
  const SuperAdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16,),
          child: ListView(
            children: [
              SizedBox(height: 20.h,),
              CustomProfileBar(onTap: () {
                Get.to(()=>NotificationView());
              }, bgImg: 'assets/images/dashboard_img.png', name: 'Super Admin',),
              SizedBox(height: 20.h,),
              ClubsDetailGrid(value1: 109.toString(), value2: 75.toString(), value3: 25.toString(), value4: 12.toString(),),
              SizedBox(height: 20.h,),
              CustomGradientGrid(),
              SizedBox(height: 20.h,),
              CustomDoubleBar(),
            ],
          ),
        ),
      );
    
  }

  
}
