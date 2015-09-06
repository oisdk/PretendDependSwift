import PretendDependSwift
//: This is a small framework that allows some pseudo-dependent typing. The first tool is the `Nat` protocol: it represents the
//: natural numbers. The numbers zero to nine are given names:
Zero()
One()
Five()
//: However, those are just typealiases. Each number is just the `Succ` struct nested n times over `Zero`.
One.self == Succ<Zero>.self
Three.self == Succ<Succ<Succ<Zero>>>.self
//: Some basic arithmetic can be performed
AddFour<Three>.Result.self == Seven.self
//: A length-indexed array has been implemented using this num type:
let ar = emptyArray() +| 1 +| 2 +| 3
for i in ar {
  print(i)
}
//: It works like a normal array, except that its length cannot be mutated. Its members can be mutated, however, via indexing:
var mutAr = emptyArray() +| 1 +| 2 +| 3
mutAr[0] = 0
mutAr
//: Appending, preppending, and removal of elements works by returning a whole new array, rather than mutating the original in-place
var toChop = emptyArray() +| 1 +| 2 +| 3 +| 4 +| 5
toChop.appended(100)
toChop.removeLast()
//: Removal operations are only defined on arrays that are not empty
let sizeOne = emptyArray() +| 1
let empty = sizeOne.removeLast().1
//: There are a number of functions that use the constant-size property of these arrays to yield efifciency benefits. For instance, `zip` will only take arrays of the same length, which allows for slightly faster iteration. `zipWith` is a function that acts like a chained `zip` and `map`:
let frst = emptyArray() +| 1  +| 2  +| 3  +| 4  +| 5
let scnd = emptyArray() +| 10 +| 20 +| 30 +| 40 +| 50
zipWith(frst, scnd, combine: +)
//: Their constant size makes `ConstArray`s particularly suited to matrix manipulation:
let mat = emptyArray() +| frst +| scnd
transpose(mat)
