// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class MonthDropdownList extends StatefulWidget {
  final BuildContext context;
  final List<String> months;
  final String selectedMonth;
  final void Function(String?) onChanged;

  const MonthDropdownList({super.key, 
    required this.context,
    required this.months,
    required this.selectedMonth,
    required this.onChanged,
  });

  @override
  _MonthDropdownListState createState() => _MonthDropdownListState();
}

class _MonthDropdownListState extends State<MonthDropdownList> {
  List<bool> isCheckedList = [];

  @override
  void initState() {
    super.initState();
    isCheckedList = List<bool>.generate(
      widget.months.length,
      (index) => widget.selectedMonth.contains(widget.months[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _showMonthSuggestions(
            widget.context, widget.selectedMonth, widget.onChanged);
      },
      child: InputDecorator(
        decoration: const InputDecoration(
          hintText: 'Month',
          hintStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color(0xFF959EAE),
            fontFamilyFallback: ["Roboto-Bold.ttf"],
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 16.0,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                widget.selectedMonth.isEmpty
                    ? 'Select month'
                    : widget.selectedMonth,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF959EAE),
                  fontFamilyFallback: ["Roboto-Bold.ttf"],
                ),
              ),
            ),
            const Icon(
              Icons.arrow_drop_down,
              color: Color(0xFF959EAE),
            ),
          ],
        ),
      ),
    );
  }

  void _showMonthSuggestions(BuildContext context, String selectedMonth,
      void Function(String?) onChanged) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Month'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: widget.months.asMap().entries.map((entry) {
                final int index = entry.key;
                final String month = entry.value;

                return StatefulBuilder(
                  builder: (context, setState) {
                    return CheckboxListTile(
                      title: Text(month),
                      value: isCheckedList[index],
                      onChanged: (value) {
                        setState(() {
                          isCheckedList[index] = value ?? false;
                        });
                      },
                    );
                  },
                );
              }).toList(),
            ),
          ),
          actions: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(const Color(0xFF3467D2)),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
                final List<String> selectedMonths = [];
                for (int i = 0; i < isCheckedList.length; i++) {
                  if (isCheckedList[i]) {
                    selectedMonths.add(widget.months[i]);
                  }
                }
                widget.onChanged(selectedMonths.join(', '));
              },
              child: const Text('Done'),
            ),
          ],
        );
      },
    );
  }
}
