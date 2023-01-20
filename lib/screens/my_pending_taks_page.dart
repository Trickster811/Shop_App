import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:iut_ads/screens/components/image_view_page.dart';
import 'package:iut_ads/screens/components/new_post_page.dart';
import 'package:iut_ads/screens/home_page.dart';
import 'package:iut_ads/screens/service_page.dart';
import 'package:iut_ads/utils/utils.dart';
import 'package:iut_ads/welcome_pages/auth/sign_in_page.dart';

class MyPendingTasksScreen extends StatefulWidget {
  const MyPendingTasksScreen({
    Key? key,
    required this.deviceSize,
    required this.dateTimeRange,
  }) : super(key: key);
  final Size deviceSize;
  final DateTimeRange dateTimeRange;

  @override
  State<MyPendingTasksScreen> createState() => _MyPendingTasksScreenState();
}

class _MyPendingTasksScreenState extends State<MyPendingTasksScreen> {
  List<DocumentBuilder> pendingTasksList = [
    DocumentBuilder(
      documentTitle: 'Analyse et conception des Algorithmes',
      documentLink: 'assets/ineif/faief',
      documentCopies: 05,
      documentColorType: false,
      documentReliureType: true,
      documentdispositionType: true,
      documentSendingDate: DateTime.now().subtract(Duration(days: 10)),
      ownerName: 'Alhafiz',
      ownerPhone: 656541584,
      documentStatus: true,
    ),
  ];
  List<DocumentBuilder> filteredPendingTasksList = [];

  @override
  void initState() {
    super.initState();
    performingFiltering();
  }

  performingFiltering() {
    try {
      print(pendingTasksList[0].documentSendingDate);
      print(widget.dateTimeRange.start);
      setState(() {
        for (var element in pendingTasksList) {
          if (element.documentSendingDate
              .isBefore(widget.dateTimeRange.start)) {
            filteredPendingTasksList.add(element);
          }
        }

        print('yo');
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: GroupedListView<DocumentBuilder, DateTime>(
            elements: filteredPendingTasksList,
            groupBy: (pendingTask) => DateTime(
              pendingTask.documentSendingDate.year,
              pendingTask.documentSendingDate.month,
              pendingTask.documentSendingDate.day,
            ),
            // groupSeparatorBuilder: (String groupByValue) =>
            //     Text(groupByValue),
            groupHeaderBuilder: (DocumentBuilder pendingTask) => Container(
              height: 30.0,
              padding: EdgeInsets.symmetric(
                vertical: 8.0,
              ),
              color: Theme.of(context).scaffoldBackgroundColor,
              alignment: Alignment.center,
              child: Text(
                DateFormat.yMMMMEEEEd().format(pendingTask.documentSendingDate),
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
            itemBuilder: (context, DocumentBuilder pendingTask) => Container(
                height: 50.0,
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.symmetric(vertical: 10.0),
                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(.5),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Text(pendingTask.documentTitle)),
            // itemComparator: (item1, item2) =>
            //     item1['name'].compareTo(item2['name']), // optional
            useStickyGroupSeparators: true, // optional
            floatingHeader: true, // optional
            order: GroupedListOrder.DESC, // optional),
          ),
        ),
        Positioned(
          bottom: 90,
          right: 20,
          child: ClipOval(
            child: Container(
              height: 50,
              width: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: primaryColor,
              ),
              child: SvgPicture.asset(
                'assets/icons/calendar.svg',
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget adsItemBuilder(BuildContext context, AdsObjets adsObjets) {
    return Container(
      height: 300,
      width: widget.deviceSize.width,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 10,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ImageViewScreen(
                    imageLink: adsObjets.imageLink,
                    deviceSize: widget.deviceSize,
                  ),
                ),
              );
            },
            child: Container(
              height: 175,
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(10),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(10),
                ),
                child: Image.asset(
                  adsObjets.imageLink,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Row(
            children: [
              Container(
                height: 125,
                width: (widget.deviceSize.width - 20) * .65,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          adsObjets.productName,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          width: 05,
                        ),
                        Text(
                          "(Produit)",
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '€ ${adsObjets.productPrice}',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          width: 05,
                        ),
                        Text(
                          "(Prix U)",
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          adsObjets.location,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          width: 05,
                        ),
                        Text(
                          "(Position)",
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 125,
                width: (widget.deviceSize.width - 20) * .35,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(.05),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NewPostScreen(
                                deviceSize: widget.deviceSize,
                                adsObjets: adsObjets,
                              ),
                            ),
                          );
                        },
                        icon: SvgPicture.asset(
                          'assets/icons/edit-square.6.svg',
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          'assets/icons/delete.3.svg',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
