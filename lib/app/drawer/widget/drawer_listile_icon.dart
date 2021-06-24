import 'package:flutter/material.dart';

class DrawerListTileIcon extends StatelessWidget {
  
  final IconData icon;
  final String text;
  final Function()? ontap;
  final EdgeInsetsGeometry padding;


  const DrawerListTileIcon({
    Key? key,
    required this.icon,
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
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 16,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  text,
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
          onTap: ontap,
        ),
        const Divider(height: 1)
      ],
    );
  }
}
