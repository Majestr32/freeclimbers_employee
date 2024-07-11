import 'package:app_links/app_links.dart';
import 'package:climbers/blocs/app_cubit/app_cubit.dart';
import 'package:climbers/blocs/member_cubit/member_cubit.dart';
import 'package:climbers/blocs/servers_bloc/servers_bloc.dart';
import 'package:climbers/extensions/colors.dart';
import 'package:climbers/router.dart';
import 'package:climbers/ui/sheets/scan_branch/scan_branch.dart';
import 'package:climbers/ui/widgets/buttons/app_elevated_button.dart';
import 'package:climbers/ui/widgets/buttons/app_text_button.dart';
import 'package:climbers/ui/widgets/buttons/app_outlined_button.dart';
import 'package:climbers/ui/widgets/connectivity_badge/connectivity_badge.dart';
import 'package:climbers/utils/toasts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../../blocs/branches_cubit/branches_cubit.dart';
import '../../../consts/k_colors.dart';
import '../../../consts/k_icons.dart';
import '../../widgets/auth/bg.dart';
import '../../widgets/text_fields/app_plain_text_field.dart';

class CreateServerScreen extends StatefulWidget {
  const CreateServerScreen({Key? key}) : super(key: key);

  @override
  State<CreateServerScreen> createState() => _CreateServerScreenState();
}

class _CreateServerScreenState extends State<CreateServerScreen> {
  final _serverURLController = TextEditingController();
  final _nameController = TextEditingController();

  String _currentErrorTag = '';

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _serverURLController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: BlocListener<BranchesCubit, BranchesState>(
        listener: (context, state) {
          if (context.read<BranchesCubit>().state.status ==
              BranchesStateStatus.loaded) {
            context.loaderOverlay.hide();
            router.go(RouteNames.home, extra: 3);
          }
        },
        child: CupertinoPageScaffold(
            backgroundColor: context.colors.basePrimaryBack,
            child: ConnectivityBadge(
              child: Stack(
                children: [
                  BlocListener<MemberCubit, MemberState>(
                    listener: (context, state) {
                      if (state.status == MemberStateStatus.error) {
                        context.loaderOverlay.hide();
                        if (state.error!.localizationCode == 'timeout') {
                          return;
                        }
                        setState(() {
                          _currentErrorTag = 'error';
                        });
                        Future.delayed(Duration(milliseconds: 100)).then((_) {
                          _formKey.currentState!.validate();
                        });
                      }
                    },
                    child: Form(
                      key: _formKey,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.06),
                        child: AutofillGroup(
                          onDisposeAction: AutofillContextAction.commit,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Spacer(flex: 2),
                              Image.asset(
                                'assets/images/logo.png',
                                width: 100,
                                height: 100,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                AppLocalizations.of(context)!.add_server,
                                style: TextStyle(
                                    color: context.colors.fieldNormalText,
                                    fontSize: 32,
                                    fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              AppPlanTextField(
                                  title:
                                      AppLocalizations.of(context)!.server_url,
                                  tagForError: 'error',
                                  currentTags: [_currentErrorTag],
                                  keyboard: TextInputType.emailAddress,
                                  prefixWidget: Icon(
                                    FontAwesomeIcons.server,
                                    color: context.colors.fieldNormalText,
                                    size: 20,
                                  ),
                                  controller: _serverURLController,
                                  whiteTitle: false,
                                  textInputAction: TextInputAction.next,
                                  textCapitalization: TextCapitalization.none,
                                  suffixWidget: GestureDetector(
                                      onTap: () {
                                        openScanBranch(context);
                                      },
                                      child: Icon(
                                        FontAwesomeIcons.camera,
                                        color: context.colors.fieldNormalText,
                                        size: 20,
                                      )),
                                  mandatority: 0),
                              const SizedBox(
                                height: 3,
                              ),
                              AppPlanTextField(
                                title: AppLocalizations.of(context)!.name,
                                controller: _nameController,
                                prefixWidget: Icon(
                                  FontAwesomeIcons.hashtag,
                                  color: context.colors.fieldNormalText,
                                  size: 20,
                                ),
                                textCapitalization: TextCapitalization.none,
                                mandatority: 0,
                                whiteTitle: false,
                              ),
                              const SizedBox(
                                height: 32,
                              ),
                              AppElevatedButton(
                                title: AppLocalizations.of(context)!.save,
                                onPressed: () async {
                                  if (_serverURLController.text.isEmpty) {
                                    AppToast.instance.showError(
                                        context,
                                        AppLocalizations.of(context)!
                                            .serverURL_empty_error);
                                    setState(() {
                                      _currentErrorTag = 'error';
                                    });
                                    Future.delayed(
                                            const Duration(milliseconds: 100))
                                        .then((_) {
                                      _formKey.currentState!.validate();
                                    });
                                    return;
                                  }
                                  context.read<ServersBloc>().add(
                                      ServersEvent.addServer(
                                          serverURL: _serverURLController.text,
                                          name: _nameController.text.isEmpty
                                              ? null
                                              : _nameController.text));
                                  context.go(RouteNames.signInEmail);
                                  //TextInput.finishAutofillContext();
                                  //context.loaderOverlay.show();
                                  //context.read<MemberCubit>().signIn(email: _emailController.text, password: _passwordController.text);
                                },
                                expanded: true,
                              ),
                              SizedBox(
                                height: 32,
                              ),
                              AppOutlinedButton(
                                title: AppLocalizations.of(context)!.back,
                                onPressed: () async {
                                  context.go(RouteNames.signInEmail);
                                },
                                expanded: true,
                              ),
                              const Spacer(
                                flex: 2,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
