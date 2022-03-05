import 'package:flutter/material.dart';

class SignOutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => AlertDialog(
        title: Text('Are you sure you want to sign out'),
        actionsAlignment: MainAxisAlignment.spaceEvenly,
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context), child: Text('No')),
          TextButton(onPressed: () {}, child: Text('Yes'))
        ],
      );
}
