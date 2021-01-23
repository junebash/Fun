public extension Optional {
  func zipWith<Other>(_ other: Other?) -> (Wrapped, Other)? {
    if let wrapped = self, let other = other {
      return (wrapped, other)
    }
    return nil
  }

  func zipWith<OtherA, OtherB>(_ a: OtherA?, _ b: OtherB?) -> (Wrapped, OtherA, OtherB)? {
    if let wrapped = self, let a = a, let b = b {
      return (wrapped, a, b)
    }
    return nil
  }
}


/// A safe error indicating that an optional value of type `Wrapped` was unexpectedly nil.
public struct UnwrapError<Wrapped>: Error, CustomStringConvertible {
  public var description: String { "Failed to unwrap Optional<\(Wrapped.self)>." }
}


/// Attempts to unwrap the provided optional, and if nil, throws the error on the right.
public func ?! <Wrapped>(
  optionalItem: @autoclosure () throws -> Wrapped?,
  error: @autoclosure () -> Error
) throws -> Wrapped {
  guard let item = try optionalItem() else { throw error() }
  return item
}


/// Attempts to unwrap the provided optional, and if nil, throws an `UnwrapError<Wrapped>`.
postfix func |? <Wrapped>(
  optionalItem: @autoclosure () throws -> Wrapped?
) throws -> Wrapped {
  try optionalItem() ?! UnwrapError<Wrapped>()
}
