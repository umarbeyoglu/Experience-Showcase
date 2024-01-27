import 'dart:collection';
import 'dart:core';
import 'dart:developer';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';


class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    // var app = App(logger: FileLogger());
    //Customer item = Customer.createNEW("A", "B", 1, 2, 3); item.age2;print(item.age2);
    //   var fn = calculation('+');print(fn(10, 20));
    // var p1 = 'a1',p2 = 'a2';var result = identical(p1, p2);
    //   MapTutorial();
    // var region = Region(shapes: [Circle(radius: 10), Square(length: 10), Square(length: 10)]);
    //   var region = Region(shapes: [Circle(radius: 10), Square(length: 10), Square(length: 10)]);
    //  var p1 = Pointing(x: 0,y:0);
    // p1.move(10, 20).show().reset();
    //  print(region.area);
    //  var post = Post();post.share('The first post.');
    //  var comment = Comment();comment.share('My first comment.');
    //  var video = Video();video.share('Share the video');
    // var account = SavingAccount(balance: 100);
    // print(account.toString());
    //var account = SavingAccount();account.deposit(1000);account.interestRate = 0.05;account.addInterest();
    //print(account.balance);print(account is SavingAccount); // trueprint(account is BankAccount);
    // var numbers = range(1, 5);
    //  for (var number in numbers) {print(number);}
    var stream = rangestream(1, 5);
    stream.listen(
      (number) => print(number),
    );

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Test',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String iconPath;
  final String placeHolder;
  final Function(bool)? onFocusChange; // nullable and optional
  const MyHomePage({
    Key? key,
    required this.iconPath, // non-nullable and required
    this.placeHolder = "", // non-nullable but optional with a default value
    this.onFocusChange, // nullable and optional
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

abstract class Logger {
  void log(String message);
}

class ConsoleLogger implements Logger {
  @override
  void log(String message) {
    print('Log "$message" to the console.');
  }
}

class FileLogger implements Logger {
  @override
  void log(Pattern message) {
    print('Log "$message" to a file.');
  }
}

Iterable<int> range(int start, int end) sync* {
  for (var i = start; i < end; i++) {
    yield i;
  }
}

Stream<int> rangestream(int start, int end) async* {
  for (var i = start; i < end; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield await i;
  }
}

//In each iteration of the loop, we use the yield keyword to produce the current value of i.
// The yield statement temporarily suspends the execution of the generator and provides the current value
// to the consumer of the generator.
// After yielding a value, the generator resumes execution and continues to the next iteration of the loop.
// Once the loop completes, the generator implicitly ends, and no further values are generated.
class App {
  Logger? logger;

  App({this.logger});

  void run() {
    logger?.log("App is starting...");
  }
}

class Point {
  double x, y;

  // The main constructor for this class.
  Point(this.x, this.y);

  // Delegates to the main constructor.
  Point.alongXAxis(double x) : this(x, 0);
}

class Customer {
  late String name;
  late int agebirth;
  late int ageregister;
  late int age;
  late String location;
  bool muted = false;
  static final _cache = <String, Customer>{};

  //const
  Customer(
      String name, String location, int age, int agebirth, int ageregister) {
    this.name = name;
    this.agebirth = agebirth;
    this.ageregister = ageregister;
    this.age = age;
    this.location = location;
  }

  int get age2 {
    return ageregister;
  }

  void set age2(int currentYear) {
    age = currentYear - ageregister;
  }

  // Named constructor - for multiple constructors
  Customer.withoutLocation(this.name, this.agebirth) {
    this.name = name;
    this.agebirth = age;
  }

  static final Customer origin = Customer("", "", 0, 0, 0);

  // factory constructor
  factory Customer.create() {
    return origin;
    //RETURNS ORIGIN
  }

  factory Customer.createNEW(String a, String b, int c, int d, int e) {
    final Customer origin2 = Customer(a, b, c, d, e);
    return origin2;
    //RETURNS ORIGIN
  }

  void log(String message) {
    if (!muted) {
      print(message);
    }
  }

  Customer.empty() {
    name = "";
    age = 0;
    location = "";
  }
}

Future<dynamic> NullAwareOperators() async {
  //   int value;
  int value = 0;
  String value2 = '';

  print(null ?? null ?? 2);
  print(value); // <- null
  value ??= 5;
  print(value); // <- 5, changed from null
  value ??= 6;
  print(value);

  print(value2.toLowerCase()); // <- will crash
  print(value2?.toLowerCase().toUpperCase()); // <- will crash
  print(value2?.toLowerCase()?.toUpperCase());

  List<int> list = [1, 2, 3];
  List<String> list2 = []; //
  // List<String> list2; // <- list2 is null
  print(['chocolate', ...list2]); // <- [chocolate]
  //   print(['chocolate', ...?list2]); //
  print([0, ...list2, ...list]); // <- [0, 1, 2, 3]
  //    print([0, ...?list2, ...list]); //
  print(['cake!', ...list2]); // <- will crash
}

void Stringmultiplication() {
  String text = 'Hello';
  log(text * 5);
}

Widget orientationGrid() {
  return OrientationBuilder(
    builder: (context, orientation) {
      return GridView.count(
        // Create a grid with 2 columns in portrait mode,
        // or 3 columns in landscape mode.
        crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
      );
    },
  );
}

printMsg() => print("hello");

class Parent {
  String msg = "message variable from the parent class";
  void m1(int a) {
    print("value of a ${a}");
  }
}

class Child extends Parent {
  @override
  void m1(int b) {
    print("value of b ${b}");
    super.m1(13);
    print("${super.msg}");
  }
}

enum Status {
  pending, //index 0
  completed, //index 1
  rejected, //index 2
}

class Pair<T> {
  T x;
  T y;
  Pair(this.x, this.y);
}

var pairInt = Pair<int>(10, 20);

var pairStr = Pair<String>('A', 'B');

abstract class Shape {
  double get area;
} //Other classes inherit from it

class Circle extends Shape {
  double radius;

  Circle({required this.radius});

  @override
  double get area => 3.14 * radius * radius;
}

class Square extends Shape {
  double length;
  Square({required this.length});

  @override
  double get area => length * length;
}

class Region<T extends Shape> {
  List<T> shapes;

  Region({required this.shapes});

  double get area {
    double totalArea = 0;
    for (var shape in shapes) {
      totalArea += shape.area;
    }
    return totalArea;
  }
}

//Generics & Abstract
//When using T in shape, you include all kind of shapes (Square and Circle)
enum OrderStatus {
  open(10),
  confirmed(20),
  completed(30),
  cancelled(40);

  final int progress;
  const OrderStatus(this.progress);

  bool operator <(OrderStatus status) => progress < status.progress;
  bool operator >(OrderStatus status) => progress > status.progress;
}

void EnumOrder() {
  var status = OrderStatus.open;
  if (status < OrderStatus.completed) {
    print('The order has not completed');
  }
}

void Enum() {
  List<Status> statuses = Status.values;
  for (var status in statuses) {
    print(status.name);
  }

  var status = Status.completed;

  switch (status) {
    case Status.pending:
      print('The request is pending');
      break;
    case Status.completed:
      print('The request completed successfully.');
      break;
    case Status.rejected:
      print('The request faield.');
      break;
  }
}

Future<void> ExceptionHandler() async {
  try {
    var file = File('readme1.txt');
    var contents = await file.readAsString();
    print(contents);
  } on FileSystemException catch (e) {
    print(e);
    return;
  }

  return;
}

void MapTutorial() {
  var details = new Map();

  details['Usrname'] = 'admin';
  details['Password'] = 'admin@123';
  details.putIfAbsent('chuckle', () {
    details['chuckle'] = 'chuckler';
    print('checkpoint');
  });
  print(details);
}

void Runes() {
  String x = 'Runes';
  print(x.codeUnits);
}

dynamic Router(String settings) {
  return Scaffold(
      backgroundColor: Colors.black,
      body: Navigator(
        initialRoute: '/',
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case '/':
              return MaterialPageRoute(
                builder: (BuildContext context) => const MyHomePage(
                  iconPath: '',
                ),
                settings: settings,
              );
            case '/chats':
              return MaterialPageRoute(
                builder: (BuildContext context) => const MyHomePage(
                  iconPath: '',
                ),
                settings: settings,
              );
            case '/customTransition':
              return PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const MyHomePage(
                  iconPath: '',
                ),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return child;
                },
              );
            default:
              throw Exception('Invalid route: ${settings.name}');
          }
        },
      ));
}

Future<String> _getBatteryLevel() async {
  const platform = MethodChannel('samples.flutter.dev/battery');
  String batteryLevel;
  try {
    final result = await platform.invokeMethod<int>('getBatteryLevel');
    batteryLevel = 'Battery level at $result % .';
  } on PlatformException catch (e) {
    batteryLevel = "Failed to get battery level: '${e.message}'.";
  }

  return batteryLevel;
}

void readfiles() {
  File file = File("${Directory.current.path}\\data\\contact.txt");
  Future<String> f = file.readAsString();
  f.then((data) => print(data));
  print("End of main");
}

//TYPEDEF START
typedef ManyOperation(int firstNo, int secondNo);
//function signature
Add(int firstNo, int second) {
  print("Add result is ${firstNo + second}");
}

Subtract(int firstNo, int second) {
  print("Subtract result is ${firstNo - second}");
}

Divide(int firstNo, int second) {
  print("Divide result is ${firstNo / second}");
}

Calculator(int a, int b, ManyOperation oper) {
  print("Inside calculator");
  oper(a, b);
}

void typedeffunc() {
  ManyOperation oper = Add;
  oper(10, 20);
  oper = Subtract;
  oper(30, 20);
  oper = Divide;
  oper(50, 5);
}

//TYPEDEF END

void switchcase() {
  int variable1 = 8;
  switch (variable1) {
    case 2:
      {}
      break;
    case 3:
      {}
      break;
    default:
      {}
      break;
  }
}

void map() {
  var details = new Map();
  details['Usrname'] = 'admin';
  details['Password'] = 'admin@123';
}

void loops() {
  outerloop:
  for (var i = 0; i < 5; i++) {
    print("Innerloop: ${i}");
    innerloop:
    for (var j = 0; j < 5; j++) {
      if (j > 3) break;
      if (i == 2) break innerloop;
      if (i == 4) break outerloop;
      print("Innerloop: ${j}");
    }
  }
}

Widget Responsive(String type) {
  if (type == 'A') {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
        color: Colors.green,
      ),
    );
  }
  if (type == 'B') {
    return const FittedBox(
      fit: BoxFit.fill,
      child: SizedBox(),
    );
  }
  if (type == 'C') {
    return FractionallySizedBox(
      widthFactor: 0.5,
      heightFactor: 0.5,
      alignment: FractionalOffset.center,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.blue,
            width: 4,
          ),
        ),
      ),
    );
  }
  if (type == 'D') {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 600) {
          return Container(
            height: 100.0,
            width: 100.0,
            color: Colors.red,
          );
        } else {
          return Container(
            height: 60.0,
            width: 60.0,
            color: Colors.red,
          );
        }
      },
    );
  }
  if (type == 'E') {}
  return const SizedBox();
}

void Stringpadding() {
  String text = 'Hello';
  log(text.padLeft(10, ' '));
}

void Collection() {
  Queue numQ = Queue();
  numQ.addAll([100, 200, 300]);
  Iterator i = numQ.iterator;

  while (i.moveNext()) {
    print(i.current);
  }
}

extension on String {
  String capitalize() => this[0].toUpperCase();
}

extension StringPadding on String {
  String zeros(int width) => padLeft(width, '0');
}

void ExtensionString() {
  String text1 = 'abc';
  text1 = text1.capitalize();
  text1 = text1.zeros(6);
  print(text1);
}

void Maps3() {
  Map<String, int> fruits = {'apple': 5, 'banana': 2, 'orange': 3};

  String text1 = 'anan';
  fruits['straberry'] = 4; //ADD ITEM
  fruits['banana'] = 8; // EDIT ITEM
  fruits.remove('apple');
  print(fruits['banana']);
  print(fruits);
  print(fruits.keys); //apple,banana,orange
  print(fruits.values); //1,2,3
  print(fruits.containsKey('apple')); //boolean
  print(fruits.containsValue(3)); //boolean

  for (var fruit in fruits.entries) {
    print('A ${fruit.key}: ${fruit.value}');
  }

  for (var name in fruits.keys) {
    print('B $name: ${fruits[name]}');
  }

  var salaries = [1000000.0, 125000.0, 150000.0];
  var newSalaries = salaries.map((salary) => salary * 1.05);
  //var numbers = inputs.map(double.tryParse).where((n) => n != null)
}

void SetandList() {
  Set<int> ratings = {1, 2, 3};

  var a = {1, 2, 3};
  var b = {2, 3, 4};
  var c = a.intersection(b); //Common Elements
  var d = a.union(b); //Add Elements,Delete Duplicate

  // final,can't be added to another list

  // immutable ! => const scores = [1, 3, 4, 2, 5];
  List<String> list = [
    'apple',
    'bracket',
    'company',
    'directly',
    'evan',
    'father',
    'greatly',
    'heaven',
    'iterate',
    'jacob',
    'kevin',
    'ladder'
  ];
  List<int> list2 = [1, 2, 3, 4, 5, 6, 7];
  bool list3 = list.any((item) => item.startsWith('b'));
  List<String> list4 = list.where((i) => i.contains('f')).toList();
  int list5 = list2.reduce((value, element) => value + element);
  list.forEach((score) => print(score));
  print(list.sublist(1, 4));
  print(list3);
  print(list4);
  print(list5);

  var lower = [if (list3) 1, 2, 3];
  var upper = [4, 5];
  var scores = [...lower, ...upper];
  print(scores);

  var numbers = [1, 2, 3];
  var scores2 = [0, for (var number in numbers) number * 2];
}

void RemoveDuplicates() {
  List<int> list = [1, 1, 5, 6, 5, -3];
  list.toSet().toList();
  print(list);
}

void Randomize() {
  List<int> list = [1, 1, 5, 6, 5, -3];
  list.shuffle();
  print(list);
}

Stream<dynamic> getValueStreamForCurrentUser() async* {
  final userId = await NullAwareOperators();
  yield* userId;
}

Future<dynamic> PositionalOptionalParameters() async {
  getHttpUrl(String server, String path,
      [int port = 80, int numRetries = 3]) {} //
  getHttpUrl2(String server, String path,
      {int port = 80, int numRetries = 3}) {}
  //getHttpUrl('example.com', '/index.html', 8080, 5); // port == 8080
  //getHttpUrl2('example.com', '/index.html',numRetries: 3, port: 801); // port == 80
}

Future<dynamic> CheckConnectivity() async {
  try {
    final result = await InternetAddress.lookup('example.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      print('connected');
    }
  } on SocketException catch (_) {
    print('not connected');
  }
}

Future<void> TryCatchFinal() async {
  File file;
  IOSink? writer;
  try {
    file = File('message.txt');
    writer = file.openWrite();
    writer.write('Hello');
  } on FileSystemException {
    print('File not found');
  } finally {
    writer?.close();
  }
}

void DoWhileCase() {
  int number = 0;

  do {
    number++;
    print(number);
  } while (number < 5);
}

void BreakFunc() {
  String message = "Dart is awesome!";
  for (int i = 0; i < message.length; i++) {
    if (message[i] == 's') {
      print("The letter s is found at index $i");
      break;
    }
  }
//--------------------------
  int i = 0;
  while (i < message.length) {
    print(message[i]);
    if (message[i] == 'a') {
      print("The letter a was found at the index $i");
      break;
    }
    i++;
  }
//--------------------------

  int i2 = 0;
  do {
    print(message[i2]);
    if (message[i2] == 'a') {
      print("The letter a was found at the index $i2");
      break;
    }
    i2++;
  } while (i2 < message.length);

//Continue does not break but skips element!
}

void WhileCase() {
  int current = 0;
  while (current < 5) {
    current++;
    print(current);
  }
}

void Switchcase() {
  String day = "";
  switch (day) {
    case "Monday":
    case "Tuesday":
    case "Wednesday":
    case "Thursday":
    case "Friday":
      day = "Weekday";
      break;
    case "Saturday":
    case "Sunday":
      day = "Weekend";
      break;
    default:
      day = "Invalid";
      break;
  }
}

bool isOddNumber(int x) {
  return x % 2 != 0;
}

bool isEvenNumber(int x) {
  return x % 2 == 0;
}

void show(Function fn) {
  // show(isOddNumber);
  for (int i = 0; i < 10; i++) {
    if (fn(i)) {
      print(i);
    }
  }
}

class Pointing {
  int x;
  int y;
  Pointing({required this.x, required this.y});

  Pointing move(int x, int y) {
    this.x = x;
    this.y = y;
    return this;
  }

  Pointing reset() {
    this.x = 0;
    this.y = 0;
    return this;
  }

  Pointing show() {
    print('Point($x,$y)');
    return this;
  }

  @override
  operator ==(o) => o is Pointing && o.x == x && o.y == y;

  @override
  int get hashCode => Object.hash(x, y);
}

add(int x, int y) {
  return x + y;
}

subtract(int x, int y) {
  return x - y;
}

Function calculation(String op) {
  if (op == '+') return add;
  if (op == '-') return subtract;
  return add;
}

//MIXIN

abstract class Model {
  void modelable(String model) {
    print('here is model');
  }
}

class User extends Model {}

mixin Shareable {
  void share(String content) {
    print('Share the $content');
  }

  void commentable(String content) {
    print('Commentable the $content');
  }
}

class Post extends Model with Shareable {}

class Comment extends Model with Shareable {}

class Video with Shareable {}

class BankAccount {
  double _balance = 0;

  BankAccount({double balance = 0}) : _balance = balance;

  double get balance => _balance;

  deposit(double amount) {
    _balance += amount;
  }

  bool withdraw(double amount) {
    if (amount <= _balance) {
      _balance -= amount;
      return true;
    }
    return false;
  }

  @override
  String toString() {
    return 'The balance is $balance USD.';
  }
}

class SavingAccount extends BankAccount {
  double _interestRate = 0;

  SavingAccount({double balance = 0, double interestRate = 0})
      : _interestRate = interestRate,
        super(balance: balance); //initialize properties of bankaccount!

  double get interestRate => _interestRate;

  set interestRate(double value) {
    if (value > 0) {
      _interestRate = value;
    }
  }

  addInterest() {
    double interest = _balance * _interestRate;
    this._balance += interest;
  }

  @override
  String toString() {
    return super.toString() + ' The interest rate is ${interestRate}.';
  }
}
// FLUTTER TUTORIALS

class AutocompleteBasicExample extends StatelessWidget {
  const AutocompleteBasicExample({super.key});

  static const List<String> _kOptions = <String>[
    'aardvark',
    'bobcat',
    'chameleon',
  ];

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<String>.empty();
        }
        return _kOptions.where((String option) {
          return option.contains(textEditingValue.text.toLowerCase());
        });
      },
      onSelected: (String selection) {
        debugPrint('You just selected $selection');
      },
    );
  }
}


Widget returnWidget(String type,BuildContext context){
  if(type == ''){return BackdropFilter(filter:ImageFilter.blur(sigmaX: 4,sigmaY: 4));}
  if(type == ''){return const Banner(message: '',location: BannerLocation.topEnd,color: Colors.red,child: SizedBox(),);}
  if(type == ''){return Builder(builder: (BuildContext context){return Text('',style: Theme.of(context).textTheme.displayLarge,);},);}
  if(type == ''){showModalBottomSheet(context: context, builder: (BuildContext context){return SizedBox();});} //onPressed
  if(type == ''){return CheckboxListTile(value: true, onChanged: (value){},tristate: true,controlAffinity: ListTileControlAffinity.leading,);}//Colors etc..
  if(type == ''){}
  if(type == ''){}
  return SizedBox();
}














