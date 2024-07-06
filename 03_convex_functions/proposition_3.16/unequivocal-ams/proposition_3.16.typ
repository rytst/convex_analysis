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
  First, we prove that $f$ is convex if $h$ is convex and nondecreasing and $g$ is convex. \
  Let $bold(x), bold(y) in bold(op("dom")) f$, and $t in [0,1].$
  Since $bold(x), bold(y) in bold(op("dom")) f$, we have $bold(x), bold(y) in bold(op("dom")) g$
  and $g(bold(x)), g(bold(y)) in bold(op("dom")) h.$
  From the convexity of $bold(op("dom")) g$, $t bold(x) + (1 - t) bold(y) in bold(op("dom")) g.$
  Then, since $g$ is convex, we have
  $
    g(t bold(x) + (1 - t) bold(y)) <= t g(bold(x)) + (1 - t) g(bold(y)).
  $ <g_conv>
  Since $g(bold(x)), g(bold(y)) in bold(op("dom")) h$ and $bold(op("dom")) h$ is convex, we have
  $t g(bold(x)) + (1 - t) g(bold(y)) in bold(op("dom")) h$.
  Then,
  $
    t g(bold(x)) + (1 - t) g(bold(y)) < oo.
  $ <g_dom>
  From @g_conv and @g_dom, we get
  $
    g(t bold(x) + (1 - t) bold(y)) < oo,
  $
  which means $t bold(x) + (1 - t) bold(y) in bold(op("dom")) h$.
  Since $t bold(x) + (1 - t) bold(y) in bold(op("dom")) g$
  and $t bold(x) + (1 - t) bold(y) in bold(op("dom")) h$,
  we get $t bold(x) + (1 - t) bold(y) in bold(op("dom")) f$.
  Therefore, $bold(op("dom")) f$ is convex set.
  Using the assumption that $h$ is nondecreasing and @g_conv, it follows that
  $
    h(g(t bold(x) + (1 - t) bold(y))) <= h(t g(bold(x)) + (1 - t) g(bold(y))).
  $ <h_mono>
  From the convexity of $h$, 
  $
    h(t g(bold(x)) + (1 - t) g(bold(y))) <= t h(g(bold(x))) + (1 - t) h(g(bold(y))).
  $ <h_conv>

  From @h_mono and @h_conv , we get
  $
    h(g(t bold(x) + (1 - t) bold(y))) <= t h(g(bold(x))) + (1 - t) h(g(bold(y))).
  $
  That is
  $
    f(t bold(x) + (1 - t) bold(y)) <= t f(bold(x)) + (1 - t) f(bold(y)).
  $
  Then, we have shown that $f$ is convex if $h$ is convex and nondecreasing and $g$ is convex.


  Next, we prove that $f$ is convex if $h$ is convex and nonincreasing and $g$ is concave.



  $
    h(g(t bold(x) + (1 - t) bold(y))) <= t h(g(bold(x))) + (1 - t) h(g(bold(y))).
  $
  That is
  $
    f(t bold(x) + (1 - t) bold(y)) <= t f(bold(x)) + (1 - t) f(bold(y)).
  $

  Then, we have shown that $f$ is convex if $h$ is convex and nonincreasing and $g$ is cocave.

]

