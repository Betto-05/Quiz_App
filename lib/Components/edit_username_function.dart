import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/cubit/cubit/fecth_user_data_cubit.dart';

Future<dynamic> editUserNameFunction(BuildContext context, userName) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      actions: [
        Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            TextField(
              onChanged: (value) {
                userName = value;
              },
              decoration: InputDecoration(
                hintText: userName,
                hintStyle: const TextStyle(fontSize: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Center(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade900,
                  ),
                  onPressed: () {
                    context.read<FecthUserDataCubit>().updateUserName(userName);
                    context.read<FecthUserDataCubit>().getData();
                    Navigator.pop(context);
                  },
                  child:
                      const Text("OK", style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
            Center(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      side: BorderSide(color: Colors.blue.shade900),
                      backgroundColor: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel",
                      style: TextStyle(color: Colors.blue.shade900)),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
