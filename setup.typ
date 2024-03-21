#import "@preview/physica:0.9.2": *

#let gvec(content) = $underline(vb(content))$
#let gmat(content) = $underline(underline(vb(content)))$

// ctheorems setup
#import "@preview/ctheorems:1.1.2": *

#let def = thmbox(
  "def",
  "Definizione",
  fill: rgb("#EFE4CB")
)

#let principle = thmbox(
  "principle",
  "Principio",
  fill: rgb("#EFECE6")
)

#let theorem = thmbox(
  "theorem",
  "Teorema",
  fill: rgb("#9EDCE1")
)

#let corollary = thmbox(
  "corollary",
  "Corollario",
  fill: rgb("#C0E5E8")
)

#let prop = thmbox(
  "prop",
  "Proposizione",
  fill: rgb("#DAF4EF")
)

#let lemma = thmbox(
  "lemma",
  "Lemma",
  fill: rgb("#DAF4EF")
)

#let dim = thmproof(
  "dim",
  "Dimostrazione",
  base: "theorem"
).with(numbering: none)

#let example = thmplain(
  "example",
  "Esempio",
)

#let exercise = thmplain(
  "exercise",
  "Esercizio",
)

// Other colors:
// DEEBEB