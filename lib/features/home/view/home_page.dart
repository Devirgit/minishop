import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minishop/common/context_extention.dart';
import 'package:minishop/common/theme/icons.dart';
import 'package:minishop/core/di/di.dart';
import 'package:minishop/features/home/domain/entitis/best_product_entity.dart';
import 'package:minishop/features/home/domain/entitis/hot_product_entity.dart';
import 'package:minishop/features/home/view/bloc/catalog_bloc.dart';
import 'package:minishop/features/home/view/components/components.dart';
import 'package:go_router/go_router.dart';
import 'package:minishop/features/home/view/forms/filter_form.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CatalogBloc(Di.get())..add(CatalogLoad()),
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                UIIcon.location,
                size: 15,
                color: context.theme.accentColor,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10, top: 5),
                child: Text(
                  'Zihuatanejo, Gro',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                ),
              ),
              Icon(
                Icons.expand_more_outlined,
                color: context.theme.iconCategoryColor,
                size: 15,
              )
            ],
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () => Forms.show(context),
                icon: Icon(
                  UIIcon.filter,
                  size: 15,
                  color: context.theme.fontColor,
                ))
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ListView(children: [
                //select category
                HeaderBlock(
                    actionTitle: context.loc.viewAll,
                    header: context.loc.selectCategory),
                const Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 20),
                  child: CategoryList(),
                ),
                // search
                const SizedBox(
                  height: 10,
                ),
                const SearchBar(),
                const SizedBox(
                  height: 20,
                ),
                //hot sale
                HeaderBlock(
                    actionTitle: context.loc.seeMore,
                    header: context.loc.hotSales),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: SizedBox(
                    height: 180,
                    child: BlocBuilder<CatalogBloc, CatalogState>(
                      buildWhen: (previous, current) =>
                          previous.favoritProduct?.hotSalesProduct !=
                              current.favoritProduct?.hotSalesProduct &&
                          current.favoritProduct != null,
                      builder: (context, state) {
                        switch (state.status) {
                          case CatalogStatus.loading:
                            return const Center(
                                child: CircularProgressIndicator());
                          case CatalogStatus.success:
                            return _HotSalesProduct(
                                state.favoritProduct?.hotSalesProduct ?? []);
                          default:
                            return Center(
                              child: Text(
                                context.loc.emptyData,
                                style:
                                    TextStyle(color: context.theme.cardColor),
                              ),
                            );
                        }
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                //catalog
                HeaderBlock(
                    actionTitle: context.loc.seeMore,
                    header: context.loc.bestSeller),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: BlocBuilder<CatalogBloc, CatalogState>(
                    buildWhen: (previous, current) =>
                        previous.favoritProduct?.bestSellerProduct !=
                            current.favoritProduct?.bestSellerProduct &&
                        current.favoritProduct != null,
                    builder: (context, state) {
                      switch (state.status) {
                        case CatalogStatus.loading:
                          return const Center(
                              child: CircularProgressIndicator());
                        case CatalogStatus.success:
                          return _GridBestProduct(
                              state.favoritProduct?.bestSellerProduct ?? []);
                        default:
                          return Center(
                            child: Text(
                              context.loc.emptyData,
                              style: TextStyle(color: context.theme.cardColor),
                            ),
                          );
                      }
                    },
                  ),
                )
              ]),
            ),
            const BottomBar(),
          ],
        ),
      ),
    );
  }
}

class _GridBestProduct extends StatelessWidget {
  const _GridBestProduct(this.bestProducts, {Key? key}) : super(key: key);

  final List<BestProductEntity> bestProducts;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: bestProducts.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 0,
        crossAxisSpacing: 0,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (context, index) {
        return InkWell(
          child: BestProductItem(bestProducts[index]),
          onTap: () => context.go('/product?id=${bestProducts[index].id}'),
        );
      },
    );
  }
}

class _HotSalesProduct extends StatelessWidget {
  const _HotSalesProduct(this.hotProducts, {Key? key}) : super(key: key);

  final List<HotProductEntity> hotProducts;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: hotProducts.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return HotSalesBaner(hotProducts[index]);
      },
    );
  }
}
