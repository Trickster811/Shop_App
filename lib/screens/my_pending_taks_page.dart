import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:ndere_ads/screens/components/secretariat_details_page.dart';
import 'package:ndere_ads/screens/service_page.dart';
import 'package:ndere_ads/utils/utils.dart';

class MyPendingTasksScreen extends StatefulWidget {
  const MyPendingTasksScreen({
    Key? key,
    required this.deviceSize,
  }) : super(key: key);
  final Size deviceSize;

  @override
  State<MyPendingTasksScreen> createState() => _MyPendingTasksScreenState();
}

class _MyPendingTasksScreenState extends State<MyPendingTasksScreen> {
  DateTimeRange dateTimeRange = DateTimeRange(
    start: DateTime.now().subtract(
      const Duration(
        days: 5,
      ),
    ),
    end: DateTime.now(),
  );

  List<DocumentBuilder> pendingTasksList = [
    DocumentBuilder(
      documentTitle: 'Analyse et conception des Algorithmes',
      documentLink: 'assets/ineif/faief',
      documentCopies: 05,
      documentColorType: false,
      documentReliureType: true,
      documentdispositionType: true,
      documentSendingDate: DateTime.now().subtract(const Duration(days: 10)),
      documentComment: 'Ne pas imprimer la page 02',
      ownerName: 'Alhafiz',
      ownerPhone: 656541584,
      documentStatus: true,
    ),
    DocumentBuilder(
      documentTitle: 'Analyse et conception des Algorithmes',
      documentLink: 'assets/ineif/faief',
      documentCopies: 05,
      documentColorType: false,
      documentReliureType: true,
      documentdispositionType: true,
      documentSendingDate: DateTime.now().subtract(const Duration(days: 12)),
      documentComment: 'Ne pas imprimer la page 02',
      ownerName: 'Alhafiz',
      ownerPhone: 656541584,
      documentStatus: true,
    ),
  ];
  List<DocumentBuilder> filteredPendingTasksList = [];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: GroupedListView<DocumentBuilder, DateTime>(
            elements: filteredPendingTasksList.isNotEmpty
                ? filteredPendingTasksList
                : pendingTasksList,
            groupBy: (pendingTask) => DateTime(
              pendingTask.documentSendingDate.year,
              pendingTask.documentSendingDate.month,
              pendingTask.documentSendingDate.day,
            ),
            // groupSeparatorBuilder: (String groupByValue) =>
            //     Text(groupByValue),
            groupHeaderBuilder: (DocumentBuilder pendingTask) => Container(
              height: 30.0,
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
              ),
              margin: const EdgeInsets.symmetric(vertical: 15.0),
              color: Theme.of(context).scaffoldBackgroundColor,
              alignment: Alignment.center,
              child: Text(
                DateFormat.yMMMMEEEEd().format(pendingTask.documentSendingDate),
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
            itemBuilder: (context, DocumentBuilder pendingTask) => Container(
              height: 150.0,
              padding: const EdgeInsets.all(5.0),
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: primaryColor.withOpacity(.1),
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: primaryColor.withOpacity(.15),
                  )
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: primaryColor.withOpacity(.1),
                  //     blurRadius: 12,
                  //     offset: Offset(0, 10),
                  //   ),
                  // ],
                  ),
              child: Column(
                children: [
                  Container(
                    height: 90,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(10.0),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          '___Titre du Document___',
                          style: TextStyle(
                            fontSize: 08,
                          ),
                        ),
                        Text(
                          pendingTask.documentTitle,
                          textScaleFactor: 1.25,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Expanded(
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                              ),
                              child: const Text(
                                'Travail Terminé',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SecretariatDetailsScreen(
                                  deviceSize: widget.deviceSize,
                                  documentBuilder: pendingTask,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                            ),
                            child: const Text(
                              'Details',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
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
          child: InkWell(
            onTap: () async {
              try {
                final DateTimeRange? date = await showDateRangePicker(
                  context: context,
                  firstDate: DateTime(2022),
                  lastDate: DateTime.now(),
                  initialEntryMode: DatePickerEntryMode.input,
                  initialDateRange: dateTimeRange,
                );
                setState(() {
                  dateTimeRange = date!;
                  for (var element in pendingTasksList) {
                    if (element.documentSendingDate
                        .isBefore(dateTimeRange.start)) {
                      filteredPendingTasksList.add(element);
                    }
                  }
                });
              } catch (e) {
                print(e);
              }
            },
            child: Container(
              height: 50,
              width: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(10.0),
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
}
