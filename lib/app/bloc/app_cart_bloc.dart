import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'app_cart_event.dart';
part 'app_cart_state.dart';

class AppCartBloc extends Bloc<AppCartEvent, AppCartState> {
  AppCartBloc() : super(const AppCartState()) {
    on<AddToCart>((event, emit) {
      emit(AppCartState(countProductCart: state.countProductCart + 1));
    });
  }
}
