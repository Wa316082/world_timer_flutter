import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data: ModalRoute.of(context)!.settings.arguments as Map;
    //set background
    String bgImage = data['isDaytime'] ? 'day.jpg' : 'night.jpg';
    Color bgColor = data['isDaytime'] ? Colors.blue : Colors.indigo;
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: SafeArea(
                child: Column(
                  children: <Widget>[
                    TextButton.icon(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        disabledBackgroundColor: Colors.grey[100],
                      ),
                      onPressed: () async{
                       dynamic result = await Navigator.pushNamed(context, '/location');
                        setState(() {
                          data = {
                            'time': result['time'],
                            'location': result['location'],
                            'isDaytime': result['isDaytime'],
                            'flag': result['flag'],
                          };
                        });
                      },
                      icon: const Icon(Icons.edit_location),
                      label: const Text('Edit Location'),
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          data['location'],
                          style: const TextStyle(
                            fontSize: 28,
                            letterSpacing: 2,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    Text(
                      data['time'],
                      style: const TextStyle(
                        fontSize: 66,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )
            ),
          ),
        ),
      ),
    );
  }
}
