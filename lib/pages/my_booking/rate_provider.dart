import 'package:car_clean/constant/constant.dart';
import 'package:flutter/material.dart';

class RateProvider extends StatefulWidget {
  @override
  _RateProviderState createState() => _RateProviderState();
}

class _RateProviderState extends State<RateProvider> {
  int rate = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 1.0,
        backgroundColor: whiteColor,
        title: Text(
          'Rate Your Service Provider',
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
      body: ListView(
        children: [
          SizedBox(height: 40.0),
          ratingBar(),
          SizedBox(height: 40.0),
          writeReview(),
          submit(),
        ],
      ),
    );
  }

  ratingBar() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                rate = 1;
              });
            },
            child: Icon(
              (rate == 1 || rate == 2 || rate == 3 || rate == 4 || rate == 5)
                  ? Icons.star
                  : Icons.star_border,
              color: Colors.lime,
              size: 40.0,
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                rate = 2;
              });
            },
            child: Icon(
              (rate == 2 || rate == 3 || rate == 4 || rate == 5)
                  ? Icons.star
                  : Icons.star_border,
              color: Colors.lime,
              size: 40.0,
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                rate = 3;
              });
            },
            child: Icon(
              (rate == 3 || rate == 4 || rate == 5)
                  ? Icons.star
                  : Icons.star_border,
              color: Colors.lime,
              size: 40.0,
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                rate = 4;
              });
            },
            child: Icon(
              (rate == 4 || rate == 5) ? Icons.star : Icons.star_border,
              color: Colors.lime,
              size: 40.0,
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                rate = 5;
              });
            },
            child: Icon(
              (rate == 5) ? Icons.star : Icons.star_border,
              color: Colors.lime,
              size: 40.0,
            ),
          ),
        ],
      ),
    );
  }

  writeReview() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: TextField(
          keyboardType: TextInputType.multiline,
          maxLines: 5,
          style: black14RegularTextStyle,
          decoration: InputDecoration(
            hintText: 'Write your review here',
            hintStyle: grey14RegularTextStyle,
            border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(10.0),
              ),
              borderSide: BorderSide(color: primaryColor, width: 0.7),
            ),
            fillColor: whiteColor,
            filled: true,
          ),
        ),
      ),
    );
  }

  submit() {
    return Padding(
      padding: EdgeInsets.all(fixPadding * 2.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(20.0),
        onTap: () => Navigator.pop(context),
        child: Container(
          padding: EdgeInsets.all(fixPadding * 1.5),
          alignment: Alignment.center,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0), color: primaryColor),
          child: Text(
            'Submit',
            style: white18BoldTextStyle,
          ),
        ),
      ),
    );
  }
}
