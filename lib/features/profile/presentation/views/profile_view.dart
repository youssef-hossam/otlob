import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otlob/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:otlob/features/profile/presentation/widgets/build_info.dart';
import 'package:otlob/features/profile/presentation/widgets/build_info_row.dart';
import 'package:otlob/features/profile/presentation/widgets/build_square_button.dart';

class ProfileView extends StatefulWidget {
  static const String routeName = '/profile';
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  bool isNigeriaSelected = true;

  /// preview the user name from the cubit
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // الجزء العلوي: الخلفية والأزرار والعنوان
            Stack(
              children: [
                // 2. المحتوى فوق الخلفية (Back button, Bell, Title, Avatar)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // const SizedBox(height: 16),
                      // أزرار الرجوع والتنبيهات
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildSquareButton(
                            icon: Icons.arrow_back_ios_new_rounded,
                            iconColor: Colors.redAccent,
                            onTap: () {},
                          ),
                          buildSquareButton(
                            icon: Icons.notifications_none_rounded,
                            iconColor: const Color(0xFFE91E63),
                            onTap: () {},
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      // عنوان الصفحة
                      const Text(
                        'Profile',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 15),
                      // الصورة الشخصية وبداخلها زر التعديل الوردي
                      Center(
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: const BoxDecoration(
                                color: Color(0xFFFFEAEA),
                                shape: BoxShape.circle,
                              ),
                              child: const CircleAvatar(
                                radius: 50,
                                backgroundImage: NetworkImage(
                                  'https://i.imgur.com/Qp13C7B.png', // رابط مؤقت للصورة الشخصية
                                ),
                              ),
                            ),
                            // زر القلم للتعديل
                            Positioned(
                              right: 4,
                              bottom: 4,
                              child: Container(
                                padding: const EdgeInsets.all(6),
                                decoration: const BoxDecoration(
                                  color: Color(0xFFE91E63),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.edit_outlined,
                                  size: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            // باقي الصفحة (المعلومات الشخصية ومعلومات الاتصال)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // قسم Personal Info
                  const Text(
                    'Personal Info',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  buildInfoCard(
                    children: [
                      BlocBuilder<ProfileCubit, ProfileState>(
                        builder: (context, state) {
                          return buildInfoRow(
                              'Your name',
                              state is ProfileLoaded
                                  ? state.userModel.fullName
                                  : 'Loading...');
                        },
                      ),
                      const Divider(height: 24, color: Color(0xFFF2F2F2)),
                      buildInfoRow('Occupation', 'Manager'),
                      const Divider(height: 24, color: Color(0xFFF2F2F2)),
                      buildInfoRow('Employer', 'Food Couriers'),
                      const Divider(height: 24, color: Color(0xFFF2F2F2)),
                      // السطر الخاص بـ Switch
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Nigeria',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black87,
                            ),
                          ),
                          Switch(
                            value: isNigeriaSelected,
                            activeColor: const Color(0xFFE91E63),
                            onChanged: (val) {
                              setState(() {
                                isNigeriaSelected = val;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  // قسم Contact Info
                  const Text(
                    'Contact Info',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  buildInfoCard(
                    children: [
                      buildInfoRow('Phone number', '+234 813 0400 445'),
                      const Divider(height: 24, color: Color(0xFFF2F2F2)),
                      BlocBuilder<ProfileCubit, ProfileState>(
                        builder: (context, state) {
                          return buildInfoRow(
                              'Email',
                              state is ProfileLoaded
                                  ? state.userModel.email
                                  : 'Example@example.com');
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  // زر Edit
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE91E63),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Edit',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
