import 'package:flutter/material.dart';
import 'package:flutter_draggable_gridview/flutter_draggable_gridview.dart';

class ScreenTestPage extends StatefulWidget {
  
  final Function() fun;
  ScreenTestPage({Key? key, required this.fun}) : super(key: key);

  @override
  State<ScreenTestPage> createState() => _ScreenTestPageState();
}

class _ScreenTestPageState extends State<ScreenTestPage> {
  List<int> listInt = List.generate(12, (index) => index + 1);
  @override
  void initState() {
    listInt.shuffle();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _listOfDraggableGridItem = List.generate(12, (e) => DraggableGridItem(isDraggable: true, child: dragableContainer(key: Key(listInt[e].toString()))));
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),
      body: DraggableGridViewBuilder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          crossAxisCount: 3,
          childAspectRatio: 3 / 4.1,
        ),
        children: _listOfDraggableGridItem,
        isOnlyLongPress: true,
        dragCompletion: (List<DraggableGridItem> list, int beforeIndex, int afterIndex) {
          print('onDragAccept: $beforeIndex -> $afterIndex');
          for (int i = 0; i < list.length; i++) {
            listInt[i] = int.parse(list[i].child.key.toString().substring(3, list[i].child.key.toString().length - 3));
          }
          bool forward = true;
          int counter = 0;
          do {
            if (listInt[counter + 1] != listInt[counter] + 1) forward = false;
            counter++;
            // print("Counter a $counter");
          } while (forward && counter < listInt.length - 1);
          // print("*************************${listInt}");
          if (forward) {
            widget.fun();
            Navigator.pop(context);
          }
        },
        dragFeedback: (List<DraggableGridItem> list, int index) {
          return Container(
            width: 200,
            height: 150,
            color: Colors.black,
            child: list[index].child,
          );
        },
        addSemanticIndexes: true,
        addAutomaticKeepAlives: true,
        dragPlaceHolder: (List<DraggableGridItem> list, int index) {
          return PlaceHolderWidget(
            child: Container(
              color: Colors.blue,
            ),
          );
        },
      ),
    );
  }
}

class dragableContainer extends StatelessWidget {
  const dragableContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      decoration: const BoxDecoration(color: Color.fromARGB(255, 88, 54, 54)),
      // height: MediaQuery.of(context).size.height / 3,
      // width: MediaQuery.of(context).size.width / 3,
      child: Center(
        child: Text(
          key.toString().substring(3, key.toString().length - 3),
          style: const TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
