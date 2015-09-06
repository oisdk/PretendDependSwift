public struct ConstArray<Element, Count : Nat> {
  private var contents: [Element]
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