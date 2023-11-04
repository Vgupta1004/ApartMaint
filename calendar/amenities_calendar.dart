import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BookedEvent {
  final String amenityName;
  final String amenityDescription;
  final String timeSlot;

  BookedEvent({
    required this.amenityName,
    required this.amenityDescription,
    required this.timeSlot,
  });
}

class AmenitiesCalendarScreen extends StatefulWidget {
  const AmenitiesCalendarScreen({Key? key}) : super(key: key);

  @override
  State<AmenitiesCalendarScreen> createState() => _AmenitiesCalendarScreen();
}

class _AmenitiesCalendarScreen extends State<AmenitiesCalendarScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDate;
  List<String> amenityOptions = [];
  List<String> timeSlots = [
    '8 AM',
    '9 AM',
    '10 AM',
    '11 AM',
    '12 PM',
    '1 PM',
    '2 PM',
    '3 PM',
    '4 PM',
    '5 PM',
    '6 PM',
    '7 PM'
  ];

  Map<String, List<BookedEvent>> bookedSlots = {};

  final amenityController = TextEditingController();
  String selectedAmenity = '';
  String selectedTimeSlot = '';

  @override
  void initState() {
    super.initState();
    _selectedDate = _focusedDay;
    loadAmenityOptions();
  }

  Future<void> loadAmenityOptions() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('Amenities').get();
    if (snapshot.docs.isNotEmpty) {
      setState(() {
        amenityOptions = snapshot.docs.map((doc) => doc.id).toList();
      });
    }
  }

  Future<List<String>> loadDescriptionsForAmenity(String amenityId) async {
    final descriptionsSnapshot = await FirebaseFirestore.instance
        .collection('Amenities')
        .doc(amenityId)
        .collection('Descriptions')
        .get();

    if (descriptionsSnapshot.docs.isNotEmpty) {
      return descriptionsSnapshot.docs
          .map((doc) => doc['Text'] as String)
          .toList();
    }
    return [];
  }

  Future<List<String>> loadTimeSlotsForAmenity(String amenityId) async {
    final timeSlotsSnapshot = await FirebaseFirestore.instance
        .collection('Amenities')
        .doc(amenityId)
        .collection('Timings')
        .get();

    if (timeSlotsSnapshot.docs.isNotEmpty) {
      return timeSlotsSnapshot.docs
          .map((doc) => doc['Time'] as String)
          .toList();
    }
    return [];
  }

  _showAddEventDialog() async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Book an Amenity',
          textAlign: TextAlign.center,
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButton<String>(
              value: selectedAmenity,
              items: amenityOptions.map((amenity) {
                return DropdownMenuItem<String>(
                  value: amenity,
                  child: Text(amenity),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedAmenity = value!;
                });
              },
            ),
            if (selectedAmenity.isNotEmpty)
              DropdownButton<String>(
                value: selectedTimeSlot,
                items: timeSlots.map((timeSlot) {
                  return DropdownMenuItem<String>(
                    value: timeSlot,
                    child: Text(timeSlot),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedTimeSlot = value!;
                  });
                },
              ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            child: Text('Book Amenity'),
            onPressed: () {
              if (selectedAmenity.isEmpty || selectedTimeSlot.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Please select an amenity and a time slot'),
                    duration: Duration(seconds: 2)));
              } else {
                final formattedDate =
                    DateFormat('yyyy-MM-dd').format(_selectedDate!);
                final bookedEvent = BookedEvent(
                  amenityName: selectedAmenity,
                  amenityDescription:
                      '', // You can add a description field in Firestore
                  timeSlot: selectedTimeSlot,
                );

                if (bookedSlots.containsKey(formattedDate)) {
                  bookedSlots[formattedDate]!.add(bookedEvent);
                } else {
                  bookedSlots[formattedDate] = [bookedEvent];
                }

                // Now, save the booking details to Firestore in a "BookedEvents" collection.
                saveBookingToFirestore(formattedDate, bookedEvent);

                setState(() {
                  selectedAmenity = '';
                  selectedTimeSlot = '';
                });

                Navigator.pop(context);
              }
            },
          ),
        ],
      ),
    );
  }

  // Function to save booking details to Firestore
  void saveBookingToFirestore(String date, BookedEvent event) {
    FirebaseFirestore.instance.collection('BookedEvents').doc(date).set({
      'amenityName': event.amenityName,
      'amenityDescription': event.amenityDescription,
      'timeSlot': event.timeSlot,
    });
  }

  List<BookedEvent> _listOfDayEvents(DateTime dateTime) {
    final formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
    final bookedEvents = bookedSlots[formattedDate];
    if (bookedEvents != null) {
      return bookedEvents;
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Amenities Calendar'),
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime(2023),
            lastDay: DateTime(2024),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            onDaySelected: (selectedDay, focusedDay) {
              if (!isSameDay(_selectedDate, selectedDay)) {
                setState(() {
                  _selectedDate = selectedDay;
                  _focusedDay = focusedDay;
                });
              }
            },
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDate, day);
            },
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
            eventLoader: _listOfDayEvents,
          ),
          ..._listOfDayEvents(_selectedDate!).map(
            (myAmenity) => ListTile(
              leading: const Icon(
                Icons.done,
                color: Colors.green,
              ),
              title: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text('Amenity Name: ${myAmenity.amenityName}'),
              ),
              subtitle: Text('Time Slot: ${myAmenity.timeSlot}'),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showAddEventDialog(),
        label: const Text('Book Amenities'),
      ),
    );
  }
}

void main() => runApp(MaterialApp(
      home: AmenitiesCalendarScreen(),
    ));
