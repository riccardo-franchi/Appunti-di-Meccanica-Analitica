#import "../setup.typ": *

#show: thmrules

= Il corpo rigido

#def[
  un corpo rigido è un sistema di $N$ punti materiali (di masse $m_i$ e porizioni $vb(r_i)$,
  dal sistema di riferimento $S$) con i vincoli costanti:
  $ norm(vb(r_i) - vb(r_j)) = c_(i j). $
]

Si osserva che, se il corpo rigido è composto da almeno tre punti non allineati,
i suoi gradi di libertà sono sei (tre di traslazione e tre di rotazione).

In assenza di forze esterne sul corpo, la quantità di moto totale
$ vb(p_"tot") = sum_(i=1)^N m_i vb(dot(r)_i) $
è conservata. Quindi il centro di massa
$ vb(r_"CM") = (sum_(i=1)^N m_i vb(r_i))/(sum_(i=1)^N m_i) $
evolve di moto rettilineo uniforme. Se necessario, si può trovare un sistema di
riferimento inerziale $S$ in cui $vb(r_"CM") = 0$ e in cui coincide con
l'origine. Da un punto di vista pratico, nel caso in cui un corpo rigido viene
visto come un continuo di materia, nella regione $C$ dello spazio, allora il
centro di massa è definito come
$ vb(r_"CM") = (integral_C rho(vb(r)) vb(r) dd(r, [n]))/(integral_C rho(vb(r)) dd(r, [n])) $
ove il denominatore è la massa totale $M$ del corpo rigido, e $rho(vb(r))$ è la
densità (di massa) del corpo.

#def[
  un corpo rigido si dice _vincolato_ ad un punto fisso $P$ (in $S$) se esiste un
  punto materiale del corpo (eventualmente fittizio) la cui posizione è fissata in $P$.
  Senza perdere di generalità, si può assumere che tale punto sia quello di
  coordinate $vb(r_1)$.
]

Se il punto $P$ non coincide con nessun punto del corpo rigido, lo si può
pensare vincolato aggiungendo un nuovo punto di massa nulla, detto fittizio, in
corrispondenza di $P$. Allora, le distanze tra questo nuovo punto e gli altri
punti devono rimanere costanti e in questo modo la definizione resta ben
formulata.

Il caso del corpo rigido vincolato copre anche il caso del corpo rigido libero
(in assenza di forze esterne), perché basta mettersi nel sistema di riferimento
fisso $S$ che ha origine nel centro di massa del corpo rigido (in questo caso $vb(r_1) = vb(r_"CM") = 0$).

Un corpo rigido vincolato ha soltanto tre gradi di libertà, potendo soltanto
ruotare. Esiste un modo standard di parametrizzare i gradi di libertà tramite
tre angoli, dovuto a Eulero. Da un punto di vista lagrangiano, per determinare
completamente l'evoluzione di un corpo rigido vincolato sono necessari sei
condizioni iniziali.

#theorem[
  il corpo rigido vincolato al punto fisso $O$, origine di $S$, in assenza di
  forze esterne, ammette quattro costanti del moto: $scriptE$ (energia totale,
  coincidente con l'energia cinetica) e le tre componenti di $vb(l_"tot") = vb(l_(0, "tot"))$ (momento
  totale della quantità di moto rispetto a $O$). Entrambe le quantità si intendono
  riferite a $S$.
]
#dim[
  Per quanto riguarda la costanza di $scriptE$:
  $ L = T(gvec(dot(r))) = T(vb(dot(r)_1), ..., vb(dot(r)_N)) $
  non dipende dal tempo, e dunque la lagrangiana riscritta nelle coordinate
  generalizzate $vb(q)$ dipenderà da $vb(q)$ e da $vb(dot(q))$, ma non dal tempo.
  Allora, si ottiene una hamiltoniana $H(vb(q), vb(p))$ che non dipende dal tempo.
]