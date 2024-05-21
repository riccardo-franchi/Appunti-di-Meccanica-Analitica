#import "../setup.typ": *

#show: thmrules
#set math.equation(numbering: "(1)")

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
   
  Per quanto riguarda il momento della quantità di moto, se si considera
  $ h^s (vb(r_1), ..., vb(r_N)) = (R^((z))_s vb(r_1), ..., R^((z))_s vb(r_N)) $
  dove $R^((z))_s$ indica una rotazione attorno l'asse $z$ di un angolo $s$,
  allora
  $ D h^s_((vb(r_1),..., vb(r_N))) (vb(dot(r)_1), ..., vb(dot(r)_N)) = (R^((z))_s vb(dot(r)_1), ..., R^((z))_s vb(dot(r)_N)). $
  Nel caso che si considera, $L = T = sum_(i=1)^N m_i/2 norm(vb(dot(r)_i))^2$.
  Dopo la trasformazione, si ha che
  $ L = sum_(i=1)^N m_i/2 norm(R^((z))_s vb(dot(r)_i))^2 = sum_(i=1)^N m_i/2 norm(vb(dot(r)_i))^2 = L(vb(r_1), ..., vb(r_N), vb(dot(r)_1), ..., vb(dot(r)_N)). $
   
  $ eval(dv(R_s^((z)) (vb(r_1)), s))_(s=0) = vu(e_z) cprod vb(r_1). $
  // integrare con le note
]

== Operatore di inerzia 

Si studia il moto di un singolo punto del corpo rigido, quindi solidale a (fermo
in) $S'$, vincolato in $O=O'$. Vista da $S$, $vb(v) = vb(omega) cprod vb(r)$
$ ==> vb(l) = vb(r) cprod m vb(v) = m (vb(r) cprod vb(omega) cprod vb(r)) $
rispetto a $O$. Visto da $S'$, il momento angolare è
$ vb(L) = m vb(R) cprod vb(Omega) cprod vb(R). $
C'è dipendenza lineare fra $vb(L)$ e $vb(Omega)$. Si può scrivere quindi
$ vb(L) = A vb(Omega) $
con $A$ matrice $3 times 3$.

#lemma[
  la matrice $A$ è simmetrica.
]
#dim[
  dati $vb(X), vb(Y)$, vale
  $ vb(X) dprod A vb(Y) = m vb(X) dprod vb(R) cprod vb(Y) cprod vb(R) = m (vb(Y) cprod vb(R)) dprod (vb(X) cprod vb(R)) = A vb(X) dprod vb(Y) $ <quadratic>
  e dunque $A$ è simmetrica.
]

#corollary[
  l'energia cinetica di un punto materiale del corpo rigido vincolato è una forma
  quadratica in $vb(Omega)$. In particolare,
  $ T_1 = 1/2 vb(Omega) cprod A vb(Omega). $
]
#dim[
  Da @quadratic,
  $ 1/2 vb(Omega) cprod A vb(Omega) = m/2 norm(vb(Omega) cprod vb(R))^2 = m/2 norm(vb(V))^2 = T_1. $
]

#def[
  $A$ è detta _operatore_ (o _matrice_ o _tensore_) _di inerzia del punto_ in
  questione solidale con $S'$.
]

Se il corpo è costituito da $N$ punti materiali di masse $m_i$ e posizione (in $S'$) $vb(r_i)$,
allora l'energia cinetica totale è
$ T = sum_(i=1)^N T_i = 1/2 sum_(i=1)^N vb(Omega) dprod A_i vb(Omega). $
Si definisce l'operatore di inerzia del corpo rigido vincolato in $O$,
$ hat(I) := sum_(i=1)^N A_i. $
$hat(I)$ è simmetrica, in quanto somma di matrici simmetriche. Si osserva che si
avrebbe potuto scrivere, per l'energia cinetica di una particella e dell'intero
corpo,
$ T_1 = 1/2 vb(Omega) dprod vb(L), $
$ T = 1/2 vb(Omega) dprod vb(L_"tot"). $

Il fatto che $hat(I)$ sia simmetrica implica che esiste una base ortonormale ${vu(W_k)}_(k in {1,2,3})$ tale
che
$ hat(I) vu(W)_k = I_k vu(W_k) $
dove $I_k$ sono gli autovalori di $hat(I)$ e sono detti _momenti principali di inerzia_.
Gli autovettori $vu(W_k)$ sono detti _assi principali di inerzia_. Nota: non
basta avere una base ortonomale per definire un sistema di assi cartesiani,
perché è necessario anche che i tre assi abbiano tutti la stessa origine.

In questi casi ha senso ricambiare l'orientazione di $S'$ affinché i suoi
versori coordinati $vu(E_X), vu(E_Y), vu(E_Z)$ coincidano con $vu(W_1), vu(W_2), vu(W_3)$.
In questa base, $hat(I)$ si esprime come 
$ hat(I) = dmat(I_1, I_2, I_3, delim: "[") $
cioè, $forall k in {1,2,3}$, $L_k = I_k Omega_k$, e anche 
$ T=1/2(I_1 Omega_1^2 + I_2 Omega_2^2 + I_3 Omega_3^2). $

#prop[
  l'energia cinetica di un corpo rigido vincolato ad $O$ che, ad un determinato
  tempo, ruota con velocità angolare $Omega = Omega vu(E)$ attorno all'asse
  passante per $O$ con direzione $vb(E)$, è
  $ T = 1/2 I_vu(E) Omega^2 $
  con 
  $ I_vu(E) = sum_(i=1)^N m_i d_i^2 $
  dove $d_i$ è la distanza dell'$i$-esimo punto dall'asse in questione.
]
#dim[
  $ norm(vb(V_i)) = norm(vb(Omega) cprod vb(R_i)) = Omega d_i $
  $ ==> T_i = 1/2 sum_(i=1)^N m_i d_i^2 Omega^2 = 1/2 I_vu(E) Omega^2. $
]

#corollary[
  vale anche che
  $ I_vu(E) = vu(E) dprod hat(I) vu(E). $ <I_E>
  e quindi vale anche
  $ I_k = I_vu(W_k). $ <I_K>
]
#dim[
  per quanto riguarda @I_E, si ha
  $ 1/2 I_vu(E) Omega^2 = T = 1/2 (Omega vu(E)) dprod hat(I) (Omega vu(E)) = 1/2 Omega^2 vu(E) dprod hat(I) vu(E) ==> I_vu(E) = vu(E) dprod hat(I) vu(E). $
  Per la @I_K, invece, dato che $vu(W_k)$ è un autovettore,
  $ I_vu(W_k) = vu(W_k) dprod hat(I) vu(W_k) = vu(W_k) dprod I_k vu(W_k) = I_k. $
]