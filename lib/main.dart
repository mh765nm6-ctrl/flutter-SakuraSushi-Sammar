import 'package:flutter/material.dart';

void main() {
  runApp(const SakuraRestaurantApp(studentName: 'سمر محمد الشهري'));
}

class MenuItem {
  final String id;
  final String nameAr;
  final String nameEn;
  final String category;
  final double price;
  final String description;
  final String emoji;

  MenuItem({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.category,
    required this.price,
    required this.description,
    required this.emoji,
  });
}

class CartItem {
  final MenuItem item;
  int quantity;

  CartItem({required this.item, this.quantity = 1});
}

final Map<String, String> registeredUsers = {
  'admin': '1234',
};

final List<String> categories = [
  'الكل',
  'سوشي',
  'رامين',
  'مقبلات',
  'مشروبات',
];

final List<MenuItem> menuItems = [
  MenuItem(
    id: '1',
    nameAr: 'سوشي سلمون نيجيري',
    nameEn: 'Salmon Nigiri',
    category: 'سوشي',
    price: 45.0,
    description:
        'شرائح سلمون طازجة فوق أرز السوشي المتبل بخل الأرز الياباني، يقدم مع الوسابي وصلصة الصويا.',
    emoji: '🍣',
  ),
  MenuItem(
    id: '2',
    nameAr: 'رول التنين المقرمش',
    nameEn: 'Dragon Roll',
    category: 'سوشي',
    price: 58.0,
    description:
        'أفوكادو، روبيان تمبورا مقرمش، وصلصة الترياكي الخاصة مع سمسم محمص.',
    emoji: '🐉',
  ),
  MenuItem(
    id: '3',
    nameAr: 'رامين تونكوتسو',
    nameEn: 'Tonkotsu Ramen',
    category: 'رامين',
    price: 62.0,
    description:
        'مرق غني مطهو ببطء مع نودلز يابانية، بيض متبل، بصل أخضر، وأعشاب النوري.',
    emoji: '🍜',
  ),
  MenuItem(
    id: '4',
    nameAr: 'شويو رامين كلاسيك',
    nameEn: 'Shoyu Ramen',
    category: 'رامين',
    price: 54.0,
    description: 'مرق صويا خفيف ولذيذ مع شرائح لحم مشوي وذرة حلوة.',
    emoji: '🍲',
  ),
  MenuItem(
    id: '5',
    nameAr: 'جيوزا دجاج',
    nameEn: 'Chicken Gyoza',
    category: 'مقبلات',
    price: 28.0,
    description:
        '6 قطع من فطائر الدجاج اليابانية المحمرة والمطهوة على البخار مع صلصة الغمس.',
    emoji: '🥟',
  ),
  MenuItem(
    id: '6',
    nameAr: 'إدامامي بالملح البحري',
    nameEn: 'Sea Salt Edamame',
    category: 'مقبلات',
    price: 22.0,
    description: 'فول الصويا الأخضر المطهو على البخار مع رشة ملح بحري خشن.',
    emoji: '🫛',
  ),
  MenuItem(
    id: '7',
    nameAr: 'شاي ماتشا مثلج',
    nameEn: 'Iced Matcha Latte',
    category: 'مشروبات',
    price: 26.0,
    description: 'شاي أخضر ياباني فاخر مخفوق مع الحليب البارد.',
    emoji: '🍵',
  ),
  MenuItem(
    id: '8',
    nameAr: 'موتشي فراولة',
    nameEn: 'Strawberry Mochi',
    category: 'مشروبات',
    price: 24.0,
    description: 'حلوى الأرز اليابانية التقليدية المحشوة بآيسكريم الفراولة.',
    emoji: '🍡',
  ),
];

class SakuraRestaurantApp extends StatelessWidget {
  final String studentName;
  const SakuraRestaurantApp({super.key, required this.studentName});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ساكورا سوشي | Sakura Sushi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFB71C1C),
          primary: const Color(0xFFB71C1C),
          secondary: const Color(0xFF212121),
          surface: const Color(0xFFFFF8F3),
        ),
        scaffoldBackgroundColor: const Color(0xFFFFF8F3),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFB71C1C),
          foregroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFB71C1C),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: SplashScreen(studentName: studentName),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  final String studentName;
  const SplashScreen({super.key, required this.studentName});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _goToLogin() {
    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const Directionality(
          textDirection: TextDirection.rtl,
          child: LoginScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB71C1C),
      body: InkWell(
        onTap: _goToLogin,
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      shape: BoxShape.circle,
                    ),
                    child: const Text('⛩️', style: TextStyle(fontSize: 72)),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'ساكورا سوشي',
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    'Sakura Sushi & Ramen',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white70,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 36),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'الطالبة: ${widget.studentName}',
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Student: ${widget.studentName}',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 36),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFFB71C1C),
                      padding: const EdgeInsets.symmetric(
                        vertical: 14,
                        horizontal: 32,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    onPressed: _goToLogin,
                    child: const Text(
                      'الانتقال إلى التسجيل',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'اضغطي على الزر أو في أي مكان للبدء',
                    style: TextStyle(fontSize: 13, color: Colors.white70),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() {
    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      _showError('يرجى تعبئة جميع الحقول المطلوبة');
      return;
    }

    if (!registeredUsers.containsKey(username) ||
        registeredUsers[username] != password) {
      _showError('اسم المستخدم أو كلمة المرور غير صحيحة');
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => Directionality(
          textDirection: TextDirection.rtl,
          child: CategoriesScreen(username: username),
        ),
      ),
    );
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red.shade800,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('تسجيل الدخول')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text('🍣',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 60)),
                const SizedBox(height: 12),
                const Text(
                  'أهلاً بك في ساكورا سوشي',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 32),
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'اسم المستخدم',
                    prefixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'كلمة المرور',
                    prefixIcon: const Icon(Icons.lock),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _login,
                  child: const Text('دخول', style: TextStyle(fontSize: 16)),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const Directionality(
                          textDirection: TextDirection.rtl,
                          child: RegisterScreen(),
                        ),
                      ),
                    );
                  },
                  child: const Text('ليس لديك حساب؟ أنشئ حساباً جديداً'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void _register() {
    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      _showMessage('يرجى تعبئة جميع الحقول المطلوبة', isError: true);
      return;
    }

    if (registeredUsers.containsKey(username)) {
      _showMessage('اسم المستخدم مسجّل مسبقاً، اختر اسماً آخر', isError: true);
      return;
    }

    registeredUsers[username] = password;
    _showMessage('تم إنشاء الحساب بنجاح! يمكنك تسجيل الدخول الآن',
        isError: false);
    Navigator.pop(context);
  }

  void _showMessage(String message, {required bool isError}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red.shade800 : Colors.green.shade700,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('إنشاء حساب جديد')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('🏮',
                textAlign: TextAlign.center, style: TextStyle(fontSize: 56)),
            const SizedBox(height: 16),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'اسم المستخدم الجديد',
                prefixIcon: const Icon(Icons.person_add),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'كلمة المرور',
                prefixIcon: const Icon(Icons.lock_outline),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _register,
              child: const Text('تسجيل الحساب', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoriesScreen extends StatefulWidget {
  final String username;
  const CategoriesScreen({super.key, required this.username});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final List<CartItem> _cart = [];

  void _addToCart(MenuItem item) {
    setState(() {
      final index = _cart.indexWhere((c) => c.item.id == item.id);
      if (index >= 0) {
        _cart[index].quantity++;
      } else {
        _cart.add(CartItem(item: item));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final categoryIcons = {
      'الكل': '🍱',
      'سوشي': '🍣',
      'رامين': '🍜',
      'مقبلات': '🥟',
      'مشروبات': '🍵',
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('أقسام القائمة اليابانية'),
        actions: [
          IconButton(
            icon: Badge(
              label:
                  Text('${_cart.fold<int>(0, (sum, c) => sum + c.quantity)}'),
              child: const Icon(Icons.shopping_cart),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => Directionality(
                    textDirection: TextDirection.rtl,
                    child: CartScreen(
                      cart: _cart,
                      onCartUpdated: () => setState(() {}),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'مرحباً بك 🌸',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text('اختر القسم لتصفح الأطباق اليابانية الأصيلة:'),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                  childAspectRatio: 1.1,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final cat = categories[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => Directionality(
                            textDirection: TextDirection.rtl,
                            child: MenuItemsScreen(
                              selectedCategory: cat,
                              cart: _cart,
                              onAddToCart: _addToCart,
                            ),
                          ),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: BorderSide(color: Colors.red.shade100),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            categoryIcons[cat] ?? '🥢',
                            style: const TextStyle(fontSize: 48),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            cat,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItemsScreen extends StatefulWidget {
  final String selectedCategory;
  final List<CartItem> cart;
  final Function(MenuItem) onAddToCart;

  const MenuItemsScreen({
    super.key,
    required this.selectedCategory,
    required this.cart,
    required this.onAddToCart,
  });

  @override
  State<MenuItemsScreen> createState() => _MenuItemsScreenState();
}

class _MenuItemsScreenState extends State<MenuItemsScreen> {
  String _searchQuery = '';
  late String _currentCategory;

  @override
  void initState() {
    super.initState();
    _currentCategory = widget.selectedCategory;
  }

  @override
  Widget build(BuildContext context) {
    final filteredItems = menuItems.where((item) {
      final matchesCategory =
          _currentCategory == 'الكل' || item.category == _currentCategory;
      final matchesSearch = item.nameAr.contains(_searchQuery) ||
          item.nameEn.toLowerCase().contains(_searchQuery.toLowerCase());
      return matchesCategory && matchesSearch;
    }).toList();

    return Scaffold(
      appBar: AppBar(title: Text('الأصناف - $_currentCategory')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              onChanged: (val) => setState(() => _searchQuery = val),
              decoration: InputDecoration(
                hintText: 'ابحث عن طبق ياباني...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 44,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final cat = categories[index];
                final isSelected = cat == _currentCategory;
                return Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: ChoiceChip(
                    label: Text(cat),
                    selected: isSelected,
                    selectedColor: const Color(0xFFB71C1C),
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : Colors.black87,
                    ),
                    onSelected: (_) => setState(() => _currentCategory = cat),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: filteredItems.isEmpty
                ? const Center(child: Text('لا توجد أطباق مطابقة للبحث'))
                : ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: filteredItems.length,
                    itemBuilder: (context, index) {
                      final item = filteredItems[index];
                      return Card(
                        margin: const EdgeInsets.only(bottom: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(12),
                          leading: Text(item.emoji,
                              style: const TextStyle(fontSize: 40)),
                          title: Text(
                            item.nameAr,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                              '${item.nameEn}\n${item.price.toStringAsFixed(0)} ر.س'),
                          isThreeLine: true,
                          trailing: IconButton(
                            icon: const Icon(Icons.add_circle,
                                color: Color(0xFFB71C1C), size: 32),
                            onPressed: () {
                              widget.onAddToCart(item);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content:
                                      Text('تمت إضافة ${item.nameAr} للسلة'),
                                  duration: const Duration(seconds: 1),
                                ),
                              );
                            },
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: ItemDetailsScreen(
                                    item: item,
                                    onAddToCart: () => widget.onAddToCart(item),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class ItemDetailsScreen extends StatelessWidget {
  final MenuItem item;
  final VoidCallback onAddToCart;

  const ItemDetailsScreen({
    super.key,
    required this.item,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(item.nameAr)),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 180,
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(item.emoji, style: const TextStyle(fontSize: 90)),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              item.nameAr,
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            Text(
              item.nameEn,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 12),
            Text(
              '${item.price.toStringAsFixed(0)} ريال سعودي',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFFB71C1C),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'الوصف:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              item.description,
              style: const TextStyle(fontSize: 16, height: 1.5),
            ),
            const Spacer(),
            ElevatedButton.icon(
              onPressed: () {
                onAddToCart();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('تمت إضافة ${item.nameAr} إلى السلة')),
                );
                Navigator.pop(context);
              },
              icon: const Icon(Icons.add_shopping_cart),
              label:
                  const Text('إضافة إلى السلة', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}

class CartScreen extends StatefulWidget {
  final List<CartItem> cart;
  final VoidCallback onCartUpdated;

  const CartScreen({
    super.key,
    required this.cart,
    required this.onCartUpdated,
  });

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double get _totalPrice => widget.cart.fold(
        0,
        (sum, item) => sum + (item.item.price * item.quantity),
      );

  void _confirmDelete(int index) {
    showDialog(
      context: context,
      builder: (ctx) => Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          title: const Text('تأكيد الحذف'),
          content: Text(
              'هل أنت متأكدة من حذف "${widget.cart[index].item.nameAr}" من السلة؟'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('إلغاء'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  widget.cart.removeAt(index);
                });
                widget.onCartUpdated();
                Navigator.pop(ctx);
              },
              child: const Text('حذف'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('سلة الطلبات')),
      body: widget.cart.isEmpty
          ? const Center(
              child:
                  Text('السلة فارغة حالياً 🥢', style: TextStyle(fontSize: 18)),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: widget.cart.length,
                    itemBuilder: (context, index) {
                      final cartItem = widget.cart[index];
                      return Card(
                        child: ListTile(
                          leading: Text(cartItem.item.emoji,
                              style: const TextStyle(fontSize: 32)),
                          title: Text(cartItem.item.nameAr),
                          subtitle: Text(
                            'الكمية: ${cartItem.quantity} | ${(cartItem.item.price * cartItem.quantity).toStringAsFixed(0)} ر.س',
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete_outline,
                                color: Colors.red),
                            onPressed: () => _confirmDelete(index),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 6)
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('الإجمالي:',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          Text(
                            '${_totalPrice.toStringAsFixed(0)} ر.س',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFB71C1C),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton(
                        onPressed: () {
                          final total = _totalPrice;
                          final itemsCount = widget.cart
                              .fold<int>(0, (s, c) => s + c.quantity);
                          setState(() => widget.cart.clear());
                          widget.onCartUpdated();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => Directionality(
                                textDirection: TextDirection.rtl,
                                child: OrderSummaryScreen(
                                  totalAmount: total,
                                  itemsCount: itemsCount,
                                ),
                              ),
                            ),
                          );
                        },
                        child: const Text('تأكيد الطلب',
                            style: TextStyle(fontSize: 16)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}

class OrderSummaryScreen extends StatelessWidget {
  final double totalAmount;
  final int itemsCount;

  const OrderSummaryScreen({
    super.key,
    required this.totalAmount,
    required this.itemsCount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ملخص الطلب')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('🎉', style: TextStyle(fontSize: 72)),
              const SizedBox(height: 16),
              const Text(
                'تم استلام طلبك بنجاح!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text('شكراً لاختيارك مطعم ساكورا سوشي ⛩️'),
              const SizedBox(height: 24),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('عدد الأصناف:'),
                          Text('$itemsCount',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const Divider(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('المبلغ الإجمالي:'),
                          Text(
                            '${totalAmount.toStringAsFixed(0)} ر.س',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFB71C1C),
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('العودة إلى القائمة الرئيسية'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
