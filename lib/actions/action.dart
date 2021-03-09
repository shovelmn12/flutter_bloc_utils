import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_utils/actions/actions.dart';

/// {@template action}
/// [BlocAction] exposes initState, dispose and didChangeDependencies to perform actions on a bloc.
///
/// examples:
///
/// resets the counter on initState
/// ```dart
/// class CounterResetAction extends BlocAction<CounterCubit, int> {
///   const CounterResetAction({Key key, Widget child}) : super(
///                                     key: key,
///                                     onInitState: (context, bloc) => bloc.reset(),
///                                     child: child,
///                                   );
/// }
/// ```
///
/// load data on initState
/// ```dart
/// class LoadDataAction extends BlocAction<DataProviderCubit, SomeDataType> {
///   const LoadDataAction({Key key, Widget child}) : super(
///                                     key: key,
///                                     onInitState: (context, bloc) => bloc.load(),
///                                     child: child,
///                                   );
/// }
/// ```
/// {@endtemplate}
class BlocAction<C extends Cubit<S>, S> extends StatefulWidget {
  /// The widget below this widget in the tree.
  final Widget child;

  /// Called when [initState] is called to perform actions on the bloc
  final BlocActionCallback<C, S>? onInitState;

  /// Called when [dispose] is called to perform actions on the bloc
  final BlocActionCallback<C, S>? onDispose;

  /// Called when [didChangeDependencies] is called to perform actions on the bloc
  final BlocActionCallback<C, S>? onChangeDependencies;

  const BlocAction({
    Key? key,
    required this.child,
    this.onInitState,
    this.onDispose,
    this.onChangeDependencies,
  }) : super(key: key);

  @override
  BlocActionState<C, S> createState() => BlocActionState<C, S>();
}

class BlocActionState<C extends Cubit<S>, S> extends State<BlocAction<C, S>> {
  late C _bloc;

  @override
  void initState() {
    _bloc = context.read<C>();

    widget.onInitState?.call(context, _bloc);

    super.initState();
  }

  @override
  void didChangeDependencies() {
    _bloc = context.read<C>();

    widget.onChangeDependencies?.call(context, _bloc);

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    widget.onDispose?.call(context, _bloc);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
