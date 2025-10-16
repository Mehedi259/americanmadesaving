import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'app/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp.router(
          title: 'American Made Savings',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor: Colors.white,
            fontFamily: 'Inter',
          ),
          routerDelegate: AppRoutes.router.routerDelegate,
          routeInformationParser: AppRoutes.router.routeInformationParser,
          routeInformationProvider: AppRoutes.router.routeInformationProvider,
        );
      },
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:device_preview/device_preview.dart';
// import 'app/routes/routes.dart';
//
// void main() {
//   runApp(
//     DevicePreview(
//       enabled: true, // set to false before releasing
//       builder: (context) => const MyApp(),
//     ),
//   );
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       designSize: const Size(375, 812),
//       minTextAdapt: true,
//       splitScreenMode: true,
//       builder: (_, child) {
//         return GetMaterialApp.router(
//           title: 'American Made Savings',
//           debugShowCheckedModeBanner: false,
//           useInheritedMediaQuery: true, // Required for DevicePreview
//           locale: DevicePreview.locale(context), // Add locale support
//           builder: DevicePreview.appBuilder, // Wrap UI with DevicePreview
//           theme: ThemeData(
//             primarySwatch: Colors.blue,
//             scaffoldBackgroundColor: Colors.white,
//             fontFamily: 'Inter',
//           ),
//           routerDelegate: AppRoutes.router.routerDelegate,
//           routeInformationParser: AppRoutes.router.routeInformationParser,
//           routeInformationProvider: AppRoutes.router.routeInformationProvider,
//         );
//       },
//     );
//   }
// }
