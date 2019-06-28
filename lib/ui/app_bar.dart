import 'package:flutter/material.dart';

const double _kLeadingWidth = kToolbarHeight;

/// app bar
class MyAppBar extends StatefulWidget {
  final Widget leading;
  final Widget tailing;
  final Widget title;
  final double elevation;
  final Color colors;

  MyAppBar(
      {this.leading, this.title, this.tailing, this.elevation, this.colors});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppBarState();
  }
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    MediaQueryData query = MediaQuery.of(context);
    ThemeData themeData = Theme.of(context);
    TextTheme appBarText = themeData.appBarTheme.textTheme;
    TextStyle textStyle =
        appBarText?.title ?? themeData.primaryTextTheme.subhead;

    Widget leading = widget.leading;
    if (leading != null) {
      leading = leading = ConstrainedBox(
        constraints: const BoxConstraints.tightFor(width: _kLeadingWidth),
        child: leading,
      );
    }

    Widget tailing = widget.tailing;
    if (tailing != null) {
      tailing = ConstrainedBox(
        constraints: const BoxConstraints.tightFor(width: _kLeadingWidth),
        child: tailing,
      );
    }
    Widget title = widget.title;
    if (title != null) {
      title = Expanded(
        child: DefaultTextStyle(style: textStyle, child: title),
      );
    }
    // child
    List<Widget> child = <Widget>[leading, title, tailing];

    Widget appbar = Container(
        color: widget.colors ?? Colors.transparent,
        constraints: BoxConstraints(
            minHeight: _kLeadingWidth,
            maxHeight: query.padding.top + _kLeadingWidth),
        child: SafeArea(
          top: true,
          child: Row(
            children: child,
          ),
        ));

    double elevation = widget.elevation;

    if (elevation != null) {
      appbar = Material(
        elevation: elevation,
        child: appbar,
      );
    }

    return appbar;
  }
}
