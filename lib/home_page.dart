import 'package:flutter/material.dart';
import 'package:remove_listener_sample/scroll_listener.dart';

import 'just_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum Page { scrollListenerPage, justPage }

class _MyHomePageState extends State<MyHomePage> {
  Page page = Page.scrollListenerPage;
  final _controller = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ...
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            SegmentedButton(
              segments: const [
                ButtonSegment(
                    value: Page.scrollListenerPage,
                    icon: Icon(Icons.cake_outlined),
                    label: Text('scroll listener')),
                ButtonSegment(
                    value: Page.justPage,
                    icon: Icon(Icons.breakfast_dining),
                    label: Text('just page'))
              ],
              selected: {page},
              onSelectionChanged: (p0) => setState(() {
                page = p0.first;
              }),
            ),
            const SizedBox(height: 16),
            switch (page) {
              Page.scrollListenerPage => ScrollListener(
                  scrollController: _controller,
                ),
              Page.justPage => const JustPage()
            },
            Expanded(
              child: ListView.builder(
                itemCount: 30,
                controller: _controller,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("Index: $index"),
                    visualDensity: VisualDensity.comfortable,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
