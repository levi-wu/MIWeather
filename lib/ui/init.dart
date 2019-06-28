import 'dart:async';

import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:weather/data/repository.dart';

class Init extends StatefulWidget {
  final Widget child;
  final Widget loading;

  Init({@required this.child, this.loading});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _InitState();
  }
}

class _InitState extends State<Init> {
  bool done;

  Repository _repo;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    done = false;
    _repo = new Repository()
      ..init().then((v) {
        setState(() {
          done = true;
        });
      });


  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _repo.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var child = widget.child;
    // 加载的view
    child = done
        ? child
        : widget.loading ??
            Center(
              child: new CircularProgressIndicator(),
            );

    // view
    child = Scaffold(
      body: SafeArea(
        top: false,
        child: child,
      ),
    );

    // data 传递
    return ScopedModel<Repository>(
      model: _repo,
      child: child,
    );
  }
}
