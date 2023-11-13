class Slot {
  final int id;
  final String name;
  final bool isAvailable;

  const Slot({required this.id, required this.name, required this.isAvailable});
}

class SlotList {
  static List<Slot> list() {
    const data = <Slot>[
      Slot(id: 1, name: 'A1', isAvailable: true),
      Slot(id: 2, name: 'A2', isAvailable: true),
      Slot(id: 3, name: 'A3', isAvailable: true),
      Slot(id: 4, name: 'B1', isAvailable: true),
      Slot(id: 5, name: 'B2', isAvailable: true),
      Slot(id: 6, name: 'B3', isAvailable: true),
      Slot(id: 7, name: 'C1', isAvailable: true),
      Slot(id: 8, name: 'C2', isAvailable: true),
      Slot(id: 9, name: 'C3', isAvailable: false),
      Slot(id: 10, name: 'D1', isAvailable: false),
      Slot(id: 11, name: 'D2', isAvailable: true),
      Slot(id: 12, name: 'D3', isAvailable: true),
      Slot(id: 13, name: 'E1', isAvailable: true),
      Slot(id: 14, name: 'E2', isAvailable: true),
      Slot(id: 15, name: 'E3', isAvailable: true),
      Slot(id: 16, name: 'F1', isAvailable: true),
      Slot(id: 17, name: 'F2', isAvailable: true),
      Slot(id: 18, name: 'F3', isAvailable: true),
      Slot(id: 19, name: 'G1', isAvailable: true),
      Slot(id: 20, name: 'G2', isAvailable: true),
    ];
    return data;
  }
}
