public class Node<Value> {
  public var value: Value
  public var next: Node? // optional val, can be nil

  public init(value: Value, next: Node? = nil) {
    self.value = value
    self.next = next
  }
}

extension Node: CustomStringConvertible { // расширяем класс, подключая протокол
  public var description: String {
    guard let next = next else {
        return "\(value)"
    }
    return "\(value) -> " + String(describing: next) + " "
  }
}


// example(of: "creating and linking nodes") {
  let node1 = Node(value: 1)
  let node2 = Node(value: 2)
  let node3 = Node(value: 3)

  node1.next = node2
  node2.next = node3

  print(node1)
// }

public struct LinkedList<Value> {
  public var head: Node<Value>?
  public var tail: Node<Value>?

  public init() {}

  public var isEmpty: Bool {
    return head == nil
  }

  public mutating func push(_ value: Value) {
    head = Node(value: value, next: head)
    if tail == nil {
      tail = head
    }
  }
}

extension LinkedList: CustomStringConvertible {
  public var description: String {
    guard let head = head else {
        return "Empty list"
    }
    return String(describing: head)
  }
}
