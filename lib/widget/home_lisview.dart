import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ungtravel/models/travel_model.dart';
import 'package:ungtravel/utility/my_style.dart';
import 'package:ungtravel/widget/add_travel.dart';

class HomeListView extends StatefulWidget {
  @override
  _HomeListViewState createState() => _HomeListViewState();
}

class _HomeListViewState extends State<HomeListView> {
  // Field
  List<TravelModel> travelModels = List();

  // Method
  @override
  void initState() {
    super.initState();
    readAllData();
  }

  Future<void> readAllData() async {
    if (travelModels.length != 0) {
      travelModels.removeWhere((TravelModel travelModel) {
        return travelModel != null;
      });
    }

    Firestore firestore = Firestore.instance;
    CollectionReference collectionReference = firestore.collection('Travel');
    await collectionReference.snapshots().listen((response) {
      List<DocumentSnapshot> snapshots = response.documents;
      for (var snapshot in snapshots) {
        // print('snapshot = ${snapshot.data}');
        TravelModel travelModel = TravelModel.fromJSON(snapshot.data);
        setState(() {
          travelModels.add(travelModel);
        });
      }
    });
  }

  Widget showDetail(int index) {
    String string = travelModels[index].detail;
    if (string == null) {
      string = 'Not Detail';
    } else if (string.length > 50) {
      string = string.substring(0, 49);
      string = '$string ...';
    }

    return Text(
      string,
      style:
          TextStyle(color: index % 2 == 0 ? Colors.white : MyStyle().textColor),
    );
  }

  Widget showName(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Text(
          travelModels[index].name,
          style: index % 2 == 0 ? MyStyle().h1WhiteText : MyStyle().h1Text,
        ),
      ],
    );
  }

  Widget showText(int index) {
    return Container(
      padding: EdgeInsets.only(top: 20.0, bottom: 20.0, right: 20.0),
      width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.width * 0.4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          showName(index),
          showDetail(index),
        ],
      ),
    );
  }

  Widget showImage(int index) {
    return Container(
      padding: EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.width * 0.4,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          image: DecorationImage(
            image: NetworkImage(travelModels[index].url),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget showListView() {
    return ListView.builder(
      itemCount: travelModels.length,
      itemBuilder: (BuildContext buildContext, int index) {
        return Container(
          decoration: BoxDecoration(
              color: index % 2 == 0 ? MyStyle().barColor : MyStyle().mainColor),
          child: Row(
            children: <Widget>[
              showImage(index),
              showText(index),
            ],
          ),
        );
      },
    );
  }

  Widget addButton() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20.0),
              child: FloatingActionButton(
                backgroundColor: MyStyle().textColor,
                child: Icon(Icons.add),
                onPressed: () {
                  MaterialPageRoute materialPageRoute =
                      MaterialPageRoute(builder: (BuildContext buildContext) {
                    return AddTravel();
                  });
                  Navigator.of(context)
                      .push(materialPageRoute)
                      .then((response) {
                    print('You Back Home ListView');
                    readAllData();
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        showListView(),
        addButton(),
      ],
    );
  }
}
