class Node<T> {
  T value;
  Node<T>? next;
  //constructor
  Node({required this.value, this.next});
  
  @override
  String toString() {
    if (next == null) return '$value';
    return '$value -> ${next.toString()}';
  }
}


class LinkedList<E> {
  Node<E>? head;
  Node<E>? tail;

  bool get isEmpty => head == null;

  @override
  String toString() {
    if (isEmpty) return 'Empty list';
    return head.toString();
  }

  //Pushing to the Front of a List
  void push(E value) {
    head = Node(value: value, next: head);
    tail ??= head;
  }
  
  //Appending to the End of a List
  void append(E value) {
    // 1
    if (isEmpty) {
       push(value);
       return;
     }

      // 2
      tail!.next = Node(value: value);

      // 3
      tail = tail!.next;
  }


  //Inserting in Middle of a List,returns a node at given index
  Node<E>? nodeAt(int index) {
      // 1
      var currentNode = head;
      var currentIndex = 0;

      // 2
      while (currentNode != null && currentIndex < index) {
        currentNode = currentNode.next;
        currentIndex += 1;
      }
      return currentNode;
  }

  //insert after a node 
  Node<E> insertAfter(Node<E> node, E value) {
      // 1
      if (tail == node) {
        append(value);
        return tail!;
      }

      // 2
      node.next = Node(value: value, next: node.next);
      return node.next!;
  }


  //Removing Values From a List
  //1.Popping From the Front of a List
  E? pop() {
    final value = head?.value;
    head = head?.next;
    if (isEmpty) {
      tail = null;
    }
    return value;
  }

  //2.Removing From the End of a List
  E? removeLast() {
    // 1
    if (head?.next == null) return pop();

    // 2
    var current = head;
    while (current!.next != tail) {
      current = current.next;
    }

    // 3
    final value = tail?.value;
    tail = current;
    tail?.next = null;
    return value;
  }

//3.Removing a Value From the Middle of a List
E? removeAfter(Node<E> node) {
  final value = node.next?.value;
  if (node.next == tail) {
    tail = node;
  }
  node.next = node.next?.next;
  return value;
}


}
