#import "@preview/grape-suite:0.1.0": exercise
#import exercise: project, task, subtask

  
#import "@preview/ctheorems:1.1.2": *
#show: thmrules.with(qed-symbol: $square$)

#set page(width: 16cm, height: auto, margin: 1.5cm)
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



#show: project.with(
    title: "Convex Analysis Workshop",

    with-outline: true,

    author: "Ryuto Saito",

    show-solutions: false
)


= Convex functions

== Definitions and basic properties

#definition[
  Let $S subset.eq RR^n$. A function $f colon S -> RR union brace.l oo brace.r$
]





