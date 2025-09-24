import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  static TextStyle head = GoogleFonts.openSans(
    textStyle: TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  );
  static TextStyle subHead = GoogleFonts.openSans(
    textStyle: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  );
  static TextStyle regular = GoogleFonts.openSans(
    textStyle: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
  );
}
