// MARK: - Curry

func curry<A, B, Out>(
  _ fun: @escaping (A, B) -> Out
) -> (A) -> (B) -> Out {
  { a in
    { b in
      fun(a, b)
    }
  }
}

func curry<A, B, C, Out>(
  _ fun: @escaping (A, B, C) -> Out
) -> (A) -> (B) -> (C) -> Out {
  { a in
    { b in
      { c in
        fun(a, b, c)
      }
    }
  }
}

func curry<A, B, C, D, Out>(
  _ fun: @escaping (A, B, C, D) -> Out
) -> (A) -> (B) -> (C) -> (D) -> Out {
  { a in
    { b in
      { c in
        { d in
          fun(a, b, c, d)
        }
      }
    }
  }
}

func curry<A, B, C, D, E, Out>(
  _ fun: @escaping (A, B, C, D, E) -> Out
) -> (A) -> (B) -> (C) -> (D) -> (E) -> Out {
  { a in
    { b in
      { c in
        { d in
          { e in
            fun(a, b, c, d, e)
          }
        }
      }
    }
  }
}

public prefix func <~><A, B, Out>(
  _ fun: @escaping (A, B) -> Out
) -> (A) -> (B) -> Out {
  curry(fun)
}

public prefix func <~><A, B, C, Out>(
  _ fun: @escaping (A, B, C) -> Out
) -> (A) -> (B) -> (C) -> Out {
  curry(fun)
}

public prefix func <~><A, B, C, D, Out>(
  _ fun: @escaping (A, B, C, D) -> Out
) -> (A) -> (B) -> (C) -> (D) -> Out {
  curry(fun)
}

public prefix func <~><A, B, C, D, E, Out>(
  _ fun: @escaping (A, B, C, D, E) -> Out
) -> (A) -> (B) -> (C) -> (D) -> (E) -> Out {
  curry(fun)
}

// MARK: - Uncurry

func uncurry<A, B, Out>(
  _ fun: @escaping (A) -> (B) -> Out
) -> (A, B) -> Out {
  { a, b in
    fun(a)(b)
  }
}

func uncurry<A, B, C, Out>(
  _ fun: @escaping (A) -> (B) -> (C)   -> Out
) -> (A, B, C ) -> Out {
  { a, b, c in
    fun(a)(b)(c)
  }
}

func uncurry<A, B, C, D, Out>(
  _ fun: @escaping (A) -> (B) -> (C) -> (D) -> Out
) -> (A, B, C, D) -> Out {
  { a, b, c, d in
    fun(a)(b)(c)(d)
  }
}

func uncurry<A, B, C, D, E, Out>(
  _ fun: @escaping (A) -> (B) -> (C) -> (D) -> (E) -> Out
) -> (A, B, C, D, E) -> Out {
  { a, b, c, d, e in
    fun(a)(b)(c)(d)(e)
  }
}

public prefix func >~<<A, B, Out>(
  _ fun: @escaping (A) -> (B) -> Out
) -> (A, B) -> Out {
  uncurry(fun)
}

public prefix func >~<<A, B, C, Out>(
  _ fun: @escaping (A) -> (B) -> (C)   -> Out
) -> (A, B, C ) -> Out {
  uncurry(fun)
}

public prefix func >~<<A, B, C, D, Out>(
  _ fun: @escaping (A) -> (B) -> (C) -> (D) -> Out
) -> (A, B, C, D) -> Out {
  uncurry(fun)
}

public prefix func >~<<A, B, C, D, E, Out>(
  _ fun: @escaping (A) -> (B) -> (C) -> (D) -> (E) -> Out
) -> (A, B, C, D, E) -> Out {
  uncurry(fun)
}
