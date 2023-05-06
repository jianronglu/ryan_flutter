import 'package:flutter/material.dart';


class UPCommonColorUtil {
 static Color colorWithHexStr([String hex = 'FFFFFF', double opacity = 1]) => Color(int.parse(hex, radix: 16)).withOpacity(opacity);
}

