func first<A, B, Out>(
  _ fun: @escaping (A, B) -> Out
) -> (A) -> (B) -> Out {
  { a in
    { b in
      fun(a, b)
    }
  }
}

func first<A, B, C, Out>(
  _ fun: @escaping (A, B, C) -> Out
) -> (A) -> (B, C) -> Out {
  { a in
    { b, c in
      fun(a, b, c)
    }
  }
}

func first<A, B, C, D, Out>(
  _ fun: @escaping (A, B, C, D) -> Out
) -> (A) -> (B, C, D) -> Out {
  { a in
    { b, c, d in
      fun(a, b, c, d)
    }
  }
}

func first<A, B, C, D, E, Out>(
  _ fun: @escaping (A, B, C, D, E) -> Out
) -> (A) -> (B, C, D, E) -> Out {
  { a in
    { b, c, d, e in
      fun(a, b, c, d, e)
    }
  }
}

func second<A, B, Out>(
  _ fun: @escaping (A, B) -> Out
) -> (B) -> (A) -> Out {
  { b in
    { a in
      fun(a, b)
    }
  }
}

func second<A, B, C, Out>(
  _ fun: @escaping (A, B, C) -> Out
) -> (B) -> (A, C) -> Out {
  { b in
    { a, c in
      fun(a, b, c)
    }
  }
}

func second<A, B, C, D, Out>(
  _ fun: @escaping (A, B, C, D) -> Out
) -> (B) -> (A, C, D) -> Out {
  { b in
    { a, c, d in
      fun(a, b, c, d)
    }
  }
}

func second<A, B, C, D, E, Out>(
  _ fun: @escaping (A, B, C, D, E) -> Out
) -> (B) -> (A, C, D, E) -> Out {
  { b in
    { a, c, d, e in
      fun(a, b, c, d, e)
    }
  }
}

func third<A, B, C, Out>(
  _ fun: @escaping (A, B, C) -> Out
) -> (C) -> (A, B) -> Out {
  { c in
    { a, b in
      fun(a, b, c)
    }
  }
}

func third<A, B, C, D, Out>(
  _ fun: @escaping (A, B, C, D) -> Out
) -> (C) -> (A, B, D) -> Out {
  { c in
    { a, b, d in
      fun(a, b, c, d)
    }
  }
}

func third<A, B, C, D, E, Out>(
  _ fun: @escaping (A, B, C, D, E) -> Out
) -> (C) -> (A, B, D, E) -> Out {
  { c in
    { a, b, d, e in
      fun(a, b, c, d, e)
    }
  }
}

func fourth<A, B, C, D, Out>(
  _ fun: @escaping (A, B, C, D) -> Out
) -> (D) -> (A, B, C) -> Out {
  { d in
    { a, b, c in
      fun(a, b, c, d)
    }
  }
}

func fourth<A, B, C, D, E, Out>(
  _ fun: @escaping (A, B, C, D, E) -> Out
) -> (D) -> (A, B, C, E) -> Out {
  { d in
    { a, b, c, e in
      fun(a, b, c, d, e)
    }
  }
}

func fifth<A, B, C, D, E, Out>(
  _ fun: @escaping (A, B, C, D, E) -> Out
) -> (E) -> (A, B, C, D) -> Out {
  { e in
    { a, b, c, d in
      fun(a, b, c, d, e)
    }
  }
}
