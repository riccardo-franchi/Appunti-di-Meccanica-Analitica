#import "../setup.typ": *

#show: thmrules

= Il corpo rigido

#def[
  un corpo rigido è un sistema di $N$ punti materiali (di masse $m_i$ e posizioni $vb(r_i)$,
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
D'ora in avanti si tratterà quindi soltanto di corpi rigidi vincolati
all'origine di un sistema di riferimento $S$, in assenza di altre forze esterne.

Un corpo rigido vincolato ha soltanto tre gradi di libertà, potendo soltanto
ruotare. Esiste un modo standard di parametrizzare i gradi di libertà tramite
tre angoli, dovuto a Eulero. Da un punto di vista lagrangiano, per determinare
completamente l'evoluzione di un corpo rigido vincolato sono necessari sei
condizioni iniziali.

#theorem[
  il corpo rigido vincolato al punto fisso $O$, origine di $S$, in assenza di
  forze esterne, ammette quattro costanti del moto: $scriptE$ (energia totale,
  coincidente con l'energia cinetica) e le tre componenti di $vb(l_"tot") = vb(l_(O, "tot"))$ (momento
  totale della quantità di moto rispetto a $O$). Entrambe le quantità si intendono
  riferite a $S$.
]
#dim[
  Per quanto riguarda la costanza di $scriptE$:
  $ L = T(gvec(dot(r))) = T(vb(dot(r)_1), ..., vb(dot(r)_N)) $
  non dipende dal tempo, e dunque la lagrangiana riscritta nelle coordinate
  generalizzate $vb(q)$ dipenderà da $vb(q)$ e da $vb(dot(q))$, ma non dal tempo.
  Allora, si ottiene una hamiltoniana $H(vb(q), vb(p))$ che non dipende dal tempo.
  Essa è una costante del moto, che in questo caso particolare coincide con
  l'energia totale (energia cinetica).
   
  Per quanto riguarda il momento della quantità di moto, se si considera
  $ h^s (vb(r_1), ..., vb(r_N)) = (R^((z))_s vb(r_1), ..., R^((z))_s vb(r_N)) $
  dove $R^((z))_s$ indica una rotazione attorno l'asse $z$ di un angolo $s$,
  allora
  $ D h^s_((vb(r_1),..., vb(r_N))) (vb(dot(r)_1), ..., vb(dot(r)_N)) = (R^((z))_s vb(dot(r)_1), ..., R^((z))_s vb(dot(r)_N)). $
  Nel caso che si considera, $L = T = sum_(i=1)^N m_i/2 norm(vb(dot(r)_i))^2$.
  Dopo la trasformazione, si ha che
  $ L = sum_(i=1)^N m_i/2 norm(R^((z))_s vb(dot(r)_i))^2 = sum_(i=1)^N m_i/2 norm(vb(dot(r)_i))^2 = L(vb(r_1), ..., vb(r_N), vb(dot(r)_1), ..., vb(dot(r)_N)). $
  Si era già visto infatti che una $h^s$ come sopra conserva la lagrangiana, e
  dunque per il teorema di Noether, $l_(z,"tot")$ è una costante del moto.
  Analogamente per le altre componenti di $vb(l_"tot")$.
]

Il teorema dimostra che dei sei gradi di libertà lagrangiani nello spazio di
fase, solo due sono effettivi, infatti il moto avviene su una superficie
bidimensionale determinata dalle condizioni iniziali. Si potrebbe dimostrare che
tale superficie ha sempre la topologia di una superficie toroidale, sul quale il
moto è quello del cosiddetto flusso di Kronecker, cioè un moto rettilineo
uniforme nel quadrato con i lati opposti incollati a due a due.

== Operatore di inerzia e momenti di inerzia

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
   
  #set math.equation(numbering: "(1)")
  $ vb(X) dprod A vb(Y) = m vb(X) dprod vb(R) cprod vb(Y) cprod vb(R) = m (vb(Y) cprod vb(R)) dprod (vb(X) cprod vb(R)) = A vb(X) dprod vb(Y) $ <quadratic>
  #set math.equation(numbering: none)
  dove si è usata l'identità vettoriale $vb(a) dprod (vb(b) cprod vb(c)) = vb(c) dprod (vb(a) cprod vb(b)) $.

  Dunque, $A$ è simmetrica.
]

#corollary[
  l'energia cinetica di un punto materiale del corpo rigido vincolato è una forma
  quadratica in $vb(Omega)$. In particolare,
  $ T_1 = 1/2 vb(Omega) dprod A vb(Omega). $
]
#dim[
  Da @quadratic, e utilizzando la stessa identità vettoriale di poco sopra, si ottiene
  $ 1/2 vb(Omega) dprod A vb(Omega) = m/2 norm(vb(Omega) cprod vb(R))^2 = m/2 norm(vb(V))^2 = T_1. $
]

Si osserva che l'energia cinetica di un punto non solo è la stessa quantità
fisica, espressa tramite $vb(v)$ in $S$ e $vb(V)$ in $S'$, ma in questo caso ha
la stessa forma funzionale.

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
  tempo, ruota con velocità angolare $vb(Omega) = Omega vu(E)$ attorno all'asse
  passante per $O$ con direzione $vu(E)$, è
  $ T = 1/2 I_vu(E) Omega^2 $
  con 
  $ I_vu(E) = sum_(i=1)^N m_i d_i^2 $
  dove $d_i$ è la distanza dell'$i$-esimo punto dall'asse in questione.
]
#dim[
  $ norm(vb(V_i)) = norm(vb(Omega) cprod vb(R_i)) = Omega d_i $
  $ ==> T = 1/2 sum_(i=1)^N m_i d_i^2 Omega^2 = 1/2 I_vu(E) Omega^2. $
]

#set math.equation(numbering: "(1)")

#corollary[
  vale anche che
  $ I_vu(E) = vu(E) dprod hat(I) vu(E). $ <I_E>
  e quindi vale anche
  $ I_k = I_vu(W_k). $ <I_K>
]

#set math.equation(numbering: none)

#dim[
  per quanto riguarda @I_E, si ha
  $ 1/2 I_vu(E) Omega^2 = T = 1/2 (Omega vu(E)) dprod hat(I) (Omega vu(E)) = 1/2 Omega^2 vu(E) dprod hat(I) vu(E) ==> I_vu(E) = vu(E) dprod hat(I) vu(E). $
  Per la @I_K, invece, dato che $vu(W_k)$ è un autovettore,
  $ I_vu(W_k) = vu(W_k) dprod hat(I) vu(W_k) = vu(W_k) dprod I_k vu(W_k) = I_k. $
]

#exercise[
  nel caso in cui gli assi di inerzia coincidano con gli assi coordinati $vu(E_X), vu(E_Y), vu(E_Z)$ del
  sistema $S'$, esprimere $I_1, I_2, I_3$ in funzione di $X,Y,Z$.
]
#exercise[
  Mostrare che valgono le seguenti relazioni
  $ I_1 <= I_2+I_3 $
  $ I_2 <= I_1+I_3 $
  $ I_3 <= I_1+I_2 $
  e che l'uguaglianza in una sola di queste implica il caso limite di corpo a
  dimensione più bassa di tre (suggerimento: utilizzare l'esercizio precedente).
]

Se si ha un asse di simmetria discreta per un corpo rigido, allora uno degli
assi d'inerzia del corpo rigido deve essere quell'asse, e se la simmetria è
rispetto a $pi/n$ con $n$ intero, allora gli autovalori degli altri due assi
devono essere uguali tra loro.

#example(
  "momento di inerzia di una sfera",
)[
  considerando una sfera omogenea di raggio $a>0$, il momento di inerzia rispetto
  a un qualsiasi asse è
  $ I_vu(E) = integral_S(0,a) rho d_vu(E)^2 (vb(R)) dd(R, 3). $
  Utilizzando le coordinate sferiche $(r, theta, phi)$, con $vu(E) = vu(E_z)$,
  $ I_vu(E) &= rho integral_0^(2pi) dd(phi) integral_0^pi dd(theta) integral_0^a dd(r) (r sin theta)^2 r^2 sin theta \ 
          &= (3pi)/2 M/(pi a^3) integral_0^pi sin^3 theta dd(theta) integral_0^a r^4 dd(r) \
          &= 2/5 M a^2. $
]

Nota: Il momento di inerzia rispetto ad un asse è appunto rispetto ad un asse,
non ad un vettore, anche se la notazione $I_vb(E)$ lascerebbe pensare alla
seconda ipotesi. Quando il punto di vincolo è fissato e chiarito, non c'è
confusione perché un vettore $vb(E)$ determina univocamente un asse passante per $O$ e
diretto come $vb(E)$ (ma non il viceversa). Ma quando si cambia il punto di
vincolo $O$, due assi paralleli hanno in generale momenti di inerzia diversi.
Vale infatti, a questo proposito, il seguente teorema.

#theorem(
  "di Huygens-Steiner",
)[
  se $a$ e $a_"CM"$ sono due assi paralleli, posti a distanza $D$ tra loro, il
  secondo dei quali passa per il centro di massa di un corpo rigido, vale la
  relazione
  $ I_a = I_a_"CM" + M D^2 $
  dove $I_a$ e $I_a_"CM"$ sono i momenti di inerzia rispetto ad $a$ e $a_"CM"$,
  rispettivamente, e $M$ è la massa del corpo rigido.
]
#dim[
  detta $vb(R_i)$ la posizione dell'$i$-esimo punto materiale (di massa $m_i$) del
  corpo rigido, relativa ad un'origine (vincolo) su $a$, e detta $vb(R_i^perp) = Pi(vb(R_i))$ la
  sua proiezione ortogonale su un piano normale agli assi $a$ e $a_"CM"$.
  Indicando con $vb(D)$ il vettore su questo piano che va da $a$ ad $a_"CM"$, si
  ha che
  $ vb(r_i) = vb(D) + vb(R_i^perp). $
  Per definizione di momento di inerzia rispetto ad un asse,
  $ I_a_"CM" = sum_(i=1)^N m_i norm(vb(R_i^perp))^2 $
  $ I_a = sum_(i=1)^N m_i norm(vb(r_i))^2 $
  ma, essendo la proiezione ortogonale $Pi$ un operatore lineare, vale
  $ I_a = sum_(i=1)^N m_i norm(vb(D) + vb(R_i^perp))^2 = M D^2 + I_a_"CM" + 2 vb(D) dprod Pi(sum_(i=1)^N m_i vb(R_i)). $
  D'altra parte,
  $ sum_(i=1)^N m_i vb(R_i) = M vb(R_"CM") ==> M Pi(vb(R_"CM")) = 0 $
  perché il centro di massa appartiene all'asse $a_"CM"$ e dunque ha proiezione
  nulla su un suo piano ortogonale.
]
#corollary[
  fra tutti gli assi paralleli, quello che dà il momento di inerzia minore (per un
  dato corpo rigido) è quello passante per il centro di massa.
]

#example[
  si considera uno yo-yo, con il filo e il cilindro interno di masse trascurabili,
  e massa (concentrata quindi nei due cilindri esterni) $M$, con raggi per il
  cilindretto interno e quelli esterni, rispettivamente $a$ e $A$. Si indica con $l$ la
  lunghezza della parte arrotolata del filo. Detto $P$ il punto dove lo yo-yo è
  appeso, esso è istantaneamente fermo.
  $ vb(N_p) = vb(dot(L)_P) = dv(, t)(hat(I) vb(Omega)) $
  In termini scalari,
  $ N_P = dot(L)_P = dv(, t)(hat(I)_P Omega_P) $
  Intuitivamente, ma si può dimostrare, vale
  $ N_P = a M g $
  Infatti (si tratta di un caso specifico del teorema di König),
  $ vb(N) = vb(N_"tot") = sum_i vb(N_i) = sum_i vb(r_i) cprod vb(F_i^"ext") = sum_i m_i vb(r_i) cprod vb(g) = M vb(r_"CM") cprod vb(g) = vb(r_"CM") cprod M vb(g). $
   
  Dato che $I = M/2 A^2$, per il teorema di Huygens-Steiner,
  $ I_P = M(A^2/2 + a^2) $
  $ ==> a M g = I_P dot(Omega)_P = M(A^2/2 + a^2) dot(Omega)_P $
  Indicando con $vb(V)$ la velocità tangenziale,
  $ a g = (A^2/2+a^2) dot(V)/a $
  $ ==> b := dot(V) = g/(A^2/(2a^2) + 1) $
  dove, per brevità, si è chiamata l'accelerazione dello yo-yo con $b$. Indicando
  con $t_0=0$ il tempo in cui viene rilasciato il sistema, $y_0 = y(t_0)=0$, con
  $ y = 1/2 b t^2 $
  $ ==> t_l = sqrt((2 l)/b) = sqrt((2 l)/g (1+A^2/(2 a^2))). $
]

