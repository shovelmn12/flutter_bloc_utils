import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// {@template selector}
/// [BlocSelector] is used for ease of building selector classes for each bloc.
/// [BlocSelector] uses [select] from flutter_bloc to reactively get the latest state and listen to updates
///
/// this class is used as helper class for building [BuildContext] selector extension
///
/// ```dart
/// class CounterSelector extends BlocSelector<CounterBloc, int> {
///   const CounterCubit(BuildContext context) : super(context);
///
///   int get index => select();
///
///   bool get isZero => select((count) => count == 0);
/// }
/// ```
///
/// ```dart
/// class MySelectors {
///   final BuildContext _context;
///
///   const MySelectors(this._context);
///
///   CounterSelector get counter => CounterSelector(_context);
/// }
/// ```
///
/// ```dart
/// extension SelectorsExtension on BuildContext {
///   MySelectors get selectors => MySelectors(this);
/// }
/// ```
/// {@endtemplate}
class BlocSelector<C extends Cubit<S>, S> {
  final BuildContext _context;

  const BlocSelector(this._context);

  /// Selects a value from current state using selector, if no selector provided will return `state`.
  M select<M>([M Function(S) selector]) =>
      _context.select((C cubit) => selector?.call(cubit.state) ?? cubit.state);
}
