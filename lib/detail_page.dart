import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:named_route_app/bloc/product_bloc.dart';

class DetailParams {
  final String title;
  DetailParams(this.title);
}

class DetailPage extends StatelessWidget {
  final DetailParams params;
  const DetailPage({super.key, required this.params});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(params.title),
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoaded) {
            return Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(state.product.id),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(state.product.name),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(state.product.price.toString())
                  ]),
            );
          }
          return Container();
        },
      ),
    );
  }
}
