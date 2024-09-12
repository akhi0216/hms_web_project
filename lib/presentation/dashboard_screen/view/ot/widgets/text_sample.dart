import 'package:flutter/material.dart';

class TextFieldWithPopup extends StatefulWidget {
  @override
  _TextFieldWithPopupState createState() => _TextFieldWithPopupState();
}

class _TextFieldWithPopupState extends State<TextFieldWithPopup> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();

  List<String> _options = ['Dhanya', 'Dharma', 'Dheeraj', 'Dhruv', 'Dilip'];
  List<String> _filteredOptions = [];

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _showOverlay() {
    _filteredOptions = _options;
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
  }

  void _hideOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  OverlayEntry _createOverlayEntry() {
    return OverlayEntry(
      builder: (context) {
        return Positioned(
          width: MediaQuery.of(context).size.width - 32,
          child: CompositedTransformFollower(
            link: _layerLink,
            showWhenUnlinked: false,
            offset: const Offset(0.0, 40.0), // Position below the text field
            child: Material(
              elevation: 4.0,
              child: ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                children: _filteredOptions.map((String option) {
                  return ListTile(
                    leading: Icon(Icons.person),
                    title: Text(option),
                    onTap: () {
                      String currentText = _controller.text;
                      // If the current text contains a comma, keep only what's before the last comma
                      int lastCommaIndex = currentText.trim().lastIndexOf(',');
                      if (lastCommaIndex != -1) {
                        _controller.text =
                            currentText.substring(0, lastCommaIndex + 1);
                      } else {
                        _controller
                            .clear(); // If there's no comma, clear everything
                      }
                      // If the text field is not empty (i.e., previous selections), ensure the new option is added after a comma
                      if (_controller.text.isNotEmpty) {
                        if (!_controller.text.trim().endsWith(',')) {
                          _controller.text += ', ';
                        }
                        _controller.text += ' $option, ';
                      } else {
                        _controller.text += '$option, ';
                      }
                      _hideOverlay();
                    },
                  );
                }).toList(),
              ),
            ),
          ),
        );
      },
    );
  }

  void _filterOptions(String input) {
    setState(() {
      _filteredOptions = _options
          .where((option) => option
              .toLowerCase()
              .contains(input.split(',').removeLast().trim().toLowerCase()))
          .toList();
      _overlayEntry?.markNeedsBuild(); // Rebuild the overlay
    });
  }

  // TextEditingController _newcontroller = TextEditingController();
  List<String> _values = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: CompositedTransformTarget(
            link: _layerLink,
            child: TextField(
              controller: _controller,
              focusNode: _focusNode,
              decoration: InputDecoration(labelText: 'Enter name'),
              onChanged: (value) {
                setState(() {});
                print(value.trim().split(',').last.trim());

                if (value.trim().split(',').last.trim().isNotEmpty) {
                  if (_overlayEntry == null) {
                    _showOverlay();
                  }
                  _filterOptions(value);
                } else {
                  _hideOverlay();
                }
              },
              onTap: () {
                if (_controller.text.isNotEmpty &&
                    !_controller.text.trim().endsWith(',')) {
                  _showOverlay();
                }
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // TextField(
              //   controller: _newcontroller,
              //   decoration: InputDecoration(
              //       labelText: 'Enter values separated by commas'),
              // ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    // Split the input by commas and store in the list
                    _values = _controller.text
                        .split(',')
                        .map((e) => e.trim())
                        .where(
                          (element) => element.isNotEmpty,
                        )
                        .toList();
                  });
                },
                child: Text('Submit'),
              ),
              SizedBox(height: 20),
              Text('Entered Values:'),
              for (var value in _values)
                Text(value.trim()), // Trim to remove extra spaces
            ],
          ),
        ),
      ],
    );
  }
}


// splitting value from ,

  // _values = _controller.text
  //                       .split(',')
  //                       .map((e) => e.trim())
  //                       .where(
  //                         (element) => element.isNotEmpty,
  //                       )
  //                       .toList();


  // textfield

          //   CompositedTransformTarget(
          //   link: _layerLink,
          //   child: TextField(
          //     controller: _controller,
          //     focusNode: _focusNode,
          //     decoration: InputDecoration(labelText: 'Enter name'),
          //     onChanged: (value) {
          //       setState(() {});
          //       print(value.trim().split(',').last.trim());

          //       if (value.trim().split(',').last.trim().isNotEmpty) {
          //         if (_overlayEntry == null) {
          //           _showOverlay();
          //         }
          //         _filterOptions(value);
          //       } else {
          //         _hideOverlay();
          //       }
          //     },
          //     onTap: () {
          //       if (_controller.text.isNotEmpty &&
          //           !_controller.text.trim().endsWith(',')) {
          //         _showOverlay();
          //       }
          //     },
          //   ),
          // ),