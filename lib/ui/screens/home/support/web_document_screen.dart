
import 'dart:typed_data';

import 'package:freeclimbers_employee/extensions/colors.dart';
import 'package:freeclimbers_employee/router.dart';
import 'package:freeclimbers_employee/ui/widgets/branch_image/branch_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../blocs/app_cubit/app_cubit.dart';
import '../../../../consts/k_colors.dart';
import '../../../../consts/web_documents_enums.dart';
import '../../../widgets/nav/app_navbar.dart';

class WebDocumentScreen extends StatelessWidget {
  final String locale;
  final String route;
  final String? content;
  final String? title;
  final bool fromRequest;
  final Uint8List? overrideBranch;
  const WebDocumentScreen({Key? key, required this.locale, required this.route, this.fromRequest = false, this.content, this.title, this.overrideBranch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: context.colors.basePrimaryBack,
        navigationBar: AppNavbar(title: title ?? WebDocumentRoutes.fromString(route).getLocalizedDocumentName(context),
          onPrefixWidgetTap: (){
            context.pop();
          },
          prefixWidget: Container(
          color: KColors.transparent,
          child: Icon(FontAwesomeIcons.chevronLeft, color: context.colors.mainPrimaryText, size: 24,),
        ),
          suffixWidget: BranchImage(branchImage: overrideBranch, isEmptyBranchIsLogo: true,)),
        child: fromRequest ? _FromHtmlContent(content: content!,) : _FromUrl(initialUrl: 'https://www.freeclimber.app/$locale/$route') );
  }
}

class _FromHtmlContent extends StatefulWidget {
  final String content;
  const _FromHtmlContent({Key? key, required this.content}) : super(key: key);

  @override
  State<_FromHtmlContent> createState() => _FromHtmlContentState();
}
class _FromHtmlContentState extends State<_FromHtmlContent> {
  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(child: _fromHtml(widget.content));
  }

  Widget _fromHtml(String text){
    final textParts = text.split(RegExp(r'</?strong>'));
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(bottom: 70, top: 20, right: 20, left: 20),
        child: Text.rich(
          TextSpan(
            style: TextStyle(color: context.colors.basePrimaryText),
            children: textParts.asMap().entries.map((e) => e.key % 2 == 1 ? TextSpan(text: e.value,style: TextStyle(fontWeight: FontWeight.bold)) : TextSpan(text: e.value)).toList()
          )
        ),
      ),
    );
  }
}


class _FromUrl extends StatelessWidget {
  final String initialUrl;
  const _FromUrl({required this.initialUrl,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: initialUrl,
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}


