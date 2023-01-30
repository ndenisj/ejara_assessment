import 'package:ejara_assessment/utils/ejara_theme.dart';
import 'package:flutter/material.dart';

class EjaraButtonOptions {
  const EjaraButtonOptions({
    this.textStyle,
    this.elevation,
    this.height,
    this.width,
    this.padding,
    this.color,
    this.disabledColor,
    this.disabledTextColor,
    this.splashColor,
    this.iconSize,
    this.iconColor,
    this.iconPadding,
    this.borderRadius,
    this.borderSide,
  });

  final TextStyle? textStyle;
  final double? elevation;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final Color? disabledColor;
  final Color? disabledTextColor;
  final Color? splashColor;
  final double? iconSize;
  final Color? iconColor;
  final EdgeInsetsGeometry? iconPadding;
  final double? borderRadius;
  final BorderSide? borderSide;
}

class EjaraButtonWidget extends StatefulWidget {
  const EjaraButtonWidget({
    Key? key,
    @required this.text,
    @required this.onPressed,
    this.icon,
    this.iconData,
    @required this.options,
    this.showLoadingIndicator = true,
  }) : super(key: key);

  final String? text;
  final Widget? icon;
  final IconData? iconData;
  final Function()? onPressed;
  final EjaraButtonOptions? options;
  final bool showLoadingIndicator;

  @override
  State<EjaraButtonWidget> createState() => _EjaraButtonWidgetState();
}

class _EjaraButtonWidgetState extends State<EjaraButtonWidget> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    var theme = EjaraTheme.of(context);
    var size = MediaQuery.of(context).size;

    Widget textWidget = loading
        ? Center(
            child: SizedBox(
              width: 23,
              height: 23,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  widget.options!.textStyle!.color ?? Colors.white,
                ),
              ),
            ),
          )
        : Text(
            widget.text!,
            style: widget.options!.textStyle ??
                theme.subtitle2.copyWith(color: Colors.white, fontSize: 16),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          );

    final onPressed = widget.showLoadingIndicator
        ? () async {
            if (loading) {
              return;
            }
            setState(() => loading = true);
            try {
              await widget.onPressed!();
            } catch (e) {
              // print('On pressed error:\n$e');
            }
            if (this.mounted) {
              setState(() => loading = false);
            }
          }
        : () => widget.onPressed!();

    if (widget.icon != null || widget.iconData != null) {
      textWidget = textWidget;
      // textWidget = Flexible(child: textWidget);
      return SizedBox(
        height: widget.options!.height ?? size.height * 0.06,
        width: widget.options!.width ?? double.infinity,
        child: ElevatedButton.icon(
          icon: Padding(
            padding: widget.options!.iconPadding ?? EdgeInsets.zero,
            child: widget.icon ??
                Icon(
                  widget.iconData,
                  size: widget.options!.iconSize,
                  color: widget.options!.iconColor ??
                      widget.options!.textStyle!.color,
                ),
          ),
          label: textWidget,
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: widget.options!.color ?? theme.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(widget.options!.borderRadius ?? 15),
              side: widget.options!.borderSide ?? BorderSide.none,
            ),
            elevation: widget.options!.elevation,
            padding: widget.options!.padding,
          ),
        ),
      );
    }

    return SizedBox(
      height: widget.options!.height ?? size.height * 0.06,
      width: widget.options!.width ?? double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: textWidget,
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.options!.color ?? theme.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(widget.options!.borderRadius ?? 15),
            side: widget.options!.borderSide ?? BorderSide.none,
          ),
          elevation: widget.options!.elevation,
          padding: widget.options!.padding,
        ),
      ),
    );
  }
}
