public func zip<A, B, NN : Nat>(a: ConstArray<A, NN>, _ b: ConstArray<B, NN>) -> ConstArray<(A, B), NN> {
  return ConstArray<(A, B), NN>(contents: a.indices.map { i in (a[i], b[i]) })
}
public func zip<A, B, C, NN : Nat>(
  a: ConstArray<A, NN>,
  _ b: ConstArray<B, NN>,
  _ c: ConstArray<C, NN>
  ) -> ConstArray<(A, B, C), NN> {
  return ConstArray<(A, B, C), NN>(contents: a.indices.map { i in (a[i], b[i], c[i]) })
}

public func zipWith<A, B, T, C : Nat>
  (a: ConstArray<A, C>, _ b: ConstArray<B, C>, @noescape combine: (A, B) throws -> T)
  rethrows -> ConstArray<T, C> {
    return ConstArray<T, C>(contents:
      try a.indices.map { i in try combine(a[i], b[i]) }
    )
}

public func zipWith<A, B, C, T, NN : Nat>
  (a: ConstArray<A, NN>, _ b: ConstArray<B, NN>, _ c: ConstArray<C, NN>, @noescape combine: (A, B, C) throws -> T)
  rethrows -> ConstArray<T, NN> {
    return ConstArray<T, NN>(contents:
      try a.indices.map { i in try combine(a[i], b[i], c[i]) }
    )
}

public func transpose<E, X : Nat, Y : Nat>(mat: ConstArray<ConstArray<E, X>, Y>) -> ConstArray<ConstArray<E, Y>, X> {
  return ConstArray<ConstArray<E, Y>, X>(contents:
    mat[0].indices.map { i in mat.map { a in a[i] }}
  )
}