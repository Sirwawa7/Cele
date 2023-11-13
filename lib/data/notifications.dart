class Notifications {
  final int? id;
  final String? title;
  final String? subTitle;
  final String? time;

  const Notifications({this.id, this.title, this.subTitle, this.time});
}

class NotificationList {
  static List<Notifications> list() {
    const data = <Notifications>[
      Notifications(id: 1, title: 'Ticketing 20% Off', subTitle: 'Save big on your bus journey with our incredible discounts.', time: '1:45 PM'),
      Notifications(id: 2, title: 'Discount Max 10%', subTitle: 'Save big on your bus journey with our incredible discounts.', time: '10:20 AM'),
      Notifications(id: 3, title: 'Sunday Offer', subTitle: 'Save big on your bus journey with our incredible discounts.', time: '03:45 PM'),
      Notifications(id: 4, title: 'Star Sunday Offer', subTitle: 'Save big on your bus journey with our incredible discounts.', time: '07:20 AM'),
      Notifications(id: 5, title: 'Biggest Offer', subTitle: 'Save big on your bus journey with our incredible discounts.', time: '11:45 AM'),
      Notifications(id: 6, title: 'Black Friday', subTitle: 'Save big on your bus journey with our incredible discounts.', time: '10:20 PM'),
      Notifications(id: 11, title: 'Ticketing 20% Off', subTitle: 'Save big on your bus journey with our incredible discounts.', time: '1:45 PM'),
      Notifications(id: 12, title: 'Discount Max 10%', subTitle: 'Save big on your bus journey with our incredible discounts.', time: '10:20 AM'),
      Notifications(id: 30, title: 'Sunday Offer', subTitle: 'Save big on your bus journey with our incredible discounts.', time: '03:45 PM'),
      Notifications(id: 14, title: 'Star Sunday Offer', subTitle: 'Save big on your bus journey with our incredible discounts.', time: '07:20 AM'),
      Notifications(id: 51, title: 'Biggest Offer', subTitle: 'Save big on your bus journey with our incredible discounts.', time: '11:45 AM'),
      Notifications(id: 16, title: 'Black Friday', subTitle: 'Save big on your bus journey with our incredible discounts.', time: '10:20 PM'),
    ];
    return data;
  }
}
