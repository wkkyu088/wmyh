import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onMenuTap;
  final VoidCallback? onCalendarTap;

  const CustomAppBar({super.key, this.onMenuTap, this.onCalendarTap});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.menu_rounded),
        onPressed: onMenuTap ?? () {},
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.calendar_month_rounded),
          onPressed: onCalendarTap ?? () {},
        ),
      ],
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0,
      scrolledUnderElevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
