import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const EVXStoreApp());
}

class EVXStoreApp extends StatefulWidget {
  const EVXStoreApp({Key? key}) : super(key: key);

  @override
  State<EVXStoreApp> createState() => _EVXStoreAppState();
}

class _EVXStoreAppState extends State<EVXStoreApp> {
  Locale _locale = const Locale('ar');

  void _toggleLanguage() {
    setState(() {
      _locale = _locale.languageCode == 'ar' ? const Locale('en') : const Locale('ar');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EVX STORE MART',
      debugShowCheckedModeBanner: false,
      locale: _locale,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: 'Roboto',
      ),
      home: AuthenticationWrapper(
        currentLocale: _locale,
        onToggleLanguage: _toggleLanguage,
      ),
    );
  }
}

// --- Dynamic Dictionary / قاموس النصوص ثنائي اللغة ---
class AppTexts {
  static Map<String, Map<String, String>> values = {
    'ar': {
      'app_title': 'EVX STORE MART',
      'signup_title': 'إنشاء حساب جديد وصك رقم آلي',
      'login_title': 'تسجيل الدخول السريع',
      'full_name': 'الاسم الكامل',
      'sec_answer': 'إجابة سؤال الأمان للحماية',
      'acc_num_hint': 'رقم الحساب الآلي (مثال: EVX-12345678)',
      'save_btn': 'تسجيل وحفظ البيانات',
      'login_btn': 'دخول',
      'switch_to_login': 'لديك حساب بالفعل؟ سجل دخولك',
      'switch_to_signup': 'حساب جديد؟ اضغط هنا',
      'acc_created': 'تم إنشاء الحساب بنجاح!',
      'acc_created_msg': 'رقم حسابك الآلي للدخول هو:\n\n',
      'enter_store': 'دخول المتجر',
      'tab_store': 'المتجر',
      'tab_wallet': 'المحفظة والدفع',
      'tab_treasury': 'حافظة المالك',
      'buy': 'شراء',
      'insufficient_balance': 'رصيد EVX غير كافٍ، يرجى الشحن عبر بنكك أو بطاقة الدفع المباشر',
      'purchase_success': 'تمت عملية الشراء بنجاح!',
      'gold_balance_title': 'رصيدك من عملة EVX الذهبية',
      'your_acc': 'رقم الحساب الشخصي: ',
      'buy_bankak': 'شراء عبر (بنكك - السودان)',
      'direct_card_pay': 'دفع مباشر بالبطاقة (إماراتي/دولي)',
      'treasury_title': 'حافظة المالك (SAMA ALMARFFA SHIPPING LLC)',
      'available_reserve': 'الاحتياطي المصكوك المتاح',
      'run_mint': 'تشغيل ميكر العملة (Mint New EVX)',
      'mint_success': 'تم تشغيل ميكر العملة وصك 100,000 EVX جديدة للخزينة!',
      'bankak_dialog_title': 'الدفع المباشر عبر تطبيق بنكك',
      'bankak_acc_owner': 'اسم صاحب الحساب:',
      'bankak_acc': 'رقم حساب بنك الخرطوم (بنكك):',
      'exchange_rate': 'سعر الصرف: 1 EVX = 1,500 جنيه سوداني',
      'amount_req': 'عدد عملات EVX المطلوبة',
      'trx_ref': 'رقم إشعار تحويل بنكك (Transaction Ref)',
      'cancel': 'إلغاء',
      'complete_mint': 'إرسال الطلب وصك العملة',
      'minted_to_user': 'تم التحقق وصك عملات EVX وإيداعها مباشرة في حسابك!',
      'card_dialog_title': 'بوابة الخصم المباشر (إصدار الشركة)',
      'card_num': 'رقم البطاقة البنكية (Visa / Mastercard)',
      'exp_date': 'تاريخ الانتهاء (MM/YY)',
      'cvv': 'رمز الأمان (CVV)',
      'pay_now': 'خصم مباشر وإيداع تلقائي',
      'direct_pay_success': 'تم الخصم المباشر بنجاح وتحويل المبلغ لحساب الشركة، وتم صك العملة لروح حسابك!',
      'ok': 'حسناً',
      'lang_switch': 'English',
    },
    'en': {
      'app_title': 'EVX STORE MART',
      'signup_title': 'Create New Account & Auto Issue ID',
      'login_title': 'Quick Login',
      'full_name': 'Full Name',
      'sec_answer': 'Security Answer',
      'acc_num_hint': 'Auto Account Number (e.g. EVX-12345678)',
      'save_btn': 'Register & Save Data',
      'login_btn': 'Login',
      'switch_to_login': 'Already have an account? Login',
      'switch_to_signup': 'New Account? Click Here',
      'acc_created': 'Account Created Successfully!',
      'acc_created_msg': 'Your auto-generated account number is:\n\n',
      'enter_store': 'Enter Store',
      'tab_store': 'Store',
      'tab_wallet': 'Wallet & Pay',
      'tab_treasury': 'Owner Treasury',
      'buy': 'Buy',
      'insufficient_balance': 'Insufficient EVX balance, please top up via Bankak or Direct Card Payment',
      'purchase_success': 'Purchase completed successfully!',
      'gold_balance_title': 'Your EVX Gold Coin Balance',
      'your_acc': 'Personal Account Number: ',
      'buy_bankak': 'Buy via (Bankak - Sudan)',
      'direct_card_pay': 'Direct Card Pay (UAE/Intl)',
      'treasury_title': 'Master Treasury (SAMA ALMARFFA SHIPPING LLC)',
      'available_reserve': 'Available Minted Reserve',
      'run_mint': 'Mint New EVX Coins',
      'mint_success': 'Coin Minting Triggered! 100,000 EVX added to Treasury!',
      'bankak_dialog_title': 'Direct Payment via Bankak App',
      'bankak_acc_owner': 'Account Holder Name:',
      'bankak_acc': 'Bankak Account Number:',
      'exchange_rate': 'Exchange Rate: 1 EVX = 1,500 SDG',
      'amount_req': 'Requested EVX Amount',
      'trx_ref': 'Bankak Transfer Ref Number',
      'cancel': 'Cancel',
      'complete_mint': 'Submit & Mint Coins',
      'minted_to_user': 'Verified! EVX Coins minted and deposited to your account!',
      'card_dialog_title': 'Direct Debit Payment Gateway',
      'card_num': 'Card Number (Visa / Mastercard)',
      'exp_date': 'Expiry Date (MM/YY)',
      'cvv': 'Security Code (CVV)',
      'pay_now': 'Direct Debit & Auto Mint',
      'direct_pay_success': 'Payment debited successfully to company account & EVX coins minted to your balance!',
      'ok': 'OK',
      'lang_switch': 'العربية',
    }
  };

  static String get(String key, String lang) {
    return values[lang]?[key] ?? key;
  }
}

// --- Wrapper Component ---
class AuthenticationWrapper extends StatefulWidget {
  final Locale currentLocale;
  final VoidCallback onToggleLanguage;

  const AuthenticationWrapper({
    Key? key,
    required this.currentLocale,
    required this.onToggleLanguage,
  }) : super(key: key);

  @override
  State<AuthenticationWrapper> createState() => _AuthenticationWrapperState();
}

class _AuthenticationWrapperState extends State<AuthenticationWrapper> {
  bool isLoggedIn = false;
  String userAccountNumber = "";
  String userName = "";
  double userEVXBalance = 500.0;
  double masterTreasuryBalance = 1000000000.0; // 1 Billion EVX

  void handleLogin(String name, String accNum) {
    setState(() {
      userName = name;
      userAccountNumber = accNum;
      isLoggedIn = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    String lang = widget.currentLocale.languageCode;
    return Directionality(
      textDirection: lang == 'ar' ? TextDirection.rtl : TextDirection.ltr,
      child: isLoggedIn
          ? MainHomeScreen(
              userName: userName,
              userAccountNumber: userAccountNumber,
              userEVXBalance: userEVXBalance,
              masterTreasuryBalance: masterTreasuryBalance,
              currentLocale: widget.currentLocale,
              onToggleLanguage: widget.onToggleLanguage,
              onBalanceChanged: (newBalance, newMasterBalance) {
                setState(() {
                  userEVXBalance = newBalance;
                  masterTreasuryBalance = newMasterBalance;
                });
              },
            )
          : AuthScreen(
              onLoginSuccess: handleLogin,
              currentLocale: widget.currentLocale,
              onToggleLanguage: widget.onToggleLanguage,
            ),
    );
  }
}

class AuthScreen extends StatefulWidget {
  final Function(String name, String accNum) onLoginSuccess;
  final Locale currentLocale;
  final VoidCallback onToggleLanguage;

  const AuthScreen({
    Key? key,
    required this.onLoginSuccess,
    required this.currentLocale,
    required this.onToggleLanguage,
  }) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isSignUp = true;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController securityAnswerController = TextEditingController();
  final TextEditingController loginAccController = TextEditingController();

  String generateAccountNumber() {
    final random = Random();
    String number = "EVX-";
    for (int i = 0; i < 8; i++) {
      number += random.nextInt(10).toString();
    }
    return number;
  }

  @override
  Widget build(BuildContext context) {
    String lang = widget.currentLocale.languageCode;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton.icon(
            onPressed: widget.onToggleLanguage,
            icon: const Icon(Icons.language, color: Colors.deepPurple),
            label: Text(
              AppTexts.get('lang_switch', lang),
              style: const TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          const WatermarkBackground(),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                color: Colors.white.withOpacity(0.92),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.monetization_on, size: 70, color: Color(0xFFFFD700)),
                      Text(
                        AppTexts.get('app_title', lang),
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.deepPurple),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        isSignUp ? AppTexts.get('signup_title', lang) : AppTexts.get('login_title', lang),
                        style: const TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      const SizedBox(height: 20),
                      if (isSignUp) ...[
                        TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            labelText: AppTexts.get('full_name', lang),
                            prefixIcon: const Icon(Icons.person),
                            border: const OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 15),
                        TextField(
                          controller: securityAnswerController,
                          decoration: InputDecoration(
                            labelText: AppTexts.get('sec_answer', lang),
                            prefixIcon: const Icon(Icons.security),
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ] else ...[
                        TextField(
                          controller: loginAccController,
                          decoration: InputDecoration(
                            labelText: AppTexts.get('acc_num_hint', lang),
                            prefixIcon: const Icon(Icons.badge),
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ],
                      const SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        onPressed: () {
                          if (isSignUp) {
                            if (nameController.text.isNotEmpty) {
                              String generatedAcc = generateAccountNumber();
                              showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                  title: Text(AppTexts.get('acc_created', lang)),
                                  content: Text('${AppTexts.get('acc_created_msg', lang)}$generatedAcc'),
                                  actions: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(ctx);
                                        widget.onLoginSuccess(nameController.text, generatedAcc);
                                      },
                                      child: Text(AppTexts.get('enter_store', lang)),
                                    )
                                  ],
                                ),
                              );
                            }
                          } else {
                            if (loginAccController.text.isNotEmpty) {
                              widget.onLoginSuccess("EVX User", loginAccController.text);
                            }
                          }
                        },
                        child: Text(
                          isSignUp ? AppTexts.get('save_btn', lang) : AppTexts.get('login_btn', lang),
                          style: const TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                      TextButton(
                        onPressed: () => setState(() => isSignUp = !isSignUp),
                        child: Text(isSignUp ? AppTexts.get('switch_to_login', lang) : AppTexts.get('switch_to_signup', lang)),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// --- Main Store Screen ---
class MainHomeScreen extends StatefulWidget {
  final String userName;
  final String userAccountNumber;
  final double userEVXBalance;
  final double masterTreasuryBalance;
  final Locale currentLocale;
  final VoidCallback onToggleLanguage;
  final Function(double, double) onBalanceChanged;

  const MainHomeScreen({
    Key? key,
    required this.userName,
    required this.userAccountNumber,
    required this.userEVXBalance,
    required this.masterTreasuryBalance,
    required this.currentLocale,
    required this.onToggleLanguage,
    required this.onBalanceChanged,
  }) : super(key: key);

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  int _currentIndex = 0;

  final List<Map<String, String>> products = [
    {'title': 'Zara Elegant Shirt', 'brand': 'Zara', 'priceUSD': '45', 'priceEVX': '450'},
    {'title': 'Nike Sport Shoes', 'brand': 'Nike', 'priceUSD': '120', 'priceEVX': '1200'},
    {'title': 'Adidas Jacket', 'brand': 'Adidas', 'priceUSD': '85', 'priceEVX': '850'},
    {'title': 'Gucci Luxury Bag', 'brand': 'Gucci', 'priceUSD': '350', 'priceEVX': '3500'},
  ];

  @override
  Widget build(BuildContext context) {
    String lang = widget.currentLocale.languageCode;
    final List<String> dailyPromos = [
      lang == 'ar' ? "🔥 عرض اليوم: خصم 20% عند الشراء باستخدام عملة EVX الذهبية!" : "🔥 Today: 20% discount using EVX Gold Coins!",
      lang == 'ar' ? "🇸🇩 عملاء السودان: يمكنكم الدفع المباشر عبر تطبيق بنكك!" : "🇸🇩 Sudan users: Direct payment available via Bankak!",
      lang == 'ar' ? "💳 الدفع الدولي المباشر: الخصم الآلي متصل فوراً ببطاقات الفيزا/ماستر!" : "💳 Instant Debit: Direct card payment connected securely!",
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('EVX STORE (${widget.userAccountNumber})', style: const TextStyle(fontSize: 13)),
        actions: [
          IconButton(
            icon: const Icon(Icons.language, color: Colors.amber),
            onPressed: widget.onToggleLanguage,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Color(0xFFFFD700), Color(0xFFFFA500)]),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  const Icon(Icons.monetization_on, color: Colors.deepPurple, size: 16),
                  const SizedBox(width: 4),
                  Text(
                    '${widget.userEVXBalance.toInt()} EVX',
                    style: const TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          const WatermarkBackground(),
          Column(
            children: [
              Container(
                color: Colors.amber.shade100,
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Icon(Icons.campaign, color: Colors.deepPurple),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        dailyPromos[DateTime.now().second % dailyPromos.length],
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: Colors.deepPurple),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: _currentIndex == 0
                    ? _buildStoreHome(lang)
                    : (_currentIndex == 1 ? _buildWalletPage(lang) : _buildMasterTreasuryPage(lang)),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        onTap: (index) => setState(() => _currentIndex = index),
        items: [
          BottomNavigationBarItem(icon: const Icon(Icons.store), label: AppTexts.get('tab_store', lang)),
          BottomNavigationBarItem(icon: const Icon(Icons.account_balance_wallet), label: AppTexts.get('tab_wallet', lang)),
          BottomNavigationBarItem(icon: const Icon(Icons.admin_panel_settings), label: AppTexts.get('tab_treasury', lang)),
        ],
      ),
    );
  }

  Widget _buildStoreHome(String lang) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final item = products[index];
        return Card(
          elevation: 3,
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            leading: const CircleAvatar(
              backgroundColor: Color(0xFFFFD700),
              child: Icon(Icons.shopping_bag, color: Colors.deepPurple),
            ),
            title: Text('${item['brand']} - ${item['title']}'),
            subtitle: Text('\$${item['priceUSD']}  |  ${item['priceEVX']} EVX'),
            trailing: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
              onPressed: () {
                double price = double.parse(item['priceEVX']!);
                if (widget.userEVXBalance >= price) {
                  widget.onBalanceChanged(widget.userEVXBalance - price, widget.masterTreasuryBalance + price);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(AppTexts.get('purchase_success', lang))),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(AppTexts.get('insufficient_balance', lang))),
                  );
                }
              },
              child: Text(AppTexts.get('buy', lang), style: const TextStyle(color: Colors.white)),
            ),
          ),
        );
      },
    );
  }

  Widget _buildWalletPage(String lang) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Color(0xFF4A148C), Color(0xFF7B1FA2)]),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(AppTexts.get('gold_balance_title', lang), style: const TextStyle(color: Colors.white70)),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.monetization_on, color: Color(0xFFFFD700), size: 36),
                      const SizedBox(width: 10),
                      Text(
                        '${widget.userEVXBalance.toStringAsFixed(0)} EVX',
                        style: const TextStyle(color: Color(0xFFFFD700), fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const Divider(color: Colors.white24),
                  Text('${AppTexts.get('your_acc', lang)}${widget.userAccountNumber}', style: const TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Column(
            children: [
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFD700),
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: () => _showBankakDialog(lang),
                icon: const Icon(Icons.account_balance, color: Colors.deepPurple),
                label: Text(
                  AppTexts.get('buy_bankak', lang),
                  style: const TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ),
              const SizedBox(height: 12),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: () => _showDirectCardPayDialog(lang),
                icon: const Icon(Icons.credit_card, color: Colors.white),
                label: Text(
                  AppTexts.get('direct_card_pay', lang),
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildMasterTreasuryPage(String lang) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Card(
            color: Colors.black87,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.stars, color: Color(0xFFFFD700)),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          AppTexts.get('treasury_title', lang),
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Text(
                    '${widget.masterTreasuryBalance.toStringAsFixed(0)} EVX',
                    style: const TextStyle(color: Color(0xFFFFD700), fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(AppTexts.get('available_reserve', lang), style: const TextStyle(color: Colors.grey)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green, minimumSize: const Size(double.infinity, 50)),
            onPressed: () {
              widget.onBalanceChanged(widget.userEVXBalance, widget.masterTreasuryBalance + 100000);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(AppTexts.get('mint_success', lang))),
              );
            },
            icon: const Icon(Icons.precision_manufacturing, color: Colors.white),
            label: Text(AppTexts.get('run_mint', lang), style: const TextStyle(color: Colors.white, fontSize: 15)),
          )
        ],
      ),
    );
  }

  // --- نافذة الشراء عبر تطبيق بنكك ---
  void _showBankakDialog(String lang) {
    final TextEditingController amountController = TextEditingController();
    final TextEditingController refController = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(AppTexts.get('bankak_dialog_title', lang)),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppTexts.get('bankak_acc_owner', lang)),
              const SelectableText('walid elsedig ibrahim mahmoud', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple)),
              const SizedBox(height: 8),
              Text(AppTexts.get('bankak_acc', lang)),
              const SelectableText('SD5604030517140001', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.deepPurple)),
              const SizedBox(height: 8),
              Text(AppTexts.get('exchange_rate', lang)),
              const SizedBox(height: 12),
              TextField(
                controller: amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: AppTexts.get('amount_req', lang), border: const OutlineInputBorder()),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: refController,
                decoration: InputDecoration(labelText: AppTexts.get('trx_ref', lang), border: const OutlineInputBorder()),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: Text(AppTexts.get('cancel', lang))),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
            onPressed: () {
              double coins = double.tryParse(amountController.text) ?? 0.0;
              if (coins > 0 && widget.masterTreasuryBalance >= coins) {
                widget.onBalanceChanged(widget.userEVXBalance + coins, widget.masterTreasuryBalance - coins);
                Navigator.pop(ctx);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(AppTexts.get('minted_to_user', lang))),
                );
              }
            },
            child: Text(AppTexts.get('complete_mint', lang), style: const TextStyle(color: Colors.deepPurple)),
          )
        ],
      ),
    );
  }

  // --- نافذة الخصم المباشر بالبطاقات (Direct Debit Gateway) ---
  void _showDirectCardPayDialog(String lang) {
    final TextEditingController cardNumController = TextEditingController();
    final TextEditingController amountController = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(AppTexts.get('card_dialog_title', lang)),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: AppTexts.get('amount_req', lang), border: const OutlineInputBorder()),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: cardNumController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: AppTexts.get('card_num', lang), prefixIcon: const Icon(Icons.credit_card), border: const OutlineInputBorder()),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(labelText: AppTexts.get('exp_date', lang), border: const OutlineInputBorder()),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(labelText: AppTexts.get('cvv', lang), border: const OutlineInputBorder()),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: Text(AppTexts.get('cancel', lang))),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
            onPressed: () {
              double coins = double.tryParse(amountController.text) ?? 0.0;
              if (coins > 0 && widget.masterTreasuryBalance >= coins) {
                widget.onBalanceChanged(widget.userEVXBalance + coins, widget.masterTreasuryBalance - coins);
                Navigator.pop(ctx);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(AppTexts.get('direct_pay_success', lang))),
                );
              }
            },
            child: Text(AppTexts.get('pay_now', lang), style: const TextStyle(color: Colors.white)),
          )
        ],
      ),
    );
  }
}

// --- Watermark Component ---
class WatermarkBackground extends StatelessWidget {
  const WatermarkBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Container(
        color: const Color(0xFFF3E5F5),
        child: Center(
          child: Transform.rotate(
            angle: -0.4,
            child: Text(
              'EVX OFFICIAL AUTHENTIC\nUNDUPLICATED SECURE',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple.withOpacity(0.04),
                letterSpacing: 2.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
