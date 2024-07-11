import 'package:climbers/consts/k_colors.dart';
import 'package:climbers/extensions/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/app_cubit/app_cubit.dart';

class Bg extends StatefulWidget {
  final bool withBlue;
  final Alignment? alignment;
  const Bg({Key? key, this.withBlue = false, this.alignment}) : super(key: key);

  @override
  State<Bg> createState() => _BgState();
}

class _BgState extends State<Bg> {


  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    return Stack(
      children: [
        SizedBox(
            width: double.infinity, height: double.infinity,
          child: Image.asset('assets/images/bg2.jpg', fit: BoxFit.cover, alignment: Alignment(0,bottomInset > 0 ? -1 : 0),)),
        widget.withBlue ? Container(width: double.infinity, height: double.infinity, color: context.colors!.mainPrimaryBack.withOpacity(0.8)) : SizedBox.shrink()
      ],
    );
  }
}
