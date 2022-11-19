import 'package:flutter/material.dart';
import 'package:magic_fit/constants/app_colors.dart';
import 'package:magic_fit/viewmodel/work_out_provider.dart';
import 'package:magic_fit/views/workout_screen.dart';
import 'package:provider/provider.dart';

class WorkutListItem extends StatelessWidget {
  const WorkutListItem({Key? key, required this.item}) : super(key: key);
  final WorkoutItem item;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(
        top: 40,
      ),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.95,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.calendar_month,
                        color: Color.fromARGB(255, 0, 164, 68),
                        size: 24,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        '${item.dateTime.day}-${item.dateTime.month}-${item.dateTime.year} ',
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        Provider.of<WorkoutProvider>(context, listen: false)
                            .deleteItem(item.id);
                      },
                      icon: const Icon(
                        Icons.delete,
                        size: 34,
                        color: Colors.red,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Row(
                children: [
                  const Icon(
                    Icons.lock_clock,
                    color: Color(0xFFA08844),
                    size: 24,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    ' ${item.dateTime.hour}:${item.dateTime.minute} ',
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Column(
              children: List.generate(item.sets.length, (index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return WorkOutScreen(
                        workoutItem: item,
                      );
                    }));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: index != item.sets.length - 1
                            ? BorderRadius.zero
                            : const BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30),
                              )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildIcon(
                              index,
                              'assets/barbell.png',
                              'Set Number',
                              (index + 1).toString(),
                              context,
                              const Color(0xFFFFEAB8),
                              const Color(0xFFA08844),
                            ),
                            Expanded(
                              child: _buildIcon(
                                index,
                                'assets/exercise.png',
                                'Exercise',
                                item.sets[index].exerciseItem,
                                context,
                                const Color(0xFFE8E5FF),
                                const Color(0XFF8C78EA),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildIcon(
                              index,
                              'assets/weight.png',
                              'Weight',
                              item.sets[index].weightSelected.toString() +
                                  ' KG',
                              context,
                              const Color(0xFFE8F3E8),
                              const Color(0xFF79A67B),
                            ),
                            Expanded(
                              child: _buildIcon(
                                index,
                                'assets/repeat.png',
                                'Reps',
                                item.sets[index].repetitionSelected.toString(),
                                context,
                                const Color(0xFFFFE5FA),
                                const Color(0xFFBC5DA5),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(int index, String icon, String type, String text,
      BuildContext context, Color light, Color dark) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.49,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.10,
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16), color: light),
            child: Image.asset(
              icon,
              width: 30,
              height: 30,
              color: dark,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.05,
          ),
          SizedBox(
            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                Expanded(
                  child: Text(
                    type,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
