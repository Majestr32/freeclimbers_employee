import 'package:universal_io/io.dart';

import 'package:climbers/blocs/theme_bloc/theme_bloc.dart';
import 'package:climbers/extensions/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../blocs/app_cubit/app_cubit.dart';
import '../../../consts/k_colors.dart';

class AppDropdown<T> extends StatefulWidget {
  final String title;
  ///if [mandatority] is -1, don`t show this widget, if 0 - show, but set to be non-mandatory, if 1 - this field is mandatory
  final int mandatority;
  final bool onlyMandatory;
  final List<DropdownMenuItem<T?>> buttons;
  final T? value;
  final Function(T?) onChanged;
  const AppDropdown({Key? key, required this.buttons, required this.value, required this.title, this.mandatority = 0, required this.onChanged, this.onlyMandatory = false}) : super(key: key);

  @override
  State<AppDropdown<T>> createState() => _AppDropdownState<T>();
}

class _AppDropdownState<T> extends State<AppDropdown<T>> {
  @override
  Widget build(BuildContext context) {
    return widget.mandatority == -1 || (widget.mandatority == 0 && widget.onlyMandatory) ? const SizedBox.shrink() : Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8,),
        Text(widget.title + (widget.mandatority == 1 ? '*' : ""), style: TextStyle(color: context.colors?.fieldNormalText),),
        const SizedBox(height: 8,),
        Material(
          color: KColors.transparent,
          borderRadius: BorderRadius.circular(8),
          child: GestureDetector(
            onTap: () async{
              if(!Platform.isIOS){
                return;
              }
              T? value = [const DropdownMenuItem(value: null,child: Text('')),...widget.buttons].firstWhere((e) => e.value == widget.value).value;
              bool returnValue = true;
              final scrollController = FixedExtentScrollController(initialItem: [const DropdownMenuItem(value: null,child: Text('')),...widget.buttons].map((e) => e.value).toList().indexOf(widget.value));
              await showCupertinoModalPopup(
                  context: context,
                  builder: (context) => CupertinoTheme(
                    data: CupertinoThemeData(
                        brightness: context.watch<ThemeBloc>().state.brightness
                    ),
                    child: Container(
                height: 190,
                color: context.watch<ThemeBloc>().state.brightness == Brightness.light ? KColors.white : KColors.black,
                child: Column(
                    children: [
                      Container(
                        height: 180,
                        color: context.watch<ThemeBloc>().state.brightness == Brightness.light ? KColors.white : KColors.black,
                        width: MediaQuery.of(context).size.width,
                        child: Stack(
                          children: [
                            CupertinoPicker(
                              scrollController: scrollController,
                              itemExtent: 40,
                              onSelectedItemChanged: (i){
                                if(widget.mandatority == 1){
                                  value = widget.buttons[i].value;
                                }else{
                                  if(i == 0){
                                    value = null;
                                    return;
                                  }
                                  value = widget.buttons[i - 1].value;
                                }
                              },
                              children: [widget.mandatority == 0 ? const Text('') : null,...widget.buttons.map((e) => Center(child: e.child)).toList()].whereType<Widget>().toList()),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                              child: Row(children: [
                                GestureDetector(
                                    onTap: (){
                                      returnValue = false;
                                      Navigator.of(context, rootNavigator: true).pop();
                                    },
                                    child: Text('Cancel', style: TextStyle(color: KColors.red),)),
                                const Spacer(),
                                GestureDetector(
                                    onTap: (){
                                      Navigator.of(context, rootNavigator: true).pop();
                                    },
                                    child: Text('OK', style: TextStyle(color: context.colors!.mainPrimaryBack),))
                              ],),
                            ),
                          ],
                        ),
                      ),
                    ],
                ),
              ),
                  ));
              scrollController.dispose();
              if(!returnValue){
                widget.onChanged.call(widget.value);
              }else{
                widget.onChanged.call(value);
              }
            },
            child: Container(
              width: double.infinity,
              color: context.colors?.fieldNormalBack,
              child: Theme(
                data: Theme.of(context).copyWith(disabledColor: context.colors!.fieldNormalText),
                child: DropdownButtonFormField<T?>(
                  value: widget.value,
                  icon: Icon(FontAwesomeIcons.chevronDown, size: 20, color: context.colors!.fieldNormalText,),
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: context.colors!.fieldNormalText),
                  validator: (val){
                    if(val == null && widget.mandatority == 1){
                      return 'Dropdown value can`t be empty';
                    }
                    return null;
                  },
                    iconDisabledColor: context.colors!.fieldNormalText,
                  dropdownColor: context.colors!.fieldNormalBack,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: context.colors!.fieldNormalFrame ?? const Color(0xFF000000),
                            width: 1,
                          ),
                        borderRadius: BorderRadius.circular(8)
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: KColors.red,
                          width: 1,
                        ),
                          borderRadius: BorderRadius.circular(8)
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: context.colors?.fieldNormalFrame ?? const Color(0xFF000000),
                          width: 1,
                        ),
                          borderRadius: BorderRadius.circular(8)
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10)
                  ),
                  onChanged: Platform.isIOS ? null : widget.onChanged,
                  items: [const DropdownMenuItem(value: null,child: Text('')),...widget.buttons]
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
