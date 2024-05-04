#import "../setup.typ": *

#show: thmrules

= Piccole oscillazioni

#lemma[
  l'equazione differenziale $diaer(x) + lambda x = 0$, per $x in RR$, ha come
  soluzione, se $lambda < 0$,
  $ x(t) = c_1 cos(omega t)+c_2 sin (omega t) $
  dove $omega = sqrt(-lambda)>0$.
]
#dim[
  è sufficiente mostrare che la soluzione al problema di Cauchy
  $ cases(diaer(x) = -omega^2 x, x(t_0) = x_0, dot(x)(t_0) = v_0) $
  è $x(t) = x_0 cos(omega(t-t_0))+v_0/omega sin(omega(t-t_0))$, cosa che può
  essere verificata manualmente. Usando poi le formule di addizione e sottrazione
  di seno e coseno e rinonimando i coefficienti numerici si arriva all'espressione
  cercata. L'unicità della solzione del problema di Cauchy dimostra che tutte le
  soluzioni sono in quella forma.
]

Si assume di limitarsi a sistemi lagrangiani con $T = 1/2 dot(vb(q)) dprod A(vb(q)) dot(vb(q))$ e $U=U(vb(q))$ in $C^2$,
e con $A(vb(q))$ continua (in fisica, basterebbe dire di essere in condizioni "sufficientemente
regolari").

#def[
  $vb(q_e)$ è un punto di equilibrio per un sistema lagrangiano come sopra se
  $ grad_vb(q) U(vb(q_e)) = 0. $
]

Infatti in questo caso si verifica immediatamente che $vb(q)(t) = vb(q_e)$ è una
soluzione delle equazioni di Eulero-Lagrange.

#def[
  $vb(q_e)$ si dice _stabile_ se $forall V$ intorno (aperto) di $vb(q_e)$, $exists V'$ intorno
  (aperto) di $vb(q_e)$ e $exists epsilon>0$ tale che, presa una condizione
  iniziale $vb(q_0) in V'$, $norm(dot(vb(q_0)))<epsilon$, allora l'orbita
  corrispondente $vb(q)(t) in V, forall t in RR$.
]

È evidente da considerazioni di meccanica che se $vb(q_e)$ è un punto di minimo
locale di $U$, esso è un punto di equilibrio stabile. Si tratta comunque di una
conseguenza della costanza dell'hamiltoniana lungo le orbite.

In questi casi (in cui si hanno piccole perturbazioni di condizioni iniziali di
quiete), in un qualche senso che non viene mostrato,
$ T approx 1/2 dot(vb(q)) dprod A dot(vb(q)) $
con $A = A(vb(q_e))$,
$ U approx U(vb(q_e)) + 1/2 (vb(q)-vb(q_e)) dprod H U(vb(q_e))(vb(q)-vb(q_e)) $
dato che il gradiente del potenziale in $vb(q_e)$ è nullo. Nei calcoli si
assumerà, senza perdita di generalità, che la costante additiva $U(vb(q_e))$ sia
nulla.

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

Si scrivono le equazioni di Eulero-Lagrange per $L=L_"quadratica"$:
$ grad_dot(vb(Q)) L = A dot(vb(Q)) ==> dv(, t) grad_dot(vb(Q)) = A diaer(vb(Q)) $
$ grad_vb(Q) L = -B vb(Q) $
$ ==> A diaer(vb(Q)) + B vb(Q) = 0. $