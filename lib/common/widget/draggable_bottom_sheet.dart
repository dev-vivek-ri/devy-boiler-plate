import 'package:flutter/material.dart';

class CustomDraggableSheet extends StatefulWidget {
  const CustomDraggableSheet(
      {super.key, required this.children, this.title = "", this.bodyChildren});
  final List<Widget> children;
  final List<Widget>? bodyChildren;
  final String title;

  @override
  State<CustomDraggableSheet> createState() => CustomDraggableSheetState();
}

class CustomDraggableSheetState extends State<CustomDraggableSheet> {
  final _sheet = GlobalKey();
  final _controller = DraggableScrollableController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(children: widget.bodyChildren ?? []),
        ),
        DraggableScrollableSheet(
          key: _sheet,
          shouldCloseOnMinExtent: false,
          initialChildSize: 0.5,
          maxChildSize: 1,
          minChildSize: 0.25,
          expand: true,
          snap: true,
          snapSizes: const [0.5],
          controller: _controller,
          builder: (BuildContext context, ScrollController scrollController) {
            return DecoratedBox(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: CustomScrollView(
                controller: scrollController,
                slivers: [
                  SliverToBoxAdapter(
                    child: Text(widget.title),
                  ),
                  SliverList.list(
                    children: widget.children,
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
