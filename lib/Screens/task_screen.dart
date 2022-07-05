import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_switch/flutter_switch.dart';



import 'package:date_format/date_format.dart';


class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  bool status =false;
  bool statusLocation =false;
  bool statusArrival=false;

  bool timeFlag=true;
  bool locationFlag=true;
  bool LAFlag=true;

  int id=1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 16.0),
                  child: Text("Add a new Task",style: TextStyle(color: Colors.blueAccent,fontSize: 15),),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 6),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                    decoration: BoxDecoration(
                      color: Theme.of(context).secondaryHeaderColor,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(30),
                          blurRadius: 5.0,
                          spreadRadius: 5.0,
                          offset: Offset(
                            1,
                            1,
                          ),
                        )
                      ],
                    ),
                    child: Column(
                      children: [
                        TextField(
                          style: TextStyle(
                            fontSize: 20
                          ),
                          decoration: InputDecoration(
                            hintStyle: TextStyle(
                              fontSize: 25
                            ),
                            labelText: "Title",
                            border: InputBorder.none,
                            labelStyle: TextStyle(
                              fontSize: 20,

                              color: Theme.of(context).primaryColorDark
                            )
                          ),
                        ),
                        TextField(
                          maxLines: 3,
                          style: TextStyle(
                              fontSize: 20,
                          ),
                          decoration: InputDecoration(
                            labelText: "Description",
                              border: InputBorder.none,
                              labelStyle: TextStyle(
                                fontSize: 20,
                                  color: Theme.of(context).primaryColorDark
                              )

                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 6),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                    decoration: BoxDecoration(
                      color: Theme.of(context).secondaryHeaderColor,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(30),
                          blurRadius: 5.0,
                          spreadRadius: 5.0,
                          offset: Offset(
                            1,
                            1,
                          ),
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 0.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text("Time",style: TextStyle(
                                  fontSize: 20,
                          color: Theme.of(context).primaryColorDark
                              ),),
                              Expanded(child: SizedBox()),
                              FlutterSwitch(
                                value: status,
                                width: 45.0,
                                height: 25.0,
                                valueFontSize: 12.0,
                                toggleSize: 18.0,
                                onToggle: (value) {
                                  setState(() {
                                    status = value;
                                    timeFlag=!timeFlag;
                                  });
                                },
                              ),
                            ],
                          ),
                          AbsorbPointer(
                            absorbing: timeFlag,
                            child: DateTimePicker(),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 6),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                    decoration: BoxDecoration(
                        color: Theme.of(context).secondaryHeaderColor,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(30),
                          blurRadius: 5.0,
                          spreadRadius: 5.0,
                          offset: Offset(
                            1,
                            1,
                          ),
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text("Location",style: TextStyle(
                                  fontSize: 20,

                          color: Theme.of(context).primaryColorDark
                              ),),
                              Expanded(child: SizedBox()),
                              FlutterSwitch(
                                value: statusLocation,
                                width: 45.0,
                                height: 25.0,
                                valueFontSize: 12.0,
                                toggleSize: 18.0,
                                onToggle: (value) {
                                  setState(() {
                                    statusLocation = value;
                                    locationFlag=!locationFlag;
                                  });
                                },
                              ),
                            ],
                          ),
                          AbsorbPointer(
                            absorbing: locationFlag,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                                  child: Row(
                                    children: [
                                      Text("Pick a Place",style: TextStyle(
                                          fontSize: 20,
                                          color: Theme.of(context).primaryColorDark
                                      ),),
                                      Expanded(child: SizedBox()),
                                      Icon(Icons.location_pin,size:35),
                                      SizedBox(width: 7,)
                                    ],
                                  ),
                                ),
                                // Padding(
                                //   padding: const EdgeInsets.symmetric(vertical: 0.0),
                                //   child: Row(
                                //     children: [
                                //       Text("Leave / Arrive",style: TextStyle(
                                //           fontSize: 20
                                //       ),),
                                //       Expanded(child: SizedBox()),
                                //       FlutterSwitch(
                                //         value: statusArrival,
                                //         width: 45.0,
                                //         height: 25.0,
                                //         valueFontSize: 12.0,
                                //         toggleSize: 18.0,
                                //         onToggle: (value) {
                                //           setState(() {
                                //             statusArrival = value;
                                //           });
                                //         },
                                //       ),
                                //     ],
                                //   ),
                                // ),
                              ],
                            )
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 6),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                    decoration: BoxDecoration(
                        color: Theme.of(context).secondaryHeaderColor,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(30),
                          blurRadius: 5.0,
                          spreadRadius: 5.0,
                          offset: Offset(
                            1,
                            1,
                          ),
                        )
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("Priority",style: TextStyle(
                                fontSize: 20,
                                color: Theme.of(context).primaryColorDark
                            ),),
                            Expanded(child: SizedBox()),
                            Row(
                              children: [
                                Radio(
                                  value: 1,
                                  groupValue: id,
                                  activeColor: Colors.greenAccent,
                                  hoverColor: Colors.greenAccent,
                                  fillColor:MaterialStateColor.resolveWith((states) => Colors.greenAccent),
                                  onChanged: (val) {
                                    setState(() {
                                      id = 1;
                                    });
                                  },
                                ),
                                Radio(
                                  value: 2,
                                  groupValue: id,
                                  activeColor: Colors.yellow[100],
                                  hoverColor: Colors.yellow[100],
                                  fillColor:MaterialStateColor.resolveWith((states) => Colors.yellow),
                                  onChanged: (val) {
                                    setState(() {
                                      id = 2;
                                    });
                                  },
                                ),
                                Radio(
                                  value: 3,
                                  groupValue: id,
                                  activeColor: Colors.red[100],
                                  hoverColor: Colors.red[100],
                                  fillColor:MaterialStateColor.resolveWith((states) => Colors.red),
                                  onChanged: (val) {
                                    setState(() {
                                      id = 3;
                                    });
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 6),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                    decoration: BoxDecoration(
                        color: Theme.of(context).secondaryHeaderColor,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(30),
                          blurRadius: 5.0,
                          spreadRadius: 5.0,
                          offset: Offset(
                            1,
                            1,
                          ),
                        )
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("Assign",style: TextStyle(
                                fontSize: 20,
                                color: Theme.of(context).primaryColorDark
                            ),),
                            Expanded(child: SizedBox()),
                            Icon(Icons.add_circle,size: 30,),
                            SizedBox(width: 10,)
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 12),
                  child: Row(
                    children: [
                      Expanded(child: ElevatedButton(onPressed: (){},
                        child: Text("Cancel",style: TextStyle(
                            fontSize: 20,
                            color: Theme.of(context).iconTheme.color
                        ),),
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0),
                          shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
                          backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).scaffoldBackgroundColor),
                      ),)),
                      SizedBox(width: 10,),
                      Expanded(child: ElevatedButton(onPressed: (){},
                        child: Text("Save",style: TextStyle(
                          fontSize: 20,
                            color: Theme.of(context).iconTheme.color
                        ),),
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0),
                          shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
                          backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).scaffoldBackgroundColor),
                        ),)),
                    ],
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}




class DateTimePicker extends StatefulWidget {
  @override
  _DateTimePickerState createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  double? _height;
  double? _width;
  String? _setTime, _setDate;
  String? _hour, _minute, _time;
  String? dateTime;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);
  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null)
      setState(() {
        selectedDate = picked;
        _dateController.text = DateFormat.yMd().format(selectedDate);
      });
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null)
      setState(() {
        selectedTime = picked;
        _hour = selectedTime.hour.toString();
        _minute = selectedTime.minute.toString();
        _time = _hour! + ' : ' + _minute!;
        _timeController.text = _time!;
        _timeController.text = formatDate(
            DateTime(2019, 08, 1, selectedTime.hour, selectedTime.minute),
            [hh, ':', nn, " ", am]).toString();
      });
  }

  @override
  void initState() {
    _dateController.text = DateFormat.yMd().format(DateTime.now());

    _timeController.text = formatDate(
        DateTime(2019, 08, 1, DateTime.now().hour, DateTime.now().minute),
        [hh, ':', nn, " ", am]).toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    dateTime = DateFormat.yMd().format(DateTime.now());
    return Container(
      padding: EdgeInsets.only(top: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(Icons.event,color: Theme.of(context).iconTheme.color,),
            InkWell(
              onTap: () {
                _selectDate(context);
              },
              child: Container(
                width: _width! / 3,
                height: _height! / 20,
                child: TextFormField(
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                  enabled: false,
                  keyboardType: TextInputType.text,
                  controller: _dateController,
                  onSaved: (String? val) {
                    _setDate = val;
                  },
                  decoration: InputDecoration(
                      labelText: 'Date',
                      labelStyle: TextStyle(
                        color: Theme.of(context).primaryColorDark.withAlpha(200)
                      ),
                      contentPadding: EdgeInsets.only(top: 0.0)),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                _selectTime(context);
              },
              child: Container(
                width: _width! / 3,
                height: _height! / 20,
                child: TextFormField(
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                  onSaved: (String? val) {
                    _setTime = val;
                  },
                  enabled: false,
                  keyboardType: TextInputType.text,
                  controller: _timeController,
                  decoration: InputDecoration(
                      labelText: 'Time',
                      labelStyle: TextStyle(
                          color: Theme.of(context).primaryColorDark.withAlpha(200)
                      ),
                      contentPadding: EdgeInsets.all(0)),
                ),
              ),
            ),
          ],
        ),
      );
  }
}