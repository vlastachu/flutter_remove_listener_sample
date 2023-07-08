import 'package:flutter/material.dart';

class ScrollListener extends StatefulWidget {
  final ScrollController scrollController;
  const ScrollListener({super.key, required this.scrollController});

  @override
  State<ScrollListener> createState() => _ScrollListenerState();
}

class _ScrollListenerState extends State<ScrollListener> {
  int offset = 0;

  @override
  void initState() {
    widget.scrollController.addListener(() {
      offset = widget.scrollController.offset.round();
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      'offset: $offset',
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}
