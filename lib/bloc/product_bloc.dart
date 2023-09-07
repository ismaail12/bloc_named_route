import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:named_route_app/detail_page.dart';
import 'package:named_route_app/injector_container.dart';
import 'package:named_route_app/navigator_service.dart';

import '../product_model.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<GetProductEvent>(_onGetProductEvent);
  }

  FutureOr<void> _onGetProductEvent(
      GetProductEvent event, Emitter<ProductState> emit) async {
    emit(ProductLoading());
    final product = await fetchProduct();
    emit(ProductLoaded(product));

    //Navigasi dari bloc
    getIt<NavigatorService>()
        .navigateTo('/detail', arguments: DetailParams(product.name));
  }
}

Future<Product> fetchProduct() async {
  await Future.delayed(const Duration(seconds: 3));
  return Product(id: '1', name: 'ASUS V24HGE', price: 1800000);
}
