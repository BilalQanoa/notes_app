import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:todo_app/cubits/add_note_cubit/add_note_state.dart';
import 'package:todo_app/models/note_model.dart';
import 'package:todo_app/widgets/color_list_view.dart';
import 'package:todo_app/widgets/custom_button.dart';
import 'package:todo_app/widgets/custom_text_field.dart';

class AddFormButtomSheet extends StatefulWidget {
  const AddFormButtomSheet({
    super.key,
  });

  @override
  State<AddFormButtomSheet> createState() => _AddFormButtomSheetState();
}

class _AddFormButtomSheetState extends State<AddFormButtomSheet> {
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          CustomTextField(
            hint: 'Title',
            onSaved: (data) {
              title = data;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            onSaved: (data) {
              subTitle = data;
            },
            hint: 'content',
            maxLines: 5,
          ),
          const SizedBox(
            height: 32,
          ),
          const ColorListView(),
          const SizedBox(
            height: 32,
          ),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) => CustomButton(
              isLoading: state is AddNoteLoading,
              onTap: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  var cuurentDate = DateTime.now();
                  String formattedDate =
                      DateFormat('MMM d, yyyy').format(cuurentDate);
                  // String date = '${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}';
                  var noteModel = NoteModel(
                      title: title!,
                      subTitle: subTitle!,
                      date: formattedDate,
                      color: Colors.blue.value);
                  BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
