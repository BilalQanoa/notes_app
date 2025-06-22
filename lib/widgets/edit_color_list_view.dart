import 'package:flutter/material.dart';
import 'package:todo_app/models/note_model.dart';
import 'package:todo_app/widgets/color_item.dart';

class EditColorListView extends StatefulWidget {
  NoteModel note;
  EditColorListView({super.key, required this.note});

  @override
  State<EditColorListView> createState() => _EditColorListViewState();
}

class _EditColorListViewState extends State<EditColorListView> {
  int currentIndex = 0;

  @override
  initState() {
    currentIndex = colors.indexOf(Color(widget.note.color));
  }

  List<Color> colors = [
    const Color(0xffFFCC70),
    const Color(0xffFFFADD),
    const Color(0xff8ECDDD),
    const Color(0xff22668D),
    const Color(0xffFF9B9B),
    const Color(0xffFFD6A5),
    const Color(0xffFFFEC4),
    const Color(0xffCBFFA9),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: ListView.builder(
          itemCount: colors.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: GestureDetector(
                onTap: () {
                  currentIndex = index;
                  widget.note.color = colors[index].value;
                  setState(() {});
                },
                child: ColorItem(
                  color: colors[index],
                  isActive: currentIndex == index ? true : false,
                ),
              ),
            );
          }),
    );
  }
}
