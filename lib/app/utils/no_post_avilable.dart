import 'package:flutter/material.dart';

class NoPostAvilable extends StatelessWidget {
  const NoPostAvilable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.error_outline,
              size: 100,
              color: Colors.grey,
            ),
            SizedBox(height: 10),
            Text(
              'No Post Available',
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
