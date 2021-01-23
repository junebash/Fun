/// Pipes the left hand item into a closure which takes it in.
///
/// This may look useless at first glance, but it can help avoid obnoxiously nested function calls,
/// especially when used with composition operators (e.g. '`>>>`').
///
/// ```
/// completion(.success(translate(data)))
/// ```
/// vs.
/// ```
/// let translated = translate(data)
/// let result = Result.success(translated)
/// completion(result)
/// ```
/// vs.
/// ```
/// data
///   |> translate
///   >>> Result.success
///   >>> completion
/// ```
///
public func |> <Input, Output>(
  _ input: Input,
  _ transform: (Input) throws -> Output
) rethrows -> Output {
  try transform(input)
}

public func => <Item>(_ item: inout Item, _ f: (inout Item) -> Void) {
  f(&item)
}


/// Makes a copy of the left-hand item, mutates it with the right-hand closure, and returns the mutated copy.
///
/// Example:
///
/// ```
/// func blue() -> some View {
///   var copy = self
///   copy.textColor = .blue
///   copy.borderColor = .blue
///   return copy
/// }
/// ```
/// vs:
/// ```
/// func blue() -> some View {
///   self |=> {
///     $0.textColor = .blue
///     $0.borderColor = .blue
///   }
/// }
/// ```
///
/// - Parameters:
///   - item: Any item to be copied and mutated.
///   - f: A closure taking in an `inout` item and mutating it.
/// - Returns: The mutated copy of the original item.
public func |=> <Item>(_ item: Item, _ f: (inout Item) -> Void) -> Item
{
  var copy = item
  f(&copy)
  return copy
}

public func <| <Root, Value>(
  keyPath: WritableKeyPath<Root, Value>,
  value: Value
) -> (inout Root) -> Void {
  { $0[keyPath: keyPath] = value }
}
