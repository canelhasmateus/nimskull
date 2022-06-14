discard """
description : " Generics in typedesc: required type Foo but of type: type Foo; #7734"
"""
type
  Foo[T: SomeFloat] = object
    learning_rate: T

  Model = object
    weight: int


proc optimizer[M; T: SomeFloat](model: M, _: typedesc[Foo], learning_rate: T): Foo[T] =
  result.learning_rate = learning_rate

let a = Model(weight: 1)
let opt = a.optimizer(Foo, 10.0)

