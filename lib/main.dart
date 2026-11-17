import 'package:flutter/material.dart';

void main() => runApp(const KhadamatiApp());

const navy = Color(0xFF102C46);
const gold = Color(0xFFB18A43);
const cream = Color(0xFFF7F5F0);

class KhadamatiApp extends StatefulWidget {
  const KhadamatiApp({super.key});
  @override
  State<KhadamatiApp> createState() => _KhadamatiAppState();
}

class _KhadamatiAppState extends State<KhadamatiApp> {
  String language = 'ar';
  final List<ServiceRequest> requests = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'يوختو منان / خدماتي',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: cream,
        colorScheme: ColorScheme.fromSeed(seedColor: navy, primary: navy, secondary: gold),
        appBarTheme: const AppBarTheme(backgroundColor: navy, foregroundColor: Colors.white),
        fontFamily: 'Roboto',
      ),
      home: HomeShell(
        language: language,
        onLanguageChanged: (v) => setState(() => language = v),
        requests: requests,
        onRequest: (r) => setState(() => requests.insert(0, r)),
      ),
    );
  }
}

class ServiceRequest {
  final String service, area, address, details;
  final DateTime createdAt;
  ServiceRequest(this.service, this.area, this.address, this.details)
      : createdAt = DateTime.now();
}

class T {
  static const Map<String, Map<String, String>> words = {
    'ar': {
      'brand':'يوختو منان', 'sub':'خدماتي', 'tag':'كل خدماتك… بمكان واحد',
      'hello':'أهلاً بك', 'question':'شنو الخدمة اللي تحتاجها اليوم؟',
      'search':'ابحث عن خدمة', 'categories':'الأقسام الرئيسية',
      'popular':'خدمات قريبة منك', 'request':'اطلب الخدمة', 'orders':'طلباتي',
      'account':'حسابي', 'home':'الرئيسية', 'more':'المزيد',
      'electric':'كهربائيات', 'plumbing':'سباكة', 'maintenance':'صيانة',
      'internet':'إنترنت', 'delivery':'توصيل', 'cooling':'تبريد',
      'cars':'سيارات', 'painting':'صبغ', 'choose':'اختيار الخدمة',
      'area':'المنطقة', 'address':'العنوان بالتفصيل',
      'details':'اشرح شنو تحتاج', 'send':'إرسال الطلب',
      'cash':'الدفع نقداً عند إتمام الخدمة', 'empty':'ما عندك طلبات حالياً',
      'sent':'تم تسجيل الطلب على هذا الجهاز', 'new':'جديد',
      'profile':'الملف الشخصي', 'role':'نوع الحساب',
      'customer':'زبون', 'provider':'مقدم خدمة', 'admin':'إدارة التطبيق',
      'language':'اللغة', 'kir':'كركوك', 'taza':'ناحية تازة',
      'selectArea':'اختر المنطقة', 'required':'يرجى ملء الحقول المطلوبة',
      'requestTitle':'طلب خدمة جديد', 'status':'حالة الطلب',
      'note':'هذه نسخة تجريبية؛ الطلب لا يُرسل لمقدم خدمة بعد.',
      'phone':'رقم الهاتف', 'login':'تسجيل الدخول قريباً',
    },
    'tk': {
      'brand':'يوختو منان', 'sub':'خدماتي', 'tag':'خدماتڭىز… بىر يەرده',
      'hello':'خوش گەلديڭيز', 'question':'بۈگۈن قايسى خىزمەت كېرەك؟',
      'search':'خىزمەت ئىزدەڭ', 'categories':'باش خىزمەتلەر',
      'popular':'سىزگە يېقىن خىزمەتلەر', 'request':'خىزمەت سوراڭ', 'orders':'سوراقلىرىم',
      'account':'ھېسابىم', 'home':'باش بەت', 'more':'تېخىمۇ كۆپ',
      'electric':'ئېلېكترىك', 'plumbing':'سۇ تۇرۇبىسى', 'maintenance':'رېمونت',
      'internet':'ئىنتېرنېت', 'delivery':'يەتكۈزۈش', 'cooling':'سوۋۇتۇش',
      'cars':'ماشىنا', 'painting':'بوياش', 'choose':'خىزمەت تاللاڭ',
      'area':'رايون', 'address':'تولۇق ئادرېس',
      'details':'كېرەكلىك ئىشنى چۈشەندۈرۈڭ', 'send':'سوراق ئەۋەتىش',
      'cash':'خىزمەت تاماملانغاندا نەق پۇل', 'empty':'ھازىرچە سوراق يوق',
      'sent':'سوراق بۇ ئۈسكۈنىگە قوشۇلدى', 'new':'يېڭى',
      'profile':'شەخسىي بەت', 'role':'ھېساب تۈرى',
      'customer':'خېرىدار', 'provider':'خىزمەت قىلغۇچى', 'admin':'باشقۇرۇش',
      'language':'تىل', 'kir':'كەركۈك', 'taza':'تازە ناھىيەسى',
      'selectArea':'رايون تاللاڭ', 'required':'زۆرۈر بۆلەكلەرنى تولدۇرۇڭ',
      'requestTitle':'يېڭى خىزمەت سورىقى', 'status':'سوراق ھالىتى',
      'note':'بۇ سىناق نۇسخىسى؛ سوراق تېخى خىزمەت قىلغۇچىغا يوللانمايدۇ.',
      'phone':'تېلېفون نومۇرى', 'login':'كىرىش كېيىن قوشۇلىدۇ',
    }
  };
  static String of(String lang, String key) => words[lang]?[key] ?? words['ar']![key] ?? key;
}

class HomeShell extends StatefulWidget {
  final String language;
  final ValueChanged<String> onLanguageChanged;
  final List<ServiceRequest> requests;
  final ValueChanged<ServiceRequest> onRequest;
  const HomeShell({super.key, required this.language, required this.onLanguageChanged,
    required this.requests, required this.onRequest});
  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int tab = 0;
  String get l => widget.language;
  String t(String k) => T.of(l, k);

  @override
  Widget build(BuildContext context) {
    final pages = [
      _home(),
      OrdersPage(language: l, requests: widget.requests),
      ProfilePage(language: l, onLanguageChanged: widget.onLanguageChanged),
    ];
    return Directionality(
      textDirection: l == 'ar' ? TextDirection.rtl : TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Row(children: [
            const Icon(Icons.handshake_rounded, color: gold, size: 28),
            const SizedBox(width: 9),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(t('brand'), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              Text(t('sub'), style: const TextStyle(fontSize: 11, color: Color(0xFFE4C98D))),
            ]),
          ]),
          actions: [
            IconButton(onPressed: () => _showLanguage(), icon: const Icon(Icons.translate)),
          ],
        ),
        body: pages[tab],
        bottomNavigationBar: NavigationBar(
          selectedIndex: tab,
          onDestinationSelected: (v) => setState(() => tab = v),
          destinations: [
            NavigationDestination(icon: const Icon(Icons.home_outlined), label: t('home')),
            NavigationDestination(icon: const Icon(Icons.receipt_long_outlined), label: t('orders')),
            NavigationDestination(icon: const Icon(Icons.person_outline), label: t('account')),
          ],
        ),
      ),
    );
  }

  Widget _home() {
    final items = [
      ('electric', Icons.electrical_services), ('plumbing', Icons.plumbing),
      ('maintenance', Icons.handyman), ('internet', Icons.wifi),
      ('delivery', Icons.delivery_dining), ('cooling', Icons.ac_unit),
      ('cars', Icons.directions_car), ('painting', Icons.format_paint),
    ];
    return ListView(padding: const EdgeInsets.all(16), children: [
      Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [navy, Color(0xFF1D496B)]),
          borderRadius: BorderRadius.circular(22),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(t('hello'), style: const TextStyle(color: Colors.white70)),
          const SizedBox(height: 8),
          Text(t('question'), style: const TextStyle(color: Colors.white, fontSize: 21, fontWeight: FontWeight.bold)),
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: Row(children: [const Icon(Icons.search, color: navy), const SizedBox(width: 8),
              Text(t('search'), style: const TextStyle(color: Colors.black54))]),
          ),
          const SizedBox(height: 12),
          Row(children: [const Icon(Icons.location_on, color: gold, size: 17),
            Text(' ${t('kir')} • ${t('taza')}', style: const TextStyle(color: Colors.white70, fontSize: 12))]),
        ]),
      ),
      const SizedBox(height: 22),
      Text(t('categories'), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: navy)),
      const SizedBox(height: 12),
      GridView.builder(
        shrinkWrap: true, physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length, gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 11, crossAxisSpacing: 11, childAspectRatio: 1.7),
        itemBuilder: (context, i) {
          final item = items[i];
          return InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () => _openRequest(t(item.$1)),
            child: Container(
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFE9E3D8))),
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                CircleAvatar(backgroundColor: const Color(0xFFF4EBDD), child: Icon(item.$2, color: gold)),
                const SizedBox(width: 10),
                Flexible(child: Text(t(item.$1), style: const TextStyle(fontWeight: FontWeight.w600, color: navy))),
              ]),
            ),
          );
        },
      ),
      const SizedBox(height: 18),
      Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: const Color(0xFFECE6DA), borderRadius: BorderRadius.circular(16)),
        child: Row(children: [
          const Icon(Icons.support_agent, color: navy, size: 30),
          const SizedBox(width: 12),
          Expanded(child: Text(t('cash'), style: const TextStyle(color: navy, fontWeight: FontWeight.w600))),
        ]),
      ),
    ]);
  }

  void _showLanguage() {
    showModalBottomSheet(context: context, builder: (_) => SafeArea(child: Column(mainAxisSize: MainAxisSize.min, children: [
      ListTile(leading: const Icon(Icons.language), title: const Text('العربية'), onTap: () { widget.onLanguageChanged('ar'); Navigator.pop(context); }),
      ListTile(leading: const Icon(Icons.language), title: const Text('تۈركمەنچە'), onTap: () { widget.onLanguageChanged('tk'); Navigator.pop(context); }),
    ])));
  }

  void _openRequest(String service) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => RequestPage(
      language: l, service: service, onSubmit: (r) {
        widget.onRequest(r); Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(t('sent'))));
      },
    )));
  }
}

class RequestPage extends StatefulWidget {
  final String language, service;
  final ValueChanged<ServiceRequest> onSubmit;
  const RequestPage({super.key, required this.language, required this.service, required this.onSubmit});
  @override
  State<RequestPage> createState() => _RequestPageState();
}
class _RequestPageState extends State<RequestPage> {
  final address = TextEditingController(), details = TextEditingController();
  String area = 'kir';
  String t(String k) => T.of(widget.language, k);
  @override
  void dispose() { address.dispose(); details.dispose(); super.dispose(); }
  @override
  Widget build(BuildContext context) => Directionality(
    textDirection: TextDirection.rtl,
    child: Scaffold(
      appBar: AppBar(title: Text(t('requestTitle'))),
      body: ListView(padding: const EdgeInsets.all(18), children: [
        Text(widget.service, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: navy)),
        const SizedBox(height: 18),
        Text(t('area'), style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: area, decoration: const InputDecoration(border: OutlineInputBorder()),
          items: [DropdownMenuItem(value:'kir', child:Text(t('kir'))), DropdownMenuItem(value:'taza', child:Text(t('taza')))],
          onChanged: (v) => setState(() => area = v ?? 'kir'),
        ),
        const SizedBox(height: 16),
        TextField(controller: address, decoration: InputDecoration(labelText: t('address'), border: const OutlineInputBorder())),
        const SizedBox(height: 16),
        TextField(controller: details, maxLines: 4, decoration: InputDecoration(labelText: t('details'), border: const OutlineInputBorder())),
        const SizedBox(height: 16),
        Container(padding: const EdgeInsets.all(14), decoration: BoxDecoration(color: const Color(0xFFF0E8D9), borderRadius: BorderRadius.circular(12)),
          child: Row(children: [const Icon(Icons.payments_outlined, color: navy), const SizedBox(width: 10), Expanded(child: Text(t('cash')))])),
        const SizedBox(height: 22),
        FilledButton.icon(
          style: FilledButton.styleFrom(backgroundColor: navy, padding: const EdgeInsets.all(16)),
          onPressed: () {
            if (address.text.trim().isEmpty || details.text.trim().isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(t('required')))); return;
            }
            widget.onSubmit(ServiceRequest(widget.service, t(area), address.text.trim(), details.text.trim()));
          },
          icon: const Icon(Icons.send), label: Text(t('send')),
        ),
        const SizedBox(height: 12),
        Text(t('note'), style: const TextStyle(color: Colors.black54, fontSize: 12)),
      ]),
    ),
  );
}

class OrdersPage extends StatelessWidget {
  final String language;
  final List<ServiceRequest> requests;
  const OrdersPage({super.key, required this.language, required this.requests});
  @override
  Widget build(BuildContext context) => Directionality(
    textDirection: TextDirection.rtl,
    child: requests.isEmpty
      ? Center(child: Text(T.of(language, 'empty'), style: const TextStyle(color: Colors.black54)))
      : ListView.builder(padding: const EdgeInsets.all(16), itemCount: requests.length, itemBuilder: (_, i) {
          final r = requests[i];
          return Card(child: ListTile(
            leading: const CircleAvatar(backgroundColor: Color(0xFFF4EBDD), child: Icon(Icons.receipt_long, color: gold)),
            title: Text(r.service, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('${r.area} • ${r.address}\n${r.details}'),
            isThreeLine: true, trailing: const Chip(label: Text('جديد')),
          ));
        }),
  );
}

class ProfilePage extends StatelessWidget {
  final String language;
  final ValueChanged<String> onLanguageChanged;
  const ProfilePage({super.key, required this.language, required this.onLanguageChanged});
  @override
  Widget build(BuildContext context) => Directionality(
    textDirection: TextDirection.rtl,
    child: ListView(padding: const EdgeInsets.all(18), children: [
      const CircleAvatar(radius: 38, backgroundColor: navy, child: Icon(Icons.person, color: Colors.white, size: 38)),
      const SizedBox(height: 12),
      Center(child: Text(T.of(language, 'profile'), style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
      const SizedBox(height: 18),
      Card(child: ListTile(leading: const Icon(Icons.phone), title: Text(T.of(language, 'phone')), subtitle: Text(T.of(language, 'login')))),
      Card(child: ListTile(leading: const Icon(Icons.language), title: Text(T.of(language, 'language')),
        trailing: DropdownButton<String>(value: language, items: const [
          DropdownMenuItem(value:'ar', child:Text('العربية')),
          DropdownMenuItem(value:'tk', child:Text('تۈركمەنچە')),
        ], onChanged: (v) { if (v != null) onLanguageChanged(v); }))),
      Card(child: ListTile(leading: const Icon(Icons.info_outline), title: const Text('يوختو منان / خدماتي'), subtitle: const Text('كركوك • ناحية تازة'))),
    ]),
  );
}
