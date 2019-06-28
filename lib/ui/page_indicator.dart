import 'package:flutter/material.dart';

/// page view 指示器
class PageIndicator extends StatefulWidget {
  final int length;
  final PageController controller;

  PageIndicator(this.length, this.controller);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PageIndicationState();
  }
}

class _PageIndicationState extends State<PageIndicator> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    try {
      List<double> d = List<double>.generate(widget?.length, (int index) {
        return index.toDouble();
      });

      widget.controller.addListener(() {
        if (d.contains(widget.controller.page)) {
          setState(() {});
        }
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(widget.length, (int index) {
        return identical(widget.controller.page?.toInt() ?? 0, index)
            ? _buildIndicatorsSelected(index)
            : _buildIndicators(index);
      }),
    );
  }

  List _indicatorSelected = <Widget>[
    Container(
      width: 8,
      height: 8,
      margin: const EdgeInsets.all(2.0),
      child: Image.asset("images/main_circleindicator_located_city_s.png"),
    ),
    Container(
      width: 4,
      height: 4,
      margin: const EdgeInsets.all(2.0),
      child: Image.asset("images/main_circleindicator_city_s.png"),
    ),
  ];

  List _indicator = <Widget>[
    Container(
      width: 8,
      height: 8,
      margin: const EdgeInsets.all(2.0),
      child: Image.asset("images/main_circleindicator_located_city.png"),
    ),
    Container(
      width: 4,
      height: 4,
      margin: const EdgeInsets.all(2.0),
      child: Image.asset("images/main_circleindicator_city.png"),
    ),
  ];

  Widget _buildIndicatorsSelected(int index) {
    if (index == 0) {
      return _indicatorSelected[0];
    } else {
      return _indicatorSelected[1];
    }
  }

  Widget _buildIndicators(int index) {
    if (index == 0) {
      return _indicator[0];
    } else {
      return _indicator[1];
    }
  }
}
