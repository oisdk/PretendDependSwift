protocol _AnyTuple : CustomStringConvertible {
  var tDesc: String { get }
  var count: Int { get }
  typealias Arity : Nat
}

struct EmptyTuple {}

extension EmptyTuple : _AnyTuple {
  var description: String { return "()" }
  var tDesc: String { return  ")" }
  var count: Int { return 0 }
  typealias Arity = Zero
}

struct NonEmptyTuple<Element, Tail : _AnyTuple> { var (head, tail): (Element, Tail) }

extension NonEmptyTuple : _AnyTuple {
  var count: Int { return tail.count + 1 }
  var description: String {
    return "(" + String(reflecting: head) + tail.tDesc
  }
  var tDesc: String {
    return ", " + String(reflecting: head) + tail.tDesc
  }
  typealias Arity = Succ<Tail.Arity>
}

infix operator | { associativity right precedence 90 }

func |<E, T:_AnyTuple>(lhs: E, rhs: T) -> NonEmptyTuple<E, T> {
  return NonEmptyTuple(head: lhs, tail: rhs)
}

func |<E, T>(lhs: E, rhs: T) -> NonEmptyTuple<E, NonEmptyTuple<T, EmptyTuple>> {
  return NonEmptyTuple(head: lhs, tail: NonEmptyTuple(head: rhs, tail: EmptyTuple()))
}

protocol Tuple : _AnyTuple {
  typealias Head
  typealias Tail : _AnyTuple
  typealias Arity : NonZero
  var head : Head { get }
  var tail : Tail { get }
}

extension NonEmptyTuple : Tuple {}

extension Tuple {
  typealias First = Head
}
extension Tuple where Tail : Tuple {
  typealias Second = Tail.Head
}
extension Tuple where Tail : Tuple, Tail.Tail : Tuple {
  typealias Third = Tail.Tail.Head
}
