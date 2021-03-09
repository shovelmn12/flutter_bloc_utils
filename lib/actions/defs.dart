import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef BlocActionCallback<C extends Cubit<S>, S> = void Function(
    BuildContext context, C bloc);
