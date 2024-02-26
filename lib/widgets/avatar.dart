import 'package:flutter/widgets.dart';
import 'package:munch_flutter_assessment/styles/index.dart';

class Avatar extends StatelessWidget {
  final String initials;
  final Color backgroundColour;

  const Avatar({
    Key? key,
    required this.initials,
    required this.backgroundColour,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        color: backgroundColour,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          initials,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            fontFamily: fontFamily,
            color: whiteColour,
          ),
        ),
      ),
    );
  }
}
