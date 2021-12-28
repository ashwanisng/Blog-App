import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoNewNotification extends StatelessWidget {
  const NoNewNotification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Icon(
            Icons.notifications_none,
            size: 100,
            color: Colors.grey,
          ),
          Text(
            'No new notifications',
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
