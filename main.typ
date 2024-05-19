#import "template.typ": *

// Take a look at the file `template.typ` in the file panel
// to customize this template and discover how it works.
#show: project.with(title: "Appunti di Meccanica Analitica", authors: ((
  name: "Riccardo Franchi",
  affiliation: "Collegio Superiore - Università di Bologna",
),), date: "A.A. 2023-2024")

#show ref: it => {
  let eq = math.equation
  let el = it.element
  if el != none and el.func() == eq {
    // Override equation references.
    numbering(el.numbering, ..counter(eq).at(el.location()))
  } else {
    // Other references as usual.
    it
  }
}

#import "@preview/equate:0.1.0": equate
#show: equate.with(number-mode: "label")

#include "capitoli/1-ripasso.typ"
#pagebreak()
#include "capitoli/2-sistemi_un_grado.typ"
#pagebreak()
#include "capitoli/3-lagrangiana.typ"
#pagebreak()
#include "capitoli/4-geometria_differenziale.typ"
#pagebreak()
#include "capitoli/5-sistemi_vincolati.typ"
#pagebreak()
#include "capitoli/6-hamiltoniana.typ"
#pagebreak()
#include "capitoli/7-piccole_oscillazioni.typ"
#pagebreak()
#include "capitoli/8-cinematica_relativa.typ"
#pagebreak()
#include "capitoli/9-corpo_rigido.typ"