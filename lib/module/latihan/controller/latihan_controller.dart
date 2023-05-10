import 'package:flutter/material.dart';
import 'package:flutter_form/state_util.dart';
import '../view/latihan_view.dart';

class LatihanController extends State<LatihanView> implements MvcController {
  static late LatihanController instance;
  late LatihanView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}