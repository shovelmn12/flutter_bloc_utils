import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef BlocActionCallback<T extends Cubit<S>, S> = void Function<T, S>(
    BuildContext, T);
