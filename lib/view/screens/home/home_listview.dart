import 'package:avengers/const/app_const.dart';
import 'package:avengers/view/screens/character_detail/character_detail.dart';
import 'package:avengers/view/widgets/app_widget.dart';
import 'package:avengers/view_model/character_detail_vm.dart';
import 'package:avengers/view_model/home_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BodyListView extends StatefulWidget {
  final HomeProvider provider;

  const BodyListView({Key? key, required this.provider}) : super(key: key);

  @override
  State<BodyListView> createState() => _BodyListViewState();
}

class _BodyListViewState extends State<BodyListView> {
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    if (widget.provider.isLoading) {
      return AppWidget.dataLoading();
    } else if (widget.provider.list.isNotEmpty) {
      return _ListView(provider: widget.provider, scrollController: scrollController);
    } else {
      return AppWidget.onErrorText(text: "An unexpected error occurred");
    }
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent == scrollController.offset) {
        Provider.of<HomeProvider>(context, listen: false).fetchData(context: context);
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}

class _ListView extends StatelessWidget {
  final HomeProvider provider;
  final ScrollController scrollController;
  const _ListView({Key? key,required this.provider,required this.scrollController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
            itemCount: provider.list.length + 1,
            controller: scrollController,
            itemBuilder: (context, index) {
              if (index < provider.list.length) {
                return Padding(
                    padding: const EdgeInsets.fromLTRB(5, 2.5, 5, 5),
                    child: SizedBox(
                        height: AppConst.sizeHeight(context) * 0.2,
                        width: AppConst.sizeWidth(context) - 10,
                        child: GestureDetector(
                            onTap: () {
                              Provider.of<ComicProvider>(context, listen: false).resetData(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CharacterDetailView(
                                          data: provider.list[index])));
                            },
                            child: Card(
                                elevation: 10,
                                borderOnForeground: false,
                                color: Colors.grey.shade300,
                                shape: BeveledRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    side: const BorderSide(
                                        color: Colors.grey, width: 0.3)),
                                child: Row(children: [
                                  Expanded(
                                      flex: 3,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: FadeInImage(
                                          fit: BoxFit.cover,
                                          placeholder: const AssetImage('assets/images/placeholder.jpg'),
                                          image: NetworkImage(
                                              "${provider.list[index].thumbnail.path}.${provider.list[index].thumbnail.extension}"),
                                        ),
                                      )),
                                  Expanded(
                                      flex: 4,
                                      child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Text(provider.list[index].name,
                                                style: Theme.of(context).textTheme.bodyText1,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center)
                                          ]))
                                ])))));
              }
              return Card(
                color: Colors.amber.shade900,
                child: Column(
                  children: const [
                    LinearProgressIndicator(color: Colors.white),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text("Loading..",
                          style: TextStyle(fontSize: 17, color: Colors.white)),
                    )
                  ],
                ),
              );
            }),
      ],
    );
  }
}