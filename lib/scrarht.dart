import 'dart:io';

void main() {
  performTasks();
}

Future<void> performTasks() async {
  task1();
  String task2Result = await task2();
  task3(task2Result);
}

void task1() {
  // String result = 'task 1 data';
  print('Task 1 complete');
}

Future task2() async {
  
  Duration theeSecond = Duration(seconds: 5);

  String result;

  await Future.delayed(theeSecond, () {
    result = 'NYTь';
    print('222222FUCK!!!!!!!');
  });

  return result;
}

void task3(String task2Data) {
  String result = 'task 3 data';
  print('[хуй]$task2Data');
}
