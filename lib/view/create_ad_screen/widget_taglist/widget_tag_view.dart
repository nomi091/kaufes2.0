import 'package:flutter/material.dart';

import '../../../model/tags_model.dart';

class WidgetTagView extends StatefulWidget {
  final TagModel tagObject;

  const WidgetTagView({Key? key, required this.tagObject}) : super(key: key);

  @override
  _WidgetTagViewState createState() => _WidgetTagViewState();
}

class _WidgetTagViewState extends State<WidgetTagView> {
  String? selectedSubTag;

  @override
  Widget build(BuildContext context) {
    String displayedTagName = selectedSubTag ?? widget.tagObject.name;

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            children: [
              Expanded(
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: selectedSubTag,
                    hint: Text(displayedTagName),
                    isExpanded: true,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedSubTag = newValue;
                        widget.tagObject.isSelected = true; // Set the tag as selected
                      });
                    },
                    items: widget.tagObject.subTags.map((subTag) {
                      return DropdownMenuItem<String>(
                        value: subTag,
                        child: Text(subTag),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
