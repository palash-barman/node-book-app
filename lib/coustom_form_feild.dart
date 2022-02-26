import 'package:flutter/material.dart';

class CoustomFormField extends StatelessWidget {
  const CoustomFormField({
    Key? key,
    required TextEditingController textEditingController,
    required FocusNode focusNode,
    required TextInputType keybordtype,
    required TextInputAction inputAction,
    required String lebal,
    required String hint,
    required String initialvale,
    required TextStyle textStyle,
    required Function(String value) validator,
    required TextAlign textAlign,
    this.isObscureText = false,
    this.isCapitalizad = false,
    this.maxLine = 1,
    this.isLabelEnabled = true,
  })  : _keybordtype = keybordtype,
        _inputAction = inputAction,
        _textStyle=textStyle,
        _lebal = lebal,
        _hint = hint,
        _initialvalue=initialvale,
        _align=textAlign,
        _validator = validator,
        super(key: key);
  final TextAlign _align;
  final TextStyle _textStyle;
  final TextInputType _keybordtype;
  final TextInputAction _inputAction;
  final String _lebal;
  final String _hint;
  final Function(String value) _validator;
  final bool isObscureText;
  final bool isCapitalizad;
  final String _initialvalue;
  final int maxLine;
  final bool isLabelEnabled;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: _initialvalue,
      maxLines: maxLine,
      style: _textStyle,
      textAlign: _align,
      keyboardType: _keybordtype,
     obscureText: isObscureText,
      textCapitalization:
          isCapitalizad ? TextCapitalization.words : TextCapitalization.none,
      textInputAction: _inputAction,
      cursorColor: Colors.yellowAccent,
      validator: (value) => _validator(value!),
      decoration: InputDecoration(
          labelText: isLabelEnabled ? _lebal : null,
          labelStyle: TextStyle(color: Colors.yellowAccent),
          hintText: _hint,
          hintStyle: TextStyle(color: Colors.grey),
          errorStyle: TextStyle(
            color: Colors.redAccent,
            fontWeight: FontWeight.bold,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: Colors.amberAccent, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: Colors.blueGrey,
              )),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: Colors.redAccent,
              width: 2,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: Colors.redAccent,
                width: 2,
              ))),
    );
  }
}
