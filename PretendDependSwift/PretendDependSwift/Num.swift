public protocol Nat { init() }
public struct Zero : Nat { public init() {} }
public protocol NonZero: Nat { typealias Pred: Nat }
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

public struct AddOne  <N : Nat> { typealias Result = Succ<N>                  }
public struct AddTwo  <N : Nat> { typealias Result = Succ<AddOne<N>.Result>   }
public struct AddThree<N : Nat> { typealias Result = Succ<AddTwo<N>.Result>   }
public struct AddFour <N : Nat> { typealias Result = Succ<AddThree<N>.Result> }
public struct AddFive <N : Nat> { typealias Result = Succ<AddFour<N>.Result>  }
public struct AddSix  <N : Nat> { typealias Result = Succ<AddFive<N>.Result>  }
public struct AddSeven<N : Nat> { typealias Result = Succ<AddSix<N>.Result>   }
public struct AddEight<N : Nat> { typealias Result = Succ<AddSeven<N>.Result> }
public struct AddNine <N : Nat> { typealias Result = Succ<AddEight<N>.Result> }

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
  var sub: Zero { return Zero() }
  var com: EQ { return EQ() }
}
public extension Binary where A == Succ<B> {
  var sub: One { return One() }
  var com: GT { return GT() }
}
public extension Binary where A == Succ<Succ<B>> {
  var sub: Two { return Two() }
  var com: GT { return GT() }
}
public extension Binary where A == Succ<Succ<Succ<B>>> {
  var sub: Three { return Three() }
  var com: GT { return GT() }
}
public extension Binary where A == Succ<Succ<Succ<Succ<B>>>> {
  var sub: Four { return Four() }
  var com: GT { return GT() }
}
public extension Binary where A == Succ<Succ<Succ<Succ<Succ<B>>>>> {
  var sub: Five { return Five() }
  var com: GT { return GT() }
}
public extension Binary where A == Succ<Succ<Succ<Succ<Succ<Succ<B>>>>>> {
  var sub: Six { return Six() }
  var com: GT { return GT() }
}
public extension Binary where A == Succ<Succ<Succ<Succ<Succ<Succ<Succ<B>>>>>>> {
  var sub: Seven { return Seven() }
  var com: GT { return GT() }
}
public extension Binary where A == Succ<Succ<Succ<Succ<Succ<Succ<Succ<Succ<B>>>>>>>> {
  var sub: Eight { return Eight() }
  var com: GT { return GT() }
}
public extension Binary where A == Succ<Succ<Succ<Succ<Succ<Succ<Succ<Succ<Succ<B>>>>>>>>> {
  var sub: Nine { return Nine() }
  var com: GT { return GT() }
}
public struct Neg {}
public extension Binary {
  var sub: Neg { return Neg() }
  var com: LT { return LT() }
}