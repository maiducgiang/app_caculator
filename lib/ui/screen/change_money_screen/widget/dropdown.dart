import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DropdowCom extends StatefulWidget {
  DropdowCom({required this.comPorts, required this.callback, this.initPort});
  List<String> comPorts;
  String? initPort;
  Function(String) callback;
  @override
  State<DropdowCom> createState() => _DropdowComState();
}

class _DropdowComState extends State<DropdowCom> {
  late String dropdownValue;
  @override
  void initState() {
    if (widget.initPort != null) {
      dropdownValue = widget.initPort!;
    } else {
      dropdownValue = widget.comPorts[0];
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: 200,
      // height: 45,
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      // decoration: BoxDecoration(
      //     color: Colors.white,
      //     border: Border.all(color: Colors.black, width: 1),
      //     borderRadius: BorderRadius.circular(20.w)
      //     ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: dropdownValue,
          icon: const Icon(
            Icons.arrow_drop_down,
            size: 35,
          ),
          elevation: 0,
          style: TextStyle(
              color: Colors.black,
              fontSize: 15.sp,
              overflow: TextOverflow.ellipsis),
          onChanged: (String? value) {
            widget.callback(value!);
            setState(() {
              dropdownValue = value;
            });
          },
          items: widget.comPorts.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
