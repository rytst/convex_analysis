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

I made this material referring to @Boyd.

== Definitions


#definition("Convex function")[
  A function $f colon RR^n -> RR union {oo}$ is convex if $bold(op("dom")) f$ is a convex set and
  $
    forall bold(x), bold(y) in bold(op("dom")) f, forall t in [0, 1], f(t bold(x) + (1-t) bold(y) lt.eq t f(bold(x)) + (1-t) f(bold(y)))
  $
  where $bold(op("dom")) f$ is the effective domain of $f$:
  $
    bold(op("dom")) f := {bold(x) | f(bold(x)) < oo}.
  $
]


#definition("Non-decreasing and non-increasing")[
  A function $f : RR -> RR$ is called $italic("non-decreasing")$ if
  $
    forall a, b in RR, a <= b ==> f(a) <= f(b).
  $
  Likewise, a function $f : RR -> RR$ is called $italic("non-increasing")$ if
  $
    forall a, b in RR, a <= b ==> f(a) >= f(b).
  $
]


== Lemma

#lemma[
  Let $f : RR^n -> RR union {oo}, g : RR -> RR union {oo}, bold(x), bold(y) in RR^n, t in [0, 1]$ and
  $
    g(t) = f(t bold(y) + (1-t) bold(x)).
  $
  Then, $g$ is convex if and only if $f$ is convex.
] <fg>

#proof[
  $(==>)$
  Let $theta in [0, 1]$.
  For any $t_1, t_2 in bold(op("dom")) g$,
  $
    & space space space g(theta t_1 + (1-theta) t_2) \
    &= f((theta t_1 + (1 - theta) t_2) bold(y) + (1 - (theta t_1 + (1 - theta) t_2)) bold(x)) \
    &= f(theta t_1 bold(y) + (1 - theta) t_2 bold(y) + bold(x) - theta t_1 bold(x) - (1 - theta) t_2 bold(x)) \
    &= f(theta t_1 bold(y) + theta bold(x) - theta t_1 bold(x) + (1 - theta) t_2 bold(y) + (1 - theta) bold(x) - (1 - theta) t_2 bold(x)) \
    &= f(theta (t_1 bold(y) + (1 - t_1) bold(x)) + (1 - theta) (t_2 bold(y) + (1 - t_2) bold(x))) \
    &lt.eq theta f(t_1 bold(y) + (1 - t_1) bold(x)) +  (1 - theta) f(t_2 bold(y) + (1 - t_2) bold(x)) \
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

#proposition("Scalar composition")[
  For $h : RR -> RR union {oo}, space g : RR^n -> RR union {oo},$
  define $f : RR^n -> RR union {oo}$ by
  $
    f(bold(x)) := h(g(bold(x)))
  $ <ineq>
  with
  $
    bold(op("dom")) f = {bold(x) in bold(op("dom")) g | g(bold(x)) in bold(op("dom")) h}.
  $
  Then $f$ is convex if
  - $h$ is convex and nondecreasing and $g$ is convex, or
  - $h$ is convex and nonincreasing and $g$ is concave.
]

#proof[
  First, we prove that $f$ is convex if $h$ is convex and nondecreasing and $g$ is convex.
  Let $bold(x), bold(y) in bold(op("dom")) f$, and $t in [0,1].$
  Since $bold(x), bold(y) in bold(op("dom")) f$, we have $bold(x), bold(y) in bold(op("dom")) g$
  and $g(bold(x)), g(bold(y)) in bold(op("dom")) h.$
  From convexity of $g$, $t bold(x) + (1 - t) bold(y) in bold(op("dom")) g.$
  Then, since $g$ is convex, we have
  $
    g(t bold(x) + (1 - t) bold(y)) <= t g(bold(x)) + (1 - t) g(bold(y))
  $



  Next, we prove that $f$ is convex if $h$ is convex and nonincreasing and $g$ is concave.
]

