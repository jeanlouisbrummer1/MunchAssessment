import 'package:flutter/material.dart';
import 'package:munch_flutter_assessment/models/index.dart';
import 'package:munch_flutter_assessment/styles/index.dart';

class AppInfo extends StatelessWidget {
  const AppInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
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
            width: double.infinity,
            margin: const EdgeInsets.only(
              top: 16,
              bottom: 8,
            ),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: containerColour,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Version ${AppInfoModel.instance.version}',
                  style: const TextStyle(fontSize: 12.0),
                ),
                Text(
                  AppInfoModel.instance.environment,
                  style: const TextStyle(fontSize: 12.0),
                ),
                Text(
                  'Device ID: ${AppInfoModel.instance.deviceID}',
                  style: const TextStyle(fontSize: 12.0),
                ),
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
                  vertical: 10,
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
              onPressed: () async {
                await AppInfoModel.instance.fetchAppInfo();
              },
              label: const Text('Reset App'),
            ),
          ),
        ],
      ),
    );
  }
}
