import 'package:car_list/constants/theme.dart';
import 'package:car_list/utils/size_utils2.dart';
import 'package:flutter/material.dart';

class LargeSearchField extends StatelessWidget {
  final String? hintText;
  final bool outline;

  const LargeSearchField({Key? key, this.hintText, this.outline = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity - (defaultPadding * (1.2 * 2)),
      height: Responsive.isMobile(context) ? 60 : 75,
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 100),
          hintText: hintText ?? "Search For Car",
          //hintStyle: Styles.normalText.copyWith(color: Colors.grey),
          prefixIcon: Container(
            child: Icon(Icons.search,
                color: Colors.black,
                size: Responsive.isMobile(context) ? 17 : 30),
            margin: const EdgeInsets.only(left: 20),
          ),
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(defaultRadius1),
                bottomLeft: Radius.circular(defaultRadius1)),
            borderSide: BorderSide(
                color: outline ? Colors.grey.shade300 : Colors.white),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(defaultRadius1)),
            borderSide: BorderSide(
                color: outline ? Colors.grey.shade300 : Colors.white),
          ),
          filled: true,
        ),
        expands: false,
        maxLines: 1,
        minLines: 1,
      ),
    );
  }
}
