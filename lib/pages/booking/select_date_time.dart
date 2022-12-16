import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:car_clean/constant/constant.dart';
import 'package:car_clean/pages/screens.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

const labelMonth = 'Month';
const labelDate = 'Date';
const labelWeekDay = 'Week Day';

class SelectDateTime extends StatefulWidget {
  @override
  _SelectDateTimeState createState() => _SelectDateTimeState();
}

class _SelectDateTimeState extends State<SelectDateTime> {
  DateTime _selectedDate;
  String selectedTime = '';
  String selectedDate;
  String monthString;
  DateTime firstDate = DateTime.now();
  DateTime lastDate = DateTime.now().add(Duration(days: 30));

  final slotList = [
    {'time': '09:00 AM'},
    {'time': '10:00 AM'},
    {'time': '11:00 AM'},
    {'time': '12:00 PM'},
    {'time': '01:00 PM'},
    {'time': '02:00 PM'},
    {'time': '03:00 PM'},
    {'time': '04:00 PM'},
    {'time': '05:00 PM'},
    {'time': '06:00 PM'},
    {'time': '07:00 PM'}
  ];

  @override
  void initState() {
    super.initState();
    _resetSelectedDate();
    selectedDate =
        '${firstDate.day}-${convertNumberMonthToStringMonth(firstDate.month)}';
  }

  void _resetSelectedDate() {
    _selectedDate = DateTime.now();
  }

  String convertNumberMonthToStringMonth(month) {
    if (month == 1) {
      monthString = 'January';
    } else if (month == 2) {
      monthString = 'Fabruary';
    } else if (month == 3) {
      monthString = 'March';
    } else if (month == 4) {
      monthString = 'April';
    } else if (month == 5) {
      monthString = 'May';
    } else if (month == 6) {
      monthString = 'June';
    } else if (month == 7) {
      monthString = 'July';
    } else if (month == 8) {
      monthString = 'August';
    } else if (month == 9) {
      monthString = 'September';
    } else if (month == 10) {
      monthString = 'October';
    } else if (month == 11) {
      monthString = 'November';
    } else if (month == 12) {
      monthString = 'December';
    }
    return monthString;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 1.0,
        backgroundColor: whiteColor,
        title: Text(
          'Select Date & Time',
          style: appBarTextStyle,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: blackColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      bottomNavigationBar: Material(
        elevation: 1.0,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.rightToLeft,
                child: SelectPaymentMethod(),
              ),
            );
          },
          child: Container(
            width: double.infinity,
            height: 50.0,
            color: primaryColor,
            alignment: Alignment.center,
            child: Text(
              'Continue',
              style: white18BoldTextStyle,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          horizontalDatePicker(),
          heightSpace,
          Container(
            margin: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
            height: 1.0,
            width: double.infinity,
            color: greyColor.withOpacity(0.4),
          ),
          slots(),
        ],
      ),
    );
  }

  horizontalDatePicker() {
    return CalendarTimeline(
      showYears: false,
      initialDate: _selectedDate,
      firstDate: firstDate,
      lastDate: lastDate,
      onDateSelected: (date) {
        setState(() {
          _selectedDate = date;
          selectedDate =
              '${_selectedDate.day}-${convertNumberMonthToStringMonth(_selectedDate.month)}';
        });
      },
      leftMargin: 20,
      monthColor: primaryColor,
      dayColor: Colors.teal[500],
      dayNameColor: whiteColor.withOpacity(0.85),
      activeDayColor: whiteColor,
      activeBackgroundDayColor: primaryColor,
      dotsColor: whiteColor.withOpacity(0.85),
      locale: 'en',
    );
  }

  slots() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(fixPadding * 2.0),
          child: Text(
            '11 Slots',
            style: black18BoldTextStyle,
          ),
        ),
        Wrap(
          children: slotList
              .map(
                (e) => Padding(
                  padding: EdgeInsets.only(
                      left: fixPadding * 2.0, bottom: fixPadding * 2.0),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedTime = e['time'];
                      });
                    },
                    child: Container(
                      width: 90.0,
                      padding: EdgeInsets.all(fixPadding),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(width: 0.7, color: greyColor),
                        color: (e['time'] == selectedTime)
                            ? primaryColor
                            : whiteColor,
                      ),
                      child: Text(e['time'],
                          style: (e['time'] == selectedTime)
                              ? white14MediumTextStyle
                              : primaryColor14MediumTextStyle),
                    ),
                  ),
                ),
              )
              .toList()
              .cast<Widget>(),
        ),
      ],
    );
  }
}
