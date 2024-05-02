#import "../setup.typ": *

#show: thmrules

= Piccole oscillazioni

Si assume di limitarsi a sistemi lagrangiani con $T = 1/2 dot(vb(q)) dprod A(vb(q)) dot(vb(q))$ e $U=U(vb(q))$ in $C^2$,
e con $A(vb(q))$ continua (in fisica, basta dire "sufficientemente regolari").

#def[
  $vb(q_e)$ è un punto di equilibrio per un sistema lagrangiano come sopra se
  $ grad_vb(q) U(vb(q_e)) = 0. $
]

Infatti in questo caso si verifica immediatamente che $vb(q)(t) = vb(q_e)$ è una
soluzione delle equazioni di Eulero-Lagrange.

#def[
  $vb(q_e)$ si dice _stabile_ se $forall V$ intorno (aperto) di $vb(q_e)$, $exists V'$ intorno
  (aperto) di $vb(q_e)$ tale che, presa una condizione iniziale $vb(q_0) in V'$, $norm(dot(vb(q_0)))<epsilon$,
  allora l'orbita corrispondente $vb(q)(t) in V, forall t in RR$.
]

È evidente che se $vb(q_e)$ è un punto di minimo locale di $U$, esso è un punto
di equilibrio stabile.

In questi casi (in cui si hanno piccole perturbazioni di condizioni iniziali di
quiete), in un qualche senso che non viene mostrato,
$ T approx 1/2 dot(vb(q)) dprod A dot(vb(q)) $
con $A = A(vb(q_e))$,
$ U approx U(vb(q_e)) + 1/2 (vb(q)-vb(q_e)) dprod H U(vb(q_e))(vb(q)-vb(q_e)) $
dato che il gradiente del potenziale in $vb(q_e)$ è nullo. Nei calcoli si
assumerà che la costante additiva $U(vb(q_e))$ sia nulla.

Si fanno due assunzioni matematiche:
+ $A$ è simmetrica e definita positiva (assunzione praticamente sempre vera per
  sistemi fisici);
+ $B := H U(vb(q_e))$ è simmetrica e definita positiva.

Ha sempre senso assumere che la matrice associata $A$ a una forma quadratica sia
simmetrica. Se infatti non la fosse, si mostra facilmente che è equivalente a
prendere come matrice associata la parte simmetrica di $A$:
$ A_s = (A + A^TT)/2 $
in quanto la parte antisimmetrica si annulla nel calcolo della forma quadratica
per un generico vettore.

Invece di $L$, si studia il sistema con
$ L_"quadratica" (vb(Q), vb(dot(Q))) = 1/2 dot(vb(Q)) dprod A dot(vb(Q)) - 1/2 vb(Q) dprod B vb(Q) $
con $vb(Q) = vb(q) - vb(q_e)$ ($=> dot(vb(Q)) = dot(vb(q))$).

