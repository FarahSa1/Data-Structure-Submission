import 'linked_list.dart';
import 'stack.dart';

void main() {
  print('*********************Stack Challenges***********************');
  //(STACK)
  //Challenge 1: Reverse a List (STACK)
  final list = ['Farah', 'Lina', 'Omar', 'Yousef'];
  print('Original List: $list');
  print('\nReversed Output:');
  printListInReverse(list);

  print('');
  // Challenge 2: Balance the Parentheses (STACK)
  print(isBalancedParentheses('h((e))llo(world)()')); // true
  print(isBalancedParentheses('(hello world')); // false


  print('*********************Linked List Challenges*********************');
  //(LINKED_LIST)
  // Challenge 1: Print in Reverse (LINKED_LIST)
  final linkedList = LinkedList<int>();
  linkedList.append(1);
  linkedList.append(2);
  linkedList.append(3);
  linkedList.append(4);
  linkedList.append(5);
  linkedList.append(2);
  linkedList.append(2);
  linkedList.append(6);

  print('Original List:');
  print(linkedList);

  print('\nReversed Output:');
  printInReverse(linkedList);

  //Challenge 2: Find the Middle Node (LINKED_LIST)
  final middle = findMiddleNode(linkedList);
  print('\nMiddle Node:');
  print(middle?.value); // Should print 5

  //Challenge 3: Reverse a Linked List  (LINKED_LIST)
  reverseLinkedList(linkedList);
  print('\nReversed List:');
  print(linkedList);

  //Challenge 4: Remove All Occurrences (LINKED_LIST)
  removeAllOccurrences(linkedList, 2);
  print('\nAfter removing number 2:');
  print(linkedList);
}

//*******************************************************Stack Challenges************************************************************************ */
//Challenge 1: Reverse a List
void printListInReverse<E>(List<E> list) {
  final stack = Stack<E>();
  // Push all items from the list into the stack
  for (final item in list) {
    stack.push(item);
  }
  // Pop items from the stack and print them (LIFO order)
  while (!stack.isEmpty) {
    print(stack.pop());
  }
}

// Challenge 2: Balance the Parentheses
bool isBalancedParentheses(String input) {
  final stack = Stack<String>(); // Create a stack for tracking parentheses
  for (var char in input.split('')) {
    if (char == '(') {
      stack.push(char); // Push opening parentheses
    } else if (char == ')') {
      if (stack.isEmpty) {
        return false; // Unmatched closing parenthesis
      }
      stack.pop(); // Match with the last opening parenthesis
    }
  }
  return stack
      .isEmpty; // If stack is empty => all parentheses matched correctly
}

//*******************************************************LinkedList Challenges************************************************************************ */

//Challenge 1: Print in Reverse
void printInReverse<E>(LinkedList<E> list) {
  final stack = <E>[];
  // Step 1: Traverse the list and push each value into the stack
  var current = list.head;
  while (current != null) {
    stack.add(current.value);
    current = current.next;
  }
  // Step 2: Pop values from the stack and print them
  while (stack.isNotEmpty) {
    print(stack.removeLast());
  }
}

//Challenge 2: Find the Middle Node
Node<E>? findMiddleNode<E>(LinkedList<E> list) {
  var slow = list.head;
  var fast = list.head;
  // Move 'fast' two steps and 'slow' one step
  while (fast != null && fast.next != null) {
    slow = slow?.next;
    fast = fast.next?.next;
  }
  return slow; // Slow is now at the middle
}

//Challenge 3: Reverse a Linked List
void reverseLinkedList<E>(LinkedList<E> list) {
  Node<E>? previous;
  var current = list.head;
  list.tail = list.head; // الرأس سيصبح الذيل الجديد
  while (current != null) {
    final next = current.next; // نحفظ العقدة التالية مؤقتًا
    current.next = previous; // نعكس الرابط
    previous = current; // نتقدم إلى الأمام
    current = next;
  }
  list.head = previous; // العقدة الأخيرة تصبح الرأس الجديد
}

//Challenge 4: Remove All Occurrences
void removeAllOccurrences<E>(LinkedList<E> list, E value) {
  // Step 1: Remove matching values from the head
  while (list.head != null && list.head!.value == value) {
    list.pop(); // تزيل من الأمام
  }
  // Step 2: Traverse and remove matching nodes from the rest
  var current = list.head;
  while (current?.next != null) {
    if (current!.next!.value == value) {
      list.removeAfter(current);
    } else {
      current = current.next;
    }
  }
}
