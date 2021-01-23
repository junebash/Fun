
precedencegroup ForwardApplicationPrecedence {
  associativity: left
  higherThan: AssignmentPrecedence
  lowerThan: NilCoalescingPrecedence
}

precedencegroup BackwardApplicationPrecedence {
  associativity: right
  higherThan: ForwardApplicationPrecedence
  lowerThan: NilCoalescingPrecedence
}

precedencegroup ForwardCompositionPrecedence {
  higherThan: ForwardApplicationPrecedence
  associativity: left
}

precedencegroup BackwardCompositionPrecedence {
  higherThan: ForwardCompositionPrecedence
  associativity: right
}

precedencegroup CombinatorialCompositionPrecedence {
  higherThan: ForwardCompositionPrecedence, KeyPathApplicationPrecedence
  associativity: left
}

precedencegroup KeyPathApplicationPrecedence {
  associativity: left
}

prefix operator ~/~

infix operator |>: ForwardApplicationPrecedence // transform; return (immutable)
infix operator =>: ForwardApplicationPrecedence // mutate in place
infix operator |=>: ForwardApplicationPrecedence // copy; mutate; return copy

infix operator <|: BackwardApplicationPrecedence
infix operator <<=: BackwardApplicationPrecedence
infix operator <=|: BackwardApplicationPrecedence

infix operator >>>: ForwardCompositionPrecedence
infix operator <<<: BackwardCompositionPrecedence

infix operator <>: CombinatorialCompositionPrecedence

infix operator ?!: NilCoalescingPrecedence

prefix operator <~> // curry
prefix operator >~< // decurry

postfix operator |?
