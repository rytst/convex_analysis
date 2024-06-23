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

#let example = thmplain("example", "Example").with(numbering: none)
#let proof = thmproof("proof", "Proof")




= Convex functions

== Definitions and basic properties


#definition[
  Let $S subset.eq RR^n$. A function $f colon S -> RR union {oo}$ is convex if $bold(op("dom")) f$ is a convex set and
  $
    forall bold(x), bold(y) in bold(op("dom")) f, forall t in {0, 1}, f(t bold(x) + (1-t) bold(y) lt.eq t f(bold(x)) + (1-t) f(bold(y)))
  $
  where $bold(op("dom")) f$ is the effective domain of $f$:
  $
    bold(op("dom")) f := {bold(x) in S | f(bold(x)) < oo}.
  $
]






@Boyd


