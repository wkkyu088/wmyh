import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const double kMonthItemWidth = 60.0;
const double kDayItemWidth = 60.0;
const double kPickerHeight = 30.0;
const int kLeapYear = 2024; // leap year

class DateSelector extends StatefulWidget {
  final Function(DateTime)? onDateChanged;

  const DateSelector({super.key, this.onDateChanged});

  @override
  State<DateSelector> createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  final ScrollController _monthController = ScrollController();
  final ScrollController _dayController = ScrollController();

  int _selectedMonth = DateTime.now().month;
  int _selectedDay = DateTime.now().day;

  final List<String> _months = List.generate(
    12,
    (index) => DateFormat('MMM').format(DateTime(kLeapYear, index + 1)),
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToMonth(_selectedMonth - 1);
      _scrollToDay(_selectedDay - 1);
    });
  }

  void _scrollToMonth(int index) {
    _monthController.animateTo(
      index * kMonthItemWidth,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _scrollToDay(int index) {
    _dayController.animateTo(
      index * kDayItemWidth,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _onMonthTapped(int index) {
    setState(() {
      _selectedMonth = index + 1;
      _adjustDayIfNeeded();
    });
    _scrollToMonth(index);
    _notifyDateChanged();
  }

  void _onDayTapped(int index) {
    setState(() {
      _selectedDay = index + 1;
    });
    _scrollToDay(index);
    _notifyDateChanged();
  }

  void _adjustDayIfNeeded() {
    final daysInMonth = DateUtils.getDaysInMonth(kLeapYear, _selectedMonth);
    if (_selectedDay > daysInMonth) {
      _selectedDay = daysInMonth;
    }
  }

  void _notifyDateChanged() {
    if (widget.onDateChanged != null) {
      widget.onDateChanged!(DateTime(kLeapYear, _selectedMonth, _selectedDay));
    }
  }

  void _goToToday() {
    final now = DateTime.now();
    setState(() {
      _selectedMonth = now.month;
      _selectedDay = now.day;
    });
    _scrollToMonth(_selectedMonth - 1);
    _scrollToDay(_selectedDay - 1);
    _notifyDateChanged();
  }

  @override
  Widget build(BuildContext context) {
    final daysInMonth = DateUtils.getDaysInMonth(kLeapYear, _selectedMonth);
    final days = List.generate(daysInMonth, (index) => (index + 1).toString());

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildHorizontalPicker(
          type: 'month',
          controller: _monthController,
          items: _months,
          selectedIndex: _selectedMonth - 1,
          onTap: _onMonthTapped,
          itemWidth: kMonthItemWidth,
        ),
        _buildHorizontalPicker(
          type: 'day',
          controller: _dayController,
          items: days,
          selectedIndex: _selectedDay - 1,
          onTap: _onDayTapped,
          itemWidth: kDayItemWidth,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: _goToToday,
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.refresh_rounded, size: 16, color: Colors.grey),
                Text(
                  ' Today',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHorizontalPicker({
    required String type,
    required ScrollController controller,
    required List<String> items,
    required int selectedIndex,
    required Function(int) onTap,
    required double itemWidth,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    final horizontalPadding = (screenWidth / 2) - (itemWidth / 2);

    return SizedBox(
      height: kPickerHeight,
      child: ListView.builder(
        controller: controller,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final isSelected = index == selectedIndex;
          return InkWell(
            onTap: () => onTap(index),
            child: Container(
              alignment: Alignment.center,
              width: itemWidth,
              child: Text(
                items[index],
                style: TextStyle(
                  fontSize: type == 'month' ? 16 : 20,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected ? Colors.black : Colors.grey,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
