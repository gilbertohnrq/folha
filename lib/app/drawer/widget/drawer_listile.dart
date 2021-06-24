import 'package:flutter/material.dart';

class DrawerListTile extends StatelessWidget {
  final String text;
  final Function()? ontap;
  final EdgeInsetsGeometry padding;

  const DrawerListTile({
    Key? key,
    required this.text,
    this.ontap,
    required this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Padding(
            padding: padding,
            child: Text(
              text,
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
          onTap: ontap,
        ),
        const Divider(height: 1)
      ],
    );
  }
}
