public struct ConstArray<Element, Count : Nat> {
  internal var contents: [Element]
}

public func emptyArray<E>() -> ConstArray<E, Zero> { return ConstArray(contents: []) }
public extension ConstArray {
  func appended(with: Element) -> ConstArray<Element, Succ<Count>> {
    return ConstArray<Element, Succ<Count>>(contents: contents + [with])
  }
  func prepended(with: Element) -> ConstArray<Element, Succ<Count>> {
    return ConstArray<Element, Succ<Count>>(contents: [with] + contents)
  }
}

infix operator +| { associativity left precedence 90 }

public func +| <E, N : Nat>(lhs: ConstArray<E, N>, rhs: E) -> ConstArray<E, Succ<N>> {
  return lhs.appended(rhs)
}

infix operator |+ { associativity right precedence 90 }

public func |+ <E, N : Nat>(lhs: E, rhs: ConstArray<E, N>) -> ConstArray<E, Succ<N>> {
  return rhs.prepended(lhs)
}

extension ConstArray : CustomStringConvertible {
  public var description: String {
    return contents.description
  }
}

extension ConstArray : MutableSliceable {
  public var startIndex: Int { return contents.startIndex }
  public var endIndex: Int { return contents.endIndex }
  public subscript(i: Int) -> Element {
    get { return contents[i] }
    set { contents[i] = newValue }
  }
  public subscript(i: Range<Int>) -> ArraySlice<Element> {
    get { return contents[i] }
    set { contents[i] = newValue }
  }
}

public extension ConstArray where Count : NonZero {
  func removeLast() -> (Element, ConstArray<Element, Count.Pred>) {
    var temp = contents
    return (temp.removeLast(), ConstArray<Element, Count.Pred>(contents: temp))
  }
  func removeFirst() -> (Element, ConstArray<Element, Count.Pred>) {
    var temp = contents
    return (temp.removeFirst(), ConstArray<Element, Count.Pred>(contents: temp))
  }
  func removeAtIndex(i: Int) -> (Element, ConstArray<Element, Count.Pred>) {
    var temp = contents
    return (temp.removeAtIndex(i), ConstArray<Element, Count.Pred>(contents: temp))
  }
}

public extension ConstArray {
  func appendedContentsOf(a: ConstArray<Element, One>)
    -> ConstArray<Element, AddOne<Count>.Result> {
    return ConstArray<Element, AddOne<Count>.Result>(contents: contents + a.contents)
  }
  func appendedContentsOf(a: ConstArray<Element, Two>)
    -> ConstArray<Element, AddTwo<Count>.Result> {
    return ConstArray<Element, AddTwo<Count>.Result>(contents: contents + a.contents)
  }
  func appendedContentsOf(a: ConstArray<Element, Three>)
    -> ConstArray<Element, AddThree<Count>.Result> {
    return ConstArray<Element, AddThree<Count>.Result>(contents: contents + a.contents)
  }
  func appendedContentsOf(a: ConstArray<Element, Four>)
    -> ConstArray<Element, AddFour<Count>.Result> {
    return ConstArray<Element, AddFour<Count>.Result>(contents: contents + a.contents)
  }
  func appendedContentsOf(a: ConstArray<Element, Five>)
    -> ConstArray<Element, AddFive<Count>.Result> {
    return ConstArray<Element, AddFive<Count>.Result>(contents: contents + a.contents)
  }
  func appendedContentsOf(a: ConstArray<Element, Six>)
    -> ConstArray<Element, AddSix<Count>.Result> {
    return ConstArray<Element, AddSix<Count>.Result>(contents: contents + a.contents)
  }
  func appendedContentsOf(a: ConstArray<Element, Seven>)
    -> ConstArray<Element, AddSeven<Count>.Result> {
    return ConstArray<Element, AddSeven<Count>.Result>(contents: contents + a.contents)
  }
  func appendedContentsOf(a: ConstArray<Element, Eight>)
    -> ConstArray<Element, AddEight<Count>.Result> {
    return ConstArray<Element, AddEight<Count>.Result>(contents: contents + a.contents)
  }
  func appendedContentsOf(a: ConstArray<Element, Nine>)
    -> ConstArray<Element, AddNine<Count>.Result> {
    return ConstArray<Element, AddNine<Count>.Result>(contents: contents + a.contents)
  }
}

public extension ConstArray {
  func map<T>(@noescape transform: Element throws -> T) rethrows -> ConstArray<T, Count> {
    return ConstArray<T, Count>(contents: try contents.map(transform))
  }
  func reverse() -> ConstArray {
    return ConstArray(contents: contents)
  }
}

