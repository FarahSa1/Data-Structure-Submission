class Stack<E> {
    final List<E> _storage;
    Stack() : _storage = <E>[];
    //OR
    // final _storage = <E>[];

    @override
    String toString() {
      return '--- Top ---\n'
          '${_storage.reversed.join('\n')}'
          '\n-----------';
    }

    void push(E element) => _storage.add(element);

    E pop() => _storage.removeLast();

    E get peek => _storage.last;

    bool get isEmpty => _storage.isEmpty;

    bool get isNotEmpty => !isEmpty;

}