import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget {
  final String title;
  final String buttonLabel;
  final IconData buttonIcon;
  final Color buttonColor;
  final VoidCallback onTap;
  final double? width;

  // Action when the button is tapped

  const CustomCardWidget({
    super.key,
    required this.title,
    required this.buttonLabel,
    required this.buttonIcon,
    required this.buttonColor,
    required this.onTap,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xffC9D7E5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8),
          child: Row(
            children: [
              Text(title,
                  style: const TextStyle(
                      fontFamily: 'Helvetica',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Color(0xff315D80))),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                decoration: BoxDecoration(
                  color: buttonColor, // Button background color
                  borderRadius: BorderRadius.circular(30), // Rounded corners
                ),
                child: InkWell(
                  onTap: onTap,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    // Adjust to button content size
                    children: [
                      width != null
                          ? SizedBox(
                              width: width,
                              child: Text(
                                buttonLabel,
                                maxLines: 2,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.white, // Text color
                                  fontFamily: 'Helvetica',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                ),
                              ),
                            )
                          : Text(
                              buttonLabel,
                              style:  TextStyle(
                                color: Colors.white, // Text color
                                fontFamily: 'Helvetica',
                                fontWeight: FontWeight.bold,
                                fontSize: 10,// Font weight
                              ),
                            ),
                      const SizedBox(width: 5), // Spacing between text and icon
                      Icon(
                        buttonIcon, // Button icon
                        color: Colors.white, // Icon color
                        size: 14, // Icon size
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
