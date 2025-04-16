import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixelfield/features/collection/domain/model/collection_model.dart';
import 'package:pixelfield/features/collection/domain/use_cases/collections_use_cases.dart';
import 'package:pixelfield/features/collection/presentation/bloc/collection_bloc.dart';
import 'package:pixelfield/features/collection/presentation/component/collection_item.dart';
import 'package:pixelfield/utils/dimension/dimension_utils.dart';
import 'package:pixelfield/utils/images/images_utils.dart';
import 'package:pixelfield/utils/injection/dependency_injection.dart';

class CollectionHomeScreen extends StatelessWidget {
  const CollectionHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CollectionBloc(
        collectionsUseCase: sl<CollectionsUseCase>(),
      )..add(OnGettingCollectionListEvent(withLoading: true)),
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              "My Collection",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            leadingWidth: 0,
            actions: [
              Padding(
                  padding: const EdgeInsetsDirectional.only(end: 9),
                  child: Image.asset(ImagesUtils.notificationIcon))
            ],
          ),
          body: BlocConsumer<CollectionBloc, CollectionState>(
            listener: (context, state) {
              if (state is SuccessGetCollectionsState) {
                state.collectionListModel;
              }
            },
            builder: (context, state) {
              if (state is LoadingGetCollectionsState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is EmptyGetCollectionsState) {
                return const Center(
                  child: Text("Cannot fetch data"),
                );
              } else if (state is SuccessGetCollectionsState) {
                return GridView.builder(
                    padding: EdgeInsetsDirectional.all(
                        DimensionUtils.kHorizontalPadding),
                    itemCount: state.collectionListModel.collections?.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 6.0,
                            crossAxisSpacing: 6.0,
                            childAspectRatio: 0.54),
                    itemBuilder: (context, index) => CollectionItemView(
                          collection:
                              state.collectionListModel.collections?[index] ??
                                  Collection(),
                        ));
              } else if (state is NoInternetConnectionState) {
                return  Center(child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("No Internet Connection"),
                    const SizedBox(height:
                      12,),
                    IconButton(onPressed: (){
                      context.read<CollectionBloc>().add(OnGettingCollectionListEvent());
                    }, icon: const Icon(Icons.refresh_rounded,size: 26,))
                  ],
                ));
              } else {
                return const Text("Unknown Error¬");
              }
            },
          )),
    );
  }
}
