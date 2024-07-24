import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrderPage extends ConsumerStatefulWidget {
  final String details;
  const OrderPage({super.key, required this.details});

  @override
  ConsumerState createState() => _OrderPageState();
}

class _OrderPageState extends ConsumerState<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
