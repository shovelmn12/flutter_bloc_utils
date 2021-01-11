import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef void OnBlocAction<T extends Cubit<S>, S>(BuildContext context, T bloc);
