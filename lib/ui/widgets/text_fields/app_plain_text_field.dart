
import 'package:freeclimbers_employee/blocs/theme_bloc/theme_bloc.dart';
import 'package:freeclimbers_employee/consts/k_colors.dart';
import 'package:freeclimbers_employee/extensions/colors.dart';
import 'package:freeclimbers_employee/utils/validators.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class AppPlanTextField extends StatefulWidget {
  ///if [mandatority] is -1, don`t show this widget, if 0 - show, but set to be non-mandatory, if 1 - this field is mandatory
  final int mandatority;
  final TextCapitalization textCapitalization;
  final String title;
  final bool obscure;
  final VoidCallback? onTap;
  final bool multiline;
  final String? hint;
  final bool whiteTitle;
  final String? tagForError;
  final List<String>? currentTags;
  final TextInputType? keyboard;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? suffixWidget;
  final Widget? prefixWidget;
  final List<String>? autofillHints;
  final VoidCallback? onEditingComplete;
  final TextInputAction? textInputAction;
  final bool onlyMandatory;
  const AppPlanTextField({Key? key, required this.title, this.multiline = false, this.obscure = false, this.validator, this.suffixWidget, this.whiteTitle = true, this.prefixWidget, this.keyboard, this.mandatority = 0, this.hint, this.controller, this.tagForError, this.currentTags, this.onTap, this.textCapitalization = TextCapitalization.sentences, this.autofillHints, this.onEditingComplete, this.textInputAction, this.onlyMandatory = false}) : super(key: key);

  @override
  State<AppPlanTextField> createState() => _AppPlanTextFieldState();
}

class _AppPlanTextFieldState extends State<AppPlanTextField> {

  @override
  Widget build(BuildContext context) {
    return widget.mandatority == -1 || (widget.mandatority == 0 && widget.onlyMandatory) ? SizedBox.shrink() : Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8,),
        Text(widget.title + (widget.mandatority == 1 ? '*' : ""), style: TextStyle(color: widget.whiteTitle ? context.colors.mainPrimaryText : context.colors.fieldNormalText, fontFamily: 'OpenSans', fontWeight: FontWeight.w300)),
        SizedBox(height: 8,),
        SizedBox(
          child: Theme(
            data: ThemeData(
              fontFamily: 'OpenSans'
            ),
            child: Material(
              borderRadius: BorderRadius.circular(8),
              color: KColors.transparent,
              child: TextFormField(
                maxLines: widget.multiline ? null : 1,
                minLines: widget.multiline ? 6 : 1,
                obscuringCharacter: '*',
                onTap: widget.onTap,
                keyboardType: widget.keyboard,
                textCapitalization: widget.textCapitalization,
                onEditingComplete:
                  widget.onEditingComplete,
                textInputAction: widget.textInputAction,
                validator: (val){
                  if(widget.currentTags != null && widget.currentTags!.contains(widget.tagForError)){
                    return widget.tagForError;
                  }
                  if(widget.controller == null){
                    return null;
                  }
                  if(widget.mandatority == 0 && widget.controller!.text.isEmpty){
                    return null;
                  }
                  if(widget.mandatority == 1 && widget.validator == null){
                    return AppValidators.notEmpty(val);
                  }
                  return widget.validator?.call(val);
                },
                autofillHints: widget.autofillHints,
                cursorColor: context.colors.fieldNormalText,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: context.colors.basePrimaryBack,
                  hintText: widget.hint,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: context.colors.fieldNormalFrame),
                    borderRadius: BorderRadius.circular(8)
                  ),
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: context.colors.fieldErrorFrame),
                      borderRadius: BorderRadius.circular(8)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: context.colors.fieldActiveFrame),
                      borderRadius: BorderRadius.circular(8)
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: context.colors.fieldErrorFrame),
                      borderRadius: BorderRadius.circular(8)
                  ),
                  errorStyle: TextStyle(height: 0.01, color: KColors.transparent),
                  suffixIcon: widget.suffixWidget,
                  suffixIconColor: context.colors.fieldNormalPlaceholder,
                  prefixIcon: widget.prefixWidget,
                  prefixIconColor: context.colors.fieldNormalPlaceholder,
                  contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: widget.multiline ? 20 : 0),
                ),
                controller: widget.controller,
                obscureText: widget.obscure,
                style: TextStyle(fontSize: 16, color: context.colors.fieldNormalText, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
      ],
    );
  }

}
