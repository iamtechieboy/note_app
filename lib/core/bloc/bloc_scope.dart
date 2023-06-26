import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/interesting_idea/presentation/bloc/add_interesting_idea_cubit.dart';
import '../../features/widgets/bloc/bottom_sheet_cubit.dart';

class BlocScope extends StatefulWidget {
  const BlocScope({
    Key? key,
    this.child,
  }) : super(key: key);

  final Widget? child;

  @override
  State<BlocScope> createState() => _BlocScopeState();
}

class _BlocScopeState extends State<BlocScope> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AddInterestingIdeaCubit>(
            create: (_) => AddInterestingIdeaCubit()),
        BlocProvider<BottomSheetCubit>(
            create: (_) => BottomSheetCubit()),
      ],
      child: widget.child!,
    );
  }
}
