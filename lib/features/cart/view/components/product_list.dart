import 'package:flutter/material.dart';
import 'package:minishop/common/theme/display_transformation.dart';
import 'package:minishop/common/theme/icons.dart';
import 'package:minishop/features/cart/domain/entitis/cart_product_entity.dart';
import 'package:minishop/common/context_extention.dart';
import 'package:minishop/features/cart/view/bloc/cart_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductList extends StatelessWidget {
  const ProductList(this.products, {Key? key}) : super(key: key);

  final List<CartProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: _ProductCartItem(products[index]),
        );
      },
    );
  }
}

class _ProductCartItem extends StatelessWidget {
  const _ProductCartItem(this.product, {Key? key}) : super(key: key);

  final CartProductEntity product;

  Widget _iconButton(BuildContext context, IconData icon) {
    return SizedBox(
      width: 26,
      height: 26,
      child: Icon(
        icon,
        size: 15,
        color: context.theme.cardColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            width: 88,
            height: 88,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: context.theme.cartImageColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.network(
              product.images,
            )),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  style: TextStyle(
                      color: context.theme.cardColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '\$${ViewFormat.formatCostDisplay(product.cost)}',
                  style: TextStyle(
                      color: context.theme.accentColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: 26,
          decoration: BoxDecoration(
              color: context.theme.actionCardColor,
              borderRadius: BorderRadius.circular(26)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () => context
                    .read<CartBloc>()
                    .add(DecreaseCount(product.id, decCount: 1)),
                child: _iconButton(context, Icons.remove),
              ),
              Text(
                product.count.toString(),
                style: TextStyle(
                    color: context.theme.cardColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              InkWell(
                onTap: () => context
                    .read<CartBloc>()
                    .add(IncreaseCount(product.id, incCount: 1)),
                child: _iconButton(context, Icons.add),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: IconButton(
              onPressed: () =>
                  context.read<CartBloc>().add(RemoveProduct(product.id)),
              icon: Icon(
                UIIcon.trash,
                size: 16,
                color: context.theme.trashColor,
              )),
        )
      ],
    );
  }
}
