import 'package:devy_boiler_plate/utils/helper/date_helper.dart';
import 'package:flutter/material.dart';

class DateTimeSelector extends StatefulWidget {
  final ValueChanged<DateTime> onDateTimeChange;
  final String label;
  final DateTime? date;
  final bool isEditable;
  const DateTimeSelector(
      {super.key,
      this.label = "Select Date and Time",
      this.date,
      this.isEditable = true,
      required this.onDateTimeChange});

  @override
  State<DateTimeSelector> createState() => _DateTimeSelectorState();
}

class _DateTimeSelectorState extends State<DateTimeSelector> {
  DateTime? date;

  @override
  void initState() {
    date = widget.date ?? DateTime.now();
    super.initState();
  }

  onDateSelect() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    ).then((pickedDate) {
      if (pickedDate != null) {
        widget.onDateTimeChange(pickedDate);
        setState(() {
          date = pickedDate;
        });
      }
    });
  }

  onTimeSelect() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((pickedTime) {
      if (pickedTime != null) {
        date = DateTime(
          date!.year,
          date!.month,
          date!.day,
          pickedTime.hour,
          pickedTime.minute,
        );
        widget.onDateTimeChange(date!);
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            if (widget.isEditable) {
              onDateSelect();
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  widget.label,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                color: Theme.of(context).colorScheme.primaryContainer,
                child: Text(
                    DateHelper.dateToString(
                        date ?? DateTime.now(), DateHelper.dayDateMonthYear),
                    style: Theme.of(context).textTheme.bodyLarge),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: InkWell(
            onTap: () {
              if (widget.isEditable) {
                onTimeSelect();
              }
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text("",
                        style: Theme.of(context).textTheme.labelMedium)),
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Theme.of(context).colorScheme.primaryContainer,
                  child: Text(
                      DateHelper.dateToString(
                        date ?? DateTime.now(),
                        DateHelper.hhMMA,
                      ),
                      style: Theme.of(context).textTheme.bodyLarge),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
