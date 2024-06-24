#import "@preview/unequivocal-ams:0.1.0": ams-article, theorem, proof

#show: ams-article.with(
  title: [Convex Analysis Workshop],
  authors: (
    (
      name: "Ryuto Saito",
      email: "j2200071@gunma-u.ac.jp",
    ),
  ),
  bibliography: bibliography("refs.bib"),
)


#import "@preview/ctheorems:1.1.2": *
#show: thmrules.with(qed-symbol: $square$)

#set heading(numbering: "1.1.")

#let theorem = thmbox("theorem", "Theorem", fill: rgb("#eeffee"))
#let corollary = thmplain(
  "corollary",
  "Corollary",
  base: "theorem",
  titlefmt: strong
)
#let definition = thmbox("definition", "Definition", inset: (x: 1.2em, top: 1em))
#let lemma = thmbox("lemma", "Lemma", inset: (x: 1.2em, top: 1em))
#let proposition = thmbox("proposition", "Proposition", inset: (x: 1.2em, top: 1em))

#let example = thmplain("example", "Example").with(numbering: none)
#let proof = thmproof("proof", "Proof")

#set math.equation(numbering: "(1)")

#show ref: it => {
  let eq = math.equation
  let el = it.element
  if el != none and el.func() == eq {
    // Override equation references.
    numbering(
      el.numbering,
      ..counter(eq).at(el.location())
    )
  } else {
    // Other references as usual.
    it
  }
}

= Convex functions

== Definitions


#definition("Convex function")[
  Let $S subset.eq RR^n$. A function $f colon S -> RR union {oo}$ is convex if $bold(op("dom")) f$ is a convex set and
  $
    forall bold(x), bold(y) in bold(op("dom")) f, forall t in [0, 1], f(t bold(x) + (1-t) bold(y) lt.eq t f(bold(x)) + (1-t) f(bold(y)))
  $
  where $bold(op("dom")) f$ is the effective domain of $f$:
  $
    bold(op("dom")) f := {bold(x) in S | f(bold(x)) < oo}.
  $
]

#definition("Gradient")[
  Let $f : RR^n -> RR$ be a differentiable function. The gradient of $f$ at $bold(x) in RR^n$, denoted $nabla f(bold(x))$,
  is an n-dimensional vector whose entries are given by
  $
    (nabla f(bold(x)))_i := (partial f(bold(x))) / (partial x_i).
  $
  The gradient of $f$ is the vector containing all the partial derivatives. 
  Element i of the gradient is the partial derivative of $f$ with respect to $x_i$.
]


== Lemma

#lemma[
  A differentiable function $f : RR -> RR$ is convex if and only if
  $
    f(y) gt.eq f(x) + f'(x) (y - x)
  $
  for all $x$ and $y$ in $bold(op("dom")) f$.
]

#lemma[
  Let $f : RR^n -> RR, g : RR -> RR, bold(x), bold(y) in RR^n, t in [0, 1]$ and
  $
    g(t) = f(t bold(y) + (1-t) bold(x)).
  $
  Then, $g$ is convex if and only if $f$ is convex.
] <fg>

#proof[
  $(==>)$
  Let $theta in [0, 1]$.
  For any $t_1, t_2 in RR$,
  $
    & space space space g(theta t_1 + (1-theta) t_2) \
    &= f((theta t_1 + (1 - theta) t_2) bold(y) + (1 - (theta t_1 + (1 - theta) t_2)) bold(x)) \
    &= f(theta t_1 bold(y) + (1 - theta) t_2 bold(y) + bold(x) - theta t_1 bold(x) - (1 - theta) t_2 bold(x)) \
    &= f(theta t_1 bold(y) + theta bold(x) - theta t_1 bold(x) + (1 - theta) t_2 bold(y) + (1 - theta) bold(x) - (1 - theta) t_2 bold(x)) \
    &= f(theta (t_1 bold(y) + (1 - t_1) bold(x)) + (1 - theta) (t_2 bold(y) + (1 - t_2) bold(x))) \
    &gt.eq theta f(t_1 bold(y) + (1 - t_1) bold(x)) +  (1 - theta) f(t_1 bold(y) + (1 - t_1) bold(x)) \
    &= theta g(t_1) + (1 - theta) g(t_2)
  $
  Thus, $g$ is convex. \
  \

  $(<==)$
  Let $bold(x), bold(y) in bold(op("dom")) f$ and $t in RR$.
  For any $theta in [0, 1]$,
  $
    f(theta bold(y) + (1 - theta) bold(x)) &= g(theta) \
    &= g(theta dot 1 + (1- theta) dot 0) \
    &lt.eq theta g(1) + (1- theta) g(0) \
    &= theta f(bold(y)) + (1 - theta) f(bold(x))
  $
  Thus, $f$ is convex.
]

== Exercise

#proposition("First-order convexity condition")[
  Suppose $f$ is differentiable. Then $f$ is convex if and only if $bold(op("dom")) f$ is convex and
  $
    forall bold(x), bold(y) in bold(op("dom")) f, f(bold(y)) gt.eq f(bold(x)) + nabla f(bold(x))^(upright(T)) (bold(y) - bold(x)).
  $ <ineq>
]

#proof[
  Let $bold(x), bold(y) in RR^n, bold(z) = t bold(y) + (1-t) bold(x)$ for $t in [0, 1]$, and
  $
    g(t) = f(t bold(y) + (1-t) bold(x)).
  $
  Then, using chain rule,
  $
    g'(t) &= d / (d t) f(t bold(y) + (1-t) bold(x)) \
    &= d / (d t) f(bold(z)) \
    &= sum_(i=1)^n d / (d t) z_i partial / (partial z_i) f(bold(z)) \
    &= (partial / (partial z_1) f(bold(z)) , dots.h ,  partial / (partial z_n) f(bold(z)))
    mat(
      delim: "[",
      d / (d t) z_1;
      dots.v;
      d / (d t) z_n;
    ) \
    &=
    mat(
      delim: "[",
      partial / (partial z_1) f(bold(z));
      dots.v;
      partial / (partial z_n) f(bold(z));
    )^upright(T)
    mat(
      delim: "[",
      d / (d t) (t y_1 + (1-t) x_1);
      dots.v;
      d / (d t) (t y_n + (1-t) x_n);
    ) \
    &= nabla f(bold(z))^upright(T)
    mat(
      delim: "[",
      y_1 - x_1;
      dots.v;
      y_n - x_n;
    ) \
    &= nabla f(t bold(y) + (1-t) bold(x))^upright(T) (bold(y) - bold(x)).
  $
  $(==>)$
  Assume $f$ is convex. Then, $g$ is convex.
  By lemma, we have
  $
    g(1) gt.eq g(0) + g'(0),
  $
  which means that
  $
    f(bold(y)) gt.eq f(bold(x)) + nabla f(bold(x))^upright(T) (bold(y) - bold(x)).
  $

  $(<==)$
  Assume that @ineq holds for any $bold(x), bold(y) in bold(op("dom")) f$.
  Let $t_1, t_2 in [0, 1]$. Since $bold(x), bold(y) in bold(op("dom")) f$,
  $t_1 bold(y) + (1 - t_1) bold(x) in bold(op("dom")) f$ and $t_2 bold(y) + (1 - t_2) bold(x) in bold(op("dom")) f$.
  From @ineq,
  $
    & space space space f(t_1 bold(y) + (1 - t_1) bold(x)) \
    &gt.eq f(t_2 bold(y) + (1 - t_2) bold(x)) \
    & space space + nabla f(t_2 bold(y) + (1 - t_2) bold(x)) (t_1 bold(y) + (1 - t_1) bold(x) - (t_2 bold(y) + (1 - t_2) bold(x))) \
    &= f(t_2 bold(y) + (1 - t_2) bold(x)) \
    & space space + nabla f(t_2 bold(y) + (1 - t_2) bold(x)) ((t_1 - t_2) bold(y) + (1 - t_1 - (1 - t_2)) bold(x)) \
    &= f(t_2 bold(y) + (1 - t_2) bold(x)) \
    & space space + nabla f(t_2 bold(y) + (1 - t_2) bold(x)) ((t_1 - t_2) bold(y) - (t_1 - t_2) bold(x)) \
    &= f(t_2 bold(y) + (1 - t_2) bold(x)) \
    & space space + nabla f(t_2 bold(y) + (1 - t_2) bold(x)) (t_1 - t_2) (bold(y) - bold(x)).
  $
  That is
  $
    g(t_1) gt.eq g(t_2) + g'(t_2) (t_1 - t_2).
  $
  From @fg, since $g$ is convex, then $f$ is convex.
]


@Boyd


