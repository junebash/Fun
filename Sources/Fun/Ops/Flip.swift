func flip<A, B, Out>(
  _ fun: @escaping (A, B) -> Out
) -> (B, A) -> Out {
  { b, a in
    fun(a, b)
  }
}

func flip<A, B, C, Out>(
  _ fun: @escaping (A, B, C) -> Out
) -> (C, B, A) -> Out {
  { c, b, a in
    fun(a, b, c)
  }
}

func flip<A, B, C, D, Out>(
  _ fun: @escaping (A, B, C, D) -> Out
) -> (D, C, B, A) -> Out {
  { d, c, b, a in
    fun(a, b, c, d)
  }
}


func flip<A, B, C, D, E, Out>(
  _ fun: @escaping (A, B, C, D, E) -> Out
) -> (E, D, C, B, A) -> Out {
  { e, d, c, b, a in
    fun(a, b, c, d, e)
  }
}

func flip<A, B, Out>(
  _ fun: @escaping (A) -> (B) -> Out
)  -> (B) -> (A) -> Out {
  { b in
    { a in
      fun(a)(b)
    }
  }
}

func flip<A, B, C, Out>(
  _ fun: @escaping (A) -> (B) -> (C) -> Out
)  -> (C) -> (B) -> (A) -> Out {
  { c in
    { b in
      { a in
        fun(a)(b)(c)
      }
    }
  }
}

func flip<A, B, C, D, Out>(
  _ fun: @escaping (A) -> (B) -> (C) -> (D) -> Out
) -> (D) -> (C) -> (B) -> (A) -> Out {
  { d in
    { c in
      { b in
        { a in
          fun(a)(b)(c)(d)
        }
      }
    }
  }
}


func flip<A, B, C, D, E, Out>(
  _ fun: @escaping (A) -> (B) -> (C) -> (D) -> (E) -> Out
) -> (E) -> (D) -> (C) -> (B) -> (A) -> Out {
  { e in
    { d in
      { c in
        { b in
          { a in
            fun(a)(b)(c)(d)(e)
          }
        }
      }
    }
  }
}

// MARK: - Operator

public prefix func ~/~ <A, B, C>(
    f: @escaping (A) -> (B) -> C
) -> (B) -> (A) -> C {
    { b in
        { a in
            f(a)(b)
        }
    }
}
