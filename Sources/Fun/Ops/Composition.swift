public func <<< <Root, Input, Output>(
  f: @escaping (Root) -> (Input) -> Output,
  input: Input
) -> (Root) -> Output {
  { root in
    f(root)(input)
  }
}

/// Compose two functions together into a new function that takes in the input of the first function and spits out the output of the second function.
///
/// The following statements are all equivalent
/// ```
/// a |> f >>> g
/// (f >>> g)(a)
/// (f(_:) >>> g(_:))(a)
/// g(f(a))
/// ```
///
/// A further example:
///
/// ```
/// func halveAsDouble(_ input: Int) -> Double {
///   Double(input) * 0.5
/// }
///
/// let halvedString = halveAsDouble >>> String.init(_:)
/// 5 |> halvedString   // 2.5
/// // equivalent to:
/// // halvedString(5)
/// // 5 |> halveAsDouble >>> String.init(_:)
/// // String(halveAsDouble(5))
/// ```
///
/// This can be especially useful in chaining several `map` operations. Often, using map several times in a row (e.g., `collection.map(addRelativePath).map(trimURLString).map(NetworkRequest.init)`) could lead to performance issues since it must loop through the collection with each use of `map`. This could be solved by using this operator (e.g., `collection.map(addRelativePath >>> trimURLString >>> NetworkRequest.init)`).
public func >>> <A, B, C>(
  _ f: @escaping (A) -> B,
  _ g: @escaping (B) -> C
) -> (A) -> C {
  { a in g(f(a)) }
}

public func >>> <A, B, C>(
  keyPath: KeyPath<A, B>,
  f: @escaping (B) -> C
) -> (A) -> C {
  { a in f(a[keyPath: keyPath]) }
}

public func >>> <A, B, C>(
  f: @escaping (A) -> B,
  keyPath: KeyPath<B, C>
) -> (A) -> C {
  { a in f(a)[keyPath: keyPath] }
}

/// Composes two closures/functions which modify a mutable `inout` parameter.
/// - Parameters:
///   - lhs: A closure which modifies the provided `inout` parameter.
///   - rhs: A closure of the same mutable type.
/// - Returns: A closure which applies both original closures consecutively.
public func <> <Item>(
  _ lhs: @escaping (inout Item) -> Void,
  _ rhs: @escaping (inout Item) -> Void
) -> (inout Item) -> Void {
  { item in
    lhs(&item)
    rhs(&item)
  }
}
