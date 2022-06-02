import 'package:avengers/const/app_const.dart';
import 'package:avengers/view/screens/character_detail.dart';
import 'package:avengers/view/widgets/app_widget.dart';
import 'package:avengers/view_model/home_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BodyListView extends StatefulWidget {
  final HomeProvider provider;
  const BodyListView({Key? key,required this.provider}) : super(key: key);

  @override
  State<BodyListView> createState() => _BodyListViewState();
}

class _BodyListViewState extends State<BodyListView> {
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    if(widget.provider.isLoading){
      return AppWidget.dataLoading();
    }else if(widget.provider.list.isNotEmpty){
      return _listView(widget.provider);
    }else{
      return AppWidget.onErrorText(text: "An unexpected error occurred");
    }
  }

  Stack _listView(HomeProvider provider){
    return Stack(
      children: [
        ListView.builder(
            itemCount: widget.provider.list.length + 1,
            controller: scrollController,
            itemBuilder: (context, index){
              if(index < widget.provider.list.length){
                return Padding(
                    padding: const EdgeInsets.fromLTRB(5,2.5,5,5),
                    child: SizedBox(
                        height: AppConst.sizeHeight(context)*0.2,
                        width: AppConst.sizeWidth(context)-10,
                        child: GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => CharacterDetailView(data: widget.provider.list[index])));
                            },
                            child: Card(
                                elevation: 10,
                                borderOnForeground: false,
                                color: Colors.grey.shade300,
                                shape: BeveledRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    side: const BorderSide(color: Colors.grey,width: 0.3)
                                ),
                                child: Row(
                                    children: [
                                      Expanded(
                                          flex: 3,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(15),
                                            child: FadeInImage(
                                              fit: BoxFit.cover,
                                              placeholder: const AssetImage('assets/images/placeholder.jpg'),
                                              image: NetworkImage("${widget.provider.list[index].thumbnail.path}.${widget.provider.list[index].thumbnail.extension}"),
                                            ),
                                          )
                                      ),
                                      Expanded(
                                          flex: 4,
                                          child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text(widget.provider.list[index].name,style: Theme.of(context).textTheme.bodyText1,maxLines: 2,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center)
                                              ]
                                          )
                                      )
                                    ]
                                )
                            )
                        )
                    )
                );
              }
              return Visibility(
                visible: !provider.isDone,
                child: Card(
                  color: Colors.amber.shade900,
                  child: Column(
                    children: const [
                      LinearProgressIndicator(color: Colors.white),
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text("Loading..",style: TextStyle(fontSize: 17,color: Colors.white)),
                      )
                    ],
                  ),
                ),
              );
            }
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if(scrollController.position.maxScrollExtent == scrollController.offset){
        Provider.of<HomeProvider>(context, listen: false).reloadData();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
