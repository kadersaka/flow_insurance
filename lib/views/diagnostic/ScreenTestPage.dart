import 'package:flutter/material.dart';
import 'package:flutter_reorderable_grid_view/entities/order_update_entity.dart';
import 'package:flutter_reorderable_grid_view/widgets/reorderable_builder.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ScreenTestPage extends StatefulWidget {
  const ScreenTestPage({Key? key}) : super(key: key);

  @override
  State<ScreenTestPage> createState() => _ScreenTestPageState();
}

class _ScreenTestPageState extends State<ScreenTestPage> {
  List<int> children = List.generate(12, (index) => index + 1);
  // var _scrollController = ScrollController();
  final _gridViewKey = GlobalKey();
  @override
  void initState() {
    children.shuffle();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void _handleDragStarted() {
      ScaffoldMessenger.of(context).clearSnackBars();
      const snackBar = SnackBar(
        content: Text('Dragging has started!'),
        duration: Duration(milliseconds: 1000),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    void _handleDragEnd() {
      ScaffoldMessenger.of(context).clearSnackBars();
      const snackBar = SnackBar(
        content: Text('Dragging was finished!'),
        duration: Duration(milliseconds: 1000),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      if(children == [1,2,3,4,5,6,7,8,9,10,11,12]){
        Fluttertoast.showToast(
            msg: "Vous avez réussi le test avec succès !!!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
      }

    }

    void _handleReorder(List<OrderUpdateEntity> onReorderList) {
      for (final reorder in onReorderList) {
        final child = children.removeAt(reorder.oldIndex);
        children.insert(reorder.newIndex, child);
      }
      setState(() {
      });
    }

    Widget _getReorderableWidget() {

      final generatedChildren = List<Widget>.generate(
        children.length,
        (index) => Container(
          key: Key(index.toString()),
          decoration:
              const BoxDecoration(color: Color.fromARGB(255, 88, 54, 54)),
          // height: MediaQuery.of(context).size.height / 3,
          // width: MediaQuery.of(context).size.width / 3,
          child: Center(
            child: Text(
              '${children[index]}',
              style: const TextStyle(fontSize: 30),
            ),
          ),
        ),
      );

      return ReorderableBuilder(
        onReorder: _handleReorder,
        onDragStarted: _handleDragStarted,
        onDragEnd: _handleDragEnd,
        // scrollController: _scrollController,
        builder: (children) {
          return GridView.builder(
            key: _gridViewKey,
            // controller: _scrollController,
            itemCount: children.length,
            itemBuilder: (context, index) {
              return children[index];
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              crossAxisCount: 3,
              childAspectRatio: 3 / 4.25,
            ),
          );
        },
        children: generatedChildren,
      );
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white70,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Expanded(child: _getReorderableWidget()),
        ),
      ),
    );
  }
}
