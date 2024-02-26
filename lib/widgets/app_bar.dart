import 'package:flutter/material.dart';
import 'package:munch_flutter_assessment/styles/index.dart';
import 'package:munch_flutter_assessment/widgets/index.dart';

class TitleBar extends StatefulWidget {
  const TitleBar({Key? key}) : super(key: key);

  @override
  State<TitleBar> createState() => _TitleBarState();
}

class _TitleBarState extends State<TitleBar> {
  final String logoText = 'JP';
  final String heading = 'Jim\'s Place';
  final String subheading = '22 Burton Road';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Center(
              child: Container(
                width: 38,
                height: 38,
                margin: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                ),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: whiteColour,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  logoText,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    fontFamily: fontFamily,
                    color: textColour,
                  ),
                ),
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    heading,
                    style: kTitle,
                  ),
                  Text(
                    subheading,
                    style: kSubHeading,
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          width: 38,
          height: 38,
          margin: const EdgeInsets.only(right: 16),
          decoration: BoxDecoration(
            color: buttonColour,
            borderRadius: BorderRadius.circular(8),
          ),
          child: IconButton(
            icon: CustomIcon(
              name: CustomIcons.iconMore,
              color: whiteColour,
              size: 24,
            ),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                barrierColor: overlayColour.withOpacity(0.8),
                builder: (context) => const AppInfo(),
              );
            },
          ),
        ),
      ],
    );
  }
}
