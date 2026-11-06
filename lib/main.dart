import 'package:flutter/material.dart';

void main() {
  runApp(const DarHafsApp());
}

class DarHafsApp extends StatelessWidget {
  const DarHafsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'دار حفص',
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },
      theme: ThemeData(
        primaryColor: const Color(0xFF1F4A38),
        scaffoldBackgroundColor: const Color(0xFFF4F6F5),
        fontFamily: 'Cairo',
      ),
      home: const LoginScreen(),
    );
  }
}

// 1. Login Screen
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFF1F4A38), width: 1.5),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Icon(Icons.menu_book_rounded, size: 50, color: Color(0xFF1F4A38)),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'دَارُ حَفْصٍ\nلِتَحْفِيظِ الْقُرْآنِ الْكَرِيمِ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1F4A38),
                        height: 1.3,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text('تطبيق المحفظ', style: TextStyle(fontSize: 16, color: Colors.black87)),
                    const SizedBox(height: 30),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.04),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          _buildTextField(label: 'اسم المستخدم :'),
                          const SizedBox(height: 16),
                          _buildTextField(label: 'كلمه المرور :', isPassword: true),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    value: rememberMe,
                                    activeColor: const Color(0xFF1F4A38),
                                    onChanged: (val) {
                                      setState(() {
                                        rememberMe = val ?? false;
                                      });
                                    },
                                  ),
                                  const Text('تذكير', style: TextStyle(fontSize: 13, color: Colors.grey)),
                                ],
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'هل نسيت كلمه المرور ؟',
                                  style: TextStyle(fontSize: 13, color: Color(0xFF1F4A38), fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const HomeScreen()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF1F4A38),
                              minimumSize: const Size(double.infinity, 48),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            ),
                            child: const Text('تسجيل الدخول', style: TextStyle(fontSize: 16, color: Colors.white)),
                          ),
                          const SizedBox(height: 8),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const RegisterScreen()),
                              );
                            },
                            child: const Text('إنشاء حساب محفظ جديد', style: TextStyle(color: Color(0xFF1F4A38))),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _buildBottomBanner(),
          ],
        ),
      ),
    );
  }
}

// 2. Register Screen
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFF1F4A38), width: 1.5),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Icon(Icons.menu_book_rounded, size: 45, color: Color(0xFF1F4A38)),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'دَارُ حَفْصٍ\nلِتَحْفِيظِ الْقُرْآنِ الْكَرِيمِ',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1F4A38)),
                    ),
                    const SizedBox(height: 4),
                    const Text('تطبيق المحفظ', style: TextStyle(fontSize: 15)),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          _buildTextField(label: 'اسم المحفظ :'),
                          const SizedBox(height: 12),
                          _buildTextField(label: 'اسم المستخدم :'),
                          const SizedBox(height: 12),
                          _buildTextField(label: 'كلمه المرور :', isPassword: true),
                          const SizedBox(height: 12),
                          _buildTextField(label: 'تأكيد كلمه المرور :', isPassword: true),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () => Navigator.pop(context),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF386652),
                              minimumSize: const Size(double.infinity, 45),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            ),
                            child: const Text('حفظ', style: TextStyle(fontSize: 16, color: Colors.white)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _buildBottomBanner(),
          ],
        ),
      ),
    );
  }
}

// 3. Home Screen
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> HALAQAT = const [
    {'name': 'حلقه عمرو ابن العاص', 'count': 15},
    {'name': 'حلقه ابو بكر الصديق', 'count': 20},
    {'name': 'حلقه عمر ابن الخطاب', 'count': 17},
    {'name': 'حلقه علي بن ابي طالب', 'count': 23},
    {'name': 'حلقه سعد ابن ابي وقاص', 'count': 21},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F4A38),
        title: const Text('الرئيسية', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.menu, color: Colors.white)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                const Text('مرحباً ، الشيخ احمد', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                const Text('اختر المجموعه للدخول :', style: TextStyle(fontSize: 14, color: Colors.grey)),
                const SizedBox(height: 16),
                ...HALAQAT.map((halaqa) => _buildHalaqaCard(context, halaqa['name'], halaqa['count'])).toList(),
                const SizedBox(height: 10),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add, color: Colors.white),
                  label: const Text('+ اضافه حلقه جديده', style: TextStyle(color: Colors.white, fontSize: 15)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF386652),
                    minimumSize: const Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ],
            ),
          ),
          _buildBottomNavBar(),
        ],
      ),
    );
  }

  Widget _buildHalaqaCard(BuildContext context, String title, int count) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF1F4A38), width: 1.5),
      ),
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => GroupDetailsScreen(groupName: title)),
          );
        },
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        subtitle: Text('عدد الطلاب :  $count طالبأً', style: const TextStyle(color: Colors.grey, fontSize: 13)),
      ),
    );
  }
}

// 4. Group Details Screen
class GroupDetailsScreen extends StatelessWidget {
  final String groupName;
  const GroupDetailsScreen({Key? key, required this.groupName}) : super(key: key);

  final List<Map<String, String>> STUDENTS = const [
    {'name': 'محمد هيثم عجيز', 'level': 'جيد جداً.'},
    {'name': 'محمد احمد ابراهيم', 'level': 'جيد.'},
    {'name': 'ابراهيم فتحي مليجي', 'level': 'جيد جداً.'},
    {'name': 'احمد محمد العشري', 'level': 'ممتاز.'},
    {'name': 'مراد بيك الشازلي', 'level': 'جيد.'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F4A38),
        title: Text(groupName, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: 'ابحث عن طالب...',
                    hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(onPressed: () {}, child: const Text('تعديل طالب', style: TextStyle(color: Colors.blue))),
                    TextButton(onPressed: () {}, child: const Text('حذف طالب', style: TextStyle(color: Colors.red))),
                  ],
                ),
                const SizedBox(height: 8),
                ...STUDENTS.map((student) => _buildStudentCard(context, student['name']!, student['level']!)).toList(),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () {
                    showDialog(context: context, builder: (_) => const AddStudentDialog());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF386652),
                    minimumSize: const Size(double.infinity, 45),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  child: const Text('+ اضافه طالب جديد', style: TextStyle(color: Colors.white, fontSize: 15)),
                ),
              ],
            ),
          ),
          _buildBottomBanner(),
        ],
      ),
    );
  }

  Widget _buildStudentCard(BuildContext context, String name, String level) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF1F4A38), width: 1.2),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => StudentDetailScreen(studentName: name, groupName: groupName)),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.arrow_back_ios_new, size: 14, color: Colors.grey),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(level, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                    const Text(' : المستوى ', style: TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// 5. Student Detail Screen
class StudentDetailScreen extends StatefulWidget {
  final String studentName;
  final String groupName;

  const StudentDetailScreen({Key? key, required this.studentName, required this.groupName}) : super(key: key);

  @override
  State<StudentDetailScreen> createState() => _StudentDetailScreenState();
}

class _StudentDetailScreenState extends State<StudentDetailScreen> {
  bool isActive = true;
  int selectedTab = 0; // 0: Recitation, 1: New Recitation, 2: Attendance, 3: Fees

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F4A38),
        title: Text(widget.groupName, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('حالة الطالب :', style: TextStyle(fontSize: 12, color: Colors.grey)),
                        Row(
                          children: [
                            Checkbox(
                              value: isActive,
                              onChanged: (v) => setState(() => isActive = true),
                            ),
                            const Text('فعال', style: TextStyle(color: Colors.blue, fontSize: 13)),
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: !isActive,
                              onChanged: (v) => setState(() => isActive = false),
                            ),
                            const Text('متوقف', style: TextStyle(color: Colors.red, fontSize: 13)),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(widget.studentName, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        const Text('المستوى : جيد جداً.', style: TextStyle(color: Colors.grey, fontSize: 13)),
                        const Text('تاريخ الانضمام : 07-09-2026', style: TextStyle(color: Colors.grey, fontSize: 12)),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildTabItem('الرسوم', 3),
                      _buildTabItem('الحضور', 2),
                      _buildTabItem('التسميع الجديد', 1),
                      _buildTabItem('سجل الحفظ', 0),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                if (selectedTab == 0) ...[
                  _buildRecordCard('سوره الملك (1 - 15)', 'جيد جداً .', 'حفظ', Colors.green, '20-09-2026'),
                  _buildRecordCard('سوره الواقعة (1- 20)', 'جيد جداً .', 'مراجعه', Colors.blue, '20-09-2026'),
                  _buildRecordCard('سوره الرحمن (1 - 30)', 'ممتاز.', 'حفظ', Colors.green, '20-09-2026'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(context: context, builder: (_) => const AddRecitationDialog());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF386652),
                      minimumSize: const Size(double.infinity, 45),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    child: const Text('+ تسجيل تسميع جديد', style: TextStyle(color: Colors.white, fontSize: 15)),
                  ),
                ] else if (selectedTab == 1) ...[
                  ElevatedButton(
                    onPressed: () {
                      showDialog(context: context, builder: (_) => const AddRecitationDialog());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF386652),
                      minimumSize: const Size(double.infinity, 45),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    child: const Text('+ تسجيل تسميع جديد', style: TextStyle(color: Colors.white, fontSize: 15)),
                  ),
                ] else if (selectedTab == 2) ...[
                  ElevatedButton(
                    onPressed: () {
                      showDialog(context: context, builder: (_) => const AddAttendanceDialog());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF386652),
                      minimumSize: const Size(double.infinity, 45),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    child: const Text('+ تسجيل حضور / غياب جديد', style: TextStyle(color: Colors.white, fontSize: 15)),
                  ),
                ] else if (selectedTab == 3) ...[
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text('الملخص المالي :', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                        const Divider(),
                        const SizedBox(height: 6),
                        _buildFinancialRow('المبلغ المدفوع :', '[ 150.0 ]', Colors.green),
                        const SizedBox(height: 8),
                        _buildFinancialRow('المبلغ المتبقي :', '[ 50.0 ]', Colors.red),
                        const SizedBox(height: 8),
                        _buildFinancialRow('تاريخ اخر دفعه :', '[ 16 - 09 - 2026 ]', Colors.black87),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text('ـ سجل المدفوعات و الفواتير :', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.grey)),
                  const SizedBox(height: 8),
                  _buildInvoiceCard('دفع جزء من الاشتراك', '16 - 09 - 2026', '[ 50.0 ]'),
                  _buildInvoiceCard('دفع جزء من الاشتراك', '16 - 09 - 2026', '[ 50.0 ]'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF386652),
                      minimumSize: const Size(double.infinity, 45),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    child: const Text('+ اضافه فاتوره جديده', style: TextStyle(color: Colors.white, fontSize: 15)),
                  ),
                ],
              ],
            ),
          ),
          _buildBottomBanner(),
        ],
      ),
    );
  }

  Widget _buildTabItem(String title, int index) {
    bool isSelected = selectedTab == index;
    return GestureDetector(
      onTap: () => setState(() => selectedTab = index),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 13,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          color: isSelected ? const Color(0xFF1F4A38) : Colors.grey,
        ),
      ),
    );
  }

  Widget _buildFinancialRow(String label, String value, Color valueColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(value, style: TextStyle(fontWeight: FontWeight.bold, color: valueColor, fontSize: 14)),
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 13)),
      ],
    );
  }

  Widget _buildInvoiceCard(String title, String date, String amount) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              side: const BorderSide(color: Colors.grey, width: 0.5),
            ),
            child: const Text('عرض الفاتوره', style: TextStyle(fontSize: 11, color: Colors.black54)),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Text(amount, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Color(0xFF1F4A38))),
                  const SizedBox(width: 8),
                  Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                ],
              ),
              const SizedBox(height: 2),
              Text(date, style: const TextStyle(color: Colors.grey, fontSize: 11)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRecordCard(String title, String rating, String type, Color typeColor, String date) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const Text('النوع', style: TextStyle(fontSize: 11, color: Colors.grey)),
              const Icon(Icons.arrow_downward, size: 14, color: Colors.grey),
              Text(type, style: TextStyle(color: typeColor, fontWeight: FontWeight.bold, fontSize: 13)),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
              const SizedBox(height: 4),
              Row(
                children: [
                  Text(rating, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                  const Text(' : التقييم ', style: TextStyle(color: Colors.grey, fontSize: 12)),
                ],
              ),
              Text(date, style: const TextStyle(color: Colors.grey, fontSize: 11)),
            ],
          ),
        ],
      ),
    );
  }
}

// Dialogs
class AddStudentDialog extends StatelessWidget {
  const AddStudentDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.close, size: 18, color: Colors.black87),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Text(
                    'اضافه طالب جديد',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF1F4A38)),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _buildDialogTextField(hint: 'اكتب اسم الطالب هنا ....'),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _buildDialogTextField(hint: 'هاتف ولي الامر ( اختيار )', initialValue: '01225145262'),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _buildDialogTextField(hint: 'رقم الهاتف :', initialValue: '01066875820'),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              _buildDialogTextField(hint: 'تاريخ الانضمام :', initialValue: '09/09/2026'),
              const SizedBox(height: 12),
              _buildDialogTextField(hint: 'اكتب ملاحظه هنا (اختياري).....'),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF386652),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text('اضافه الطالب', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDialogTextField({required String hint, String? initialValue}) {
    return TextField(
      controller: initialValue != null ? TextEditingController(text: initialValue) : null,
      textAlign: TextAlign.right,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 12),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade400, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFF1F4A38), width: 1.5),
        ),
      ),
    );
  }
}

class AddRecitationDialog extends StatelessWidget {
  const AddRecitationDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.close, size: 18, color: Colors.black87),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Text(
                    'تسجيل تسميع جديد',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF1F4A38)),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const Text('السورة :', textAlign: TextAlign.right, style: TextStyle(fontSize: 12, color: Colors.grey)),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    hint: Text('اختيار السورة', style: TextStyle(fontSize: 12, color: Colors.grey)),
                    items: [],
                    onChanged: null,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              const Text('الايات :', textAlign: TextAlign.right, style: TextStyle(fontSize: 12, color: Colors.grey)),
              const SizedBox(height: 4),
              Row(
                children: [
                  Expanded(child: _buildSmallTextField(hint: 'الى :')),
                  const SizedBox(width: 8),
                  Expanded(child: _buildSmallTextField(hint: 'من :')),
                ],
              ),
              const SizedBox(height: 12),
              const Text('النوع :', textAlign: TextAlign.right, style: TextStyle(fontSize: 12, color: Colors.grey)),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: const [
                      Text('حفظ', style: TextStyle(fontSize: 12, color: Colors.green)),
                      Checkbox(value: false, onChanged: null),
                    ],
                  ),
                  const SizedBox(width: 16),
                  Row(
                    children: const [
                      Text('مراجعه', style: TextStyle(fontSize: 12, color: Colors.blue)),
                      Checkbox(value: true, onChanged: null),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Text('التققيم :', textAlign: TextAlign.right, style: TextStyle(fontSize: 12, color: Colors.grey)),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.star_border, color: Colors.amber, size: 24),
                  Icon(Icons.star, color: Colors.amber, size: 24),
                  Icon(Icons.star, color: Colors.amber, size: 24),
                  Icon(Icons.star, color: Colors.amber, size: 24),
                  Icon(Icons.star, color: Colors.amber, size: 24),
                ],
              ),
              const SizedBox(height: 12),
              TextField(
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  hintText: 'ملاحظه (اختياري)',
                  hintStyle: const TextStyle(color: Colors.grey, fontSize: 12),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey.shade400, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFF1F4A38), width: 1.5),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF386652),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text('حفظ', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSmallTextField({required String hint}) {
    return TextField(
      textAlign: TextAlign.right,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 12),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade400, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFF1F4A38), width: 1.5),
        ),
      ),
    );
  }
}

class AddAttendanceDialog extends StatelessWidget {
  const AddAttendanceDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.close, size: 18, color: Colors.black87),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Text(
                    'تسجيل الحضور / الغياب',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF1F4A38)),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const Text('التاريخ :', textAlign: TextAlign.right, style: TextStyle(fontSize: 12, color: Colors.grey)),
              const SizedBox(height: 4),
              TextField(
                controller: TextEditingController(text: '09/09/2026'),
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey.shade400, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFF1F4A38), width: 1.5),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              const Text('الحاله :', textAlign: TextAlign.right, style: TextStyle(fontSize: 12, color: Colors.grey)),
              const SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildStatusButton('معتذر', Colors.amber.shade700),
                  _buildStatusButton('غائب', Colors.red),
                  _buildStatusButton('حاضر', Colors.green, isSelected: true),
                ],
              ),
              const SizedBox(height: 12),
              const Text('ملاحظه (اختياري)', textAlign: TextAlign.right, style: TextStyle(fontSize: 12, color: Colors.grey)),
              const SizedBox(height: 4),
              TextField(
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey.shade400, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFF1F4A38), width: 1.5),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF386652),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text('حفظ', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusButton(String title, Color color, {bool isSelected = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(color: color, width: isSelected ? 1.5 : 0.8),
        borderRadius: BorderRadius.circular(8),
        color: isSelected ? color.withOpacity(0.05) : Colors.transparent,
      ),
      child: Text(
        title,
        style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 13),
      ),
    );
  }
}

// Helper Widgets
Widget _buildTextField({required String label, bool isPassword = false}) {
  return TextField(
    obscureText: isPassword,
    textAlign: TextAlign.right,
    decoration: InputDecoration(
      hintText: label,
      hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Color(0xFF1F4A38), width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Color(0xFF1F4A38), width: 1.8),
      ),
    ),
  );
}

Widget _buildBottomBanner() {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(vertical: 12),
    color: const Color(0xFF1F4A38),
    child: const Text(
      'دَارُ حَفْصٍ',
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
    ),
  );
}

Widget _buildBottomNavBar() {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 10),
    decoration: const BoxDecoration(
      color: Colors.white,
      border: Border(top: BorderSide(color: Colors.grey, width: 0.3)),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [
        Text('الاعدادات', style: TextStyle(color: Colors.grey, fontSize: 13)),
        Text('الرئيسية', style: TextStyle(color: Color(0xFF1F4A38), fontWeight: FontWeight.bold, fontSize: 13)),
        Text('الطلاب', style: TextStyle(color: Colors.grey, fontSize: 13)),
      ],
    ),
  );
}
