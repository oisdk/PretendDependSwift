/// `Nat` is an empty protocol: it represents the natural numbers.
public protocol Nat { init() }
/// Zero is a conrete type, representing the first natural number.
public struct Zero : Nat { public init() {} }
/// NonZero is a protocol for natural numbers. It has one requirement: it must have a
/// predecessor. Zero is the only number that does not conform.
public protocol NonZero: Nat { typealias Pred: Nat }
/// Succ is a number that is a successor to its generic type N.
public struct Succ<N : Nat> : NonZero {
  public typealias Pred = N
  public init() {}
}

public typealias One   = Succ<Zero>
public typealias Two   = Succ<One>
public typealias Three = Succ<Two>
public typealias Four  = Succ<Three>
public typealias Five  = Succ<Four>
public typealias Six   = Succ<Five>
public typealias Seven = Succ<Six>
public typealias Eight = Succ<Seven>
public typealias Nine  = Succ<Eight>

/**
Type-level arithmetic.

Using these structs allows very basic addition on num types. The type alias `Result`
corresponds to the retult of the addition.

AddFive<Three>.Result // Eight
*/

public struct AddOne  <N : Nat> { public typealias Result = Succ<N>                  }
public struct AddTwo  <N : Nat> { public typealias Result = Succ<AddOne<N>.Result>   }
public struct AddThree<N : Nat> { public typealias Result = Succ<AddTwo<N>.Result>   }
public struct AddFour <N : Nat> { public typealias Result = Succ<AddThree<N>.Result> }
public struct AddFive <N : Nat> { public typealias Result = Succ<AddFour<N>.Result>  }
public struct AddSix  <N : Nat> { public typealias Result = Succ<AddFive<N>.Result>  }
public struct AddSeven<N : Nat> { public typealias Result = Succ<AddSix<N>.Result>   }
public struct AddEight<N : Nat> { public typealias Result = Succ<AddSeven<N>.Result> }
public struct AddNine <N : Nat> { public typealias Result = Succ<AddEight<N>.Result> }

public protocol Binary {
  typealias A : Nat
  typealias B : Nat
}

public struct Op<E0: Nat, E1: Nat> : Binary {
  public typealias A = E0
  public typealias B = E1
}

public struct EQ {}
public struct GT {}
public struct LT {}

public extension Binary where A == B {
  init() {self.init()}
  var sub: Zero { return Zero() }
  var com: EQ { return EQ() }
}
public extension Binary where A == Succ<B> {
  init() {self.init()}
  var sub: One { return One() }
  var com: GT { return GT() }
}
public extension Binary where A == Succ<Succ<B>> {
  init() {self.init()}
  var sub: Two { return Two() }
  var com: GT { return GT() }
}
public extension Binary where A == Succ<Succ<Succ<B>>> {
  init() {self.init()}
  var sub: Three { return Three() }
  var com: GT { return GT() }
}
public extension Binary where A == Succ<Succ<Succ<Succ<B>>>> {
  init() {self.init()}
  var sub: Four { return Four() }
  var com: GT { return GT() }
}
public extension Binary where A == Succ<Succ<Succ<Succ<Succ<B>>>>> {
  init() {self.init()}
  var sub: Five { return Five() }
  var com: GT { return GT() }
}
public extension Binary where A == Succ<Succ<Succ<Succ<Succ<Succ<B>>>>>> {
  init() {self.init()}
  var sub: Six { return Six() }
  var com: GT { return GT() }
}
public extension Binary where A == Succ<Succ<Succ<Succ<Succ<Succ<Succ<B>>>>>>> {
  init() {self.init()}
  var sub: Seven { return Seven() }
  var com: GT { return GT() }
}
public extension Binary where A == Succ<Succ<Succ<Succ<Succ<Succ<Succ<Succ<B>>>>>>>> {
  init() {self.init()}
  var sub: Eight { return Eight() }
  var com: GT { return GT() }
}
public extension Binary where A == Succ<Succ<Succ<Succ<Succ<Succ<Succ<Succ<Succ<B>>>>>>>>> {
  init() {self.init()}
  var sub: Nine { return Nine() }
  var com: GT { return GT() }
}
public struct Neg {}
public extension Binary {
  init() {self.init()}
  var sub: Neg { return Neg() }
  var com: LT { return LT() }
}