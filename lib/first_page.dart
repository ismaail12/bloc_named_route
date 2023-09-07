// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:named_route_app/bloc/product_bloc.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('First Page')),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          return Center(
            child: ElevatedButton(
              onPressed: () {
                if (state is! ProductLoading) {
                  context.read<ProductBloc>().add(GetProductEvent());
                }
              },
              child: state is ProductLoading
                  ? const Text('Loading..')
                  : const Text('Submit'),
            ),
          );
        },
      ),
    );
  }
}
