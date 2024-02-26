import 'package:flutter/material.dart';
import 'package:munch_flutter_assessment/styles/index.dart';

class AppInfo extends StatelessWidget {
  const AppInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String version = '6.6.5';
    String environment = 'Production';
    String deviceID = 'ACEHFJD3-DJUFG-SJHFS-84YSS';

    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: whiteColour,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'App Information',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: fontFamily,
                ),
              ),
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  color: errorAccent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: IconButton(
                  icon: CustomIcon(
                    name: CustomIcons.iconClose,
                    color: errorColor,
                    size: 24,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 16),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: containerColour,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Version $version'),
                Text(environment),
                Text('Device ID: $deviceID'),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                foregroundColor: tertiaryColor,
                backgroundColor: tertiaryAccent,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 0,
              ),
              icon: CustomIcon(
                name: CustomIcons.iconRefresh,
                color: tertiaryColor,
                size: 24,
              ),
              onPressed: () {
                // Handle reset app logic
              },
              label: const Text('Reset App'),
            ),
          ),
        ],
      ),
    );
  }
}
