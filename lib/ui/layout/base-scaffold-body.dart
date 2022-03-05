import 'package:flutter/material.dart';

class BaseScaffoldBody extends StatelessWidget {
  final Widget child;
  final ScrollPhysics? physics;

  const BaseScaffoldBody({Key? key, required this.child, @required this.physics}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: LayoutBuilder(builder: (context, constraint) {
        return ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraint.maxHeight),
          child: SingleChildScrollView(
            physics: physics,
            child: IntrinsicHeight( 
              child: child,
            ),
          ),
        );
      }),
    );
  }
}
