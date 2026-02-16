import 'package:care_mall_affiliate/app/commenwidget/apptext.dart';
import 'package:care_mall_affiliate/app/theme_data/app_colors.dart';
import 'package:care_mall_affiliate/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: SizedBox(
          height: 30,
          child: Assets.icons.appLogoPng.image(fit: BoxFit.fitHeight),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {
              // TODO: Navigate to notifications
            },
          ),
          IconButton(
            icon: const Icon(Icons.person_outline),
            onPressed: () {
              // TODO: Navigate to profile
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome Message
              AppText(
                text: 'Welcome to Care Mall Affiliate',
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.textnaturalcolor,
              ),
              SizedBox(height: 8.h),
              AppText(
                text: 'Start earning by promoting our products',
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.textDefaultSecondarycolor,
              ),
              SizedBox(height: 32.h),

              // Dashboard Cards
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children: [
                    _buildDashboardCard(
                      icon: Icons.shopping_bag_outlined,
                      title: 'Products',
                      subtitle: 'Browse products',
                      color: Colors.blue,
                      onTap: () {
                        // TODO: Navigate to products
                      },
                    ),
                    _buildDashboardCard(
                      icon: Icons.bar_chart_outlined,
                      title: 'Earnings',
                      subtitle: 'View your earnings',
                      color: Colors.green,
                      onTap: () {
                        // TODO: Navigate to earnings
                      },
                    ),
                    _buildDashboardCard(
                      icon: Icons.link_outlined,
                      title: 'My Links',
                      subtitle: 'Affiliate links',
                      color: Colors.orange,
                      onTap: () {
                        // TODO: Navigate to links
                      },
                    ),
                    _buildDashboardCard(
                      icon: Icons.people_outline,
                      title: 'Referrals',
                      subtitle: 'Your referrals',
                      color: Colors.purple,
                      onTap: () {
                        // TODO: Navigate to referrals
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDashboardCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withValues(alpha: 0.3), width: 1),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: color),
            const SizedBox(height: 12),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: color,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.grey.shade600,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
