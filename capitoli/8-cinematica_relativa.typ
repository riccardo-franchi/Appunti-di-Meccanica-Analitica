#import "../setup.typ": *

#show: thmrules

= Cinematica relativa

Dato un sistema lagrangiano $L(vb(q), dot(vb(q)),t)$, alle volte è conveniente
fare un cambio di coordinate dipendente dal tempo
$ vb(Q) = vb(Q)(vb(q),t) = vb(Q_t)(vb(q)) $
con $vb(Q_t)$ biettiva, e con inversa $vb(q_t)(vb(Q))$.

#prop[
  se $scriptL(vb(Q), dot(vb(Q)), t)$ è la lagrangiana $L$ espressa nelle $vb(Q), dot(vb(Q)), t$,
  ovvero
  $ scriptL(vb(Q), dot(vb(Q)), t)=L(vb(q)(vb(Q),t), [pdv(vb(q), vb(Q))(vb(Q),t)]dot(vb(Q)) + pdv(vb(q), t),t) $
  allora le soluzioni lagrangiane per $L$ sono le soluzioni lagragiane per $scriptL$,
  espresse nelle $vb(q)$.
]
Sì è già data una dimostrazione di questa proposizione, utilizzando il lemma per
la trasformazione dei gradienti. Si considerano due sistemi di riferimento $S$ e $S'$,
la cui origine è a distanza $vb(r_0)$ dall'origine di $S$. Si chiama $B_t$ la
matrice $3 times 3$ di rotazione, o semplicemente rotazione, tale che
$ B_t vu(e_x) = vu(e_X), space.quad B_t vu(e_y) = vu(e_Y), space.quad B_t vu(e_z) = vu(e_Z) $
dove con le lettere minuscole si denota la base canonica di $S$ e con le
maiuscole quella di $S'$.

#def[
  se $tau_vb(a)$ denota la trasformazione di una quantità $vb(a)$ in $RR^3$, cioè $tau_vb(a) (vb(r)) = - vb(r) + vb(a)$,
  si dice che la trasformazione
  $ D_t = tau_vb(r_0) compose B_t $
  _porta_ $S$ in $S'$.
]

Ciò significa (per definizione) che se $vb(r)$ è il vettore nel sistema $S$ e
che indica un punto dello spazio, e $R$ è il vettore nel sistema $S'$ che indica
lo stesso punto. Allora
$ vb(r) = B_t vb(R) + vb(r_0). $

