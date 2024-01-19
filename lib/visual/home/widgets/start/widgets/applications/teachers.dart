import 'package:flutter/material.dart';

class Teachers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              height: 40,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Color(0xFF3D3D3D)),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [],
              ),
            ),
          );
        },
      ),
    );
  }

  Map<String, String> map = {
    'Hc': 'Herr Huchtler',
    'Ham': 'Frau Hamann',
    'Em': 'Frau Emmler',
  };
}
