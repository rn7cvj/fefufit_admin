import 'package:admin_page/i18n/strings.g.dart';
import 'package:admin_page/themes/app_theme.dart';
import 'package:flutter/material.dart';

class ActionsRow extends StatelessWidget {
  const ActionsRow({super.key, required this.actions});

  final List<ActionButton> actions;

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    for (int i = 0; i < actions.length; i++) {
      children.add(actions[i]);

      if (i != actions.length) {
        children.add(
          const VerticalDivider(
            width: 16,
          ),
        );
      }
    }
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: children,
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    required this.lable,
    required this.onPressed,
    required this.icon,
  });

  final String lable;
  final VoidCallback onPressed;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(context.appTheme.buttonColor),
          iconColor: MaterialStateProperty.all(context.appTheme.buttonIconColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          visualDensity: VisualDensity.comfortable),
      onPressed: onPressed,
      icon: icon,
      label: Text(lable, style: context.appTheme.buttonextStyle),
    );
  }
}
