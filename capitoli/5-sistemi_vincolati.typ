#import "../setup.typ": *

#show: thmrules

= Meccanica lagrangiana per sistemi vincolati

Si presentano alcuni esempi di sistemi meccanici vincolati.

#example[
  un anello vincolato ad un filo di ferro fisso in $RR^3$: si tratta di un sistema
  a un grado di libertà.
] <ring>

#example[
  due particelle in $RR^3$ collegate da una sbarra inestensibile (considerata
  priva di massa).
]

#example[
  un corpo rigido, vale a dire un sistema di particelle in cui la distanza tra
  ogni particella è fissata.
]

#example[
  un disco verticale che rotola senza strisciare lungo una traiettoria rettilinea.
] <wheel>

#example[
  una sfera che rotola senza strisciare su un piano.
] <sphere>

#example[
  una o più particelle vincolate a muoversi dentro un contenitore.
] <container>

// "Vi dico un nome che non mi ricordo neanche io, ma come dicevano in Romeo e Giulietta, non è importante il nome"
// "è una cosa che piace moltissimo agli ingegneri"
Si dà una classificazione dei vincoli. Essi possono essere dati da equazioni o
disequazioni nello _spazio di fase esteso_, ossia lo spazio delle $(vb(r_1), ..., vb(r_n), vb(v_1), ..., vb(v_n), t)$.
Considerando l'@ring, il filo di ferro può cambiare posizione nel tempo, e
dunque si ha anche una dipendenza diretta dal tempo.

I vincoli dati da equazioni sono detti _bilateri_, mentre quelli dati da
disequazioni sono detti _unilateri_. Nell'@container, se $vb(r_i) = (x_i,y_i)$, $x_i in [0,a]$ e $y_i in [0,b]$,
con due particelle si hanno otto vincoli unilateri. Gli altri esempi invece
hanno soltanto vincoli bilateri.

Nell'@wheel e nell'@sphere si usa il principio generale che la velocità di una
particella nel momento in cui si trova nel punto di contatto con il corpo
esterno contro cui avviene il rotolamento è nulla.

I vincoli sono detti _olonomi_ se sono bilateri e dipendono solo da posizione e
tempo, _anolonomi_ negli altri casi. Tra gli olonomi, si dicono _reonomi_ quelli
esplicitamente dipendenti dal tempo, e _scleronomi_ gli altri.

#figure(
  caption: [Schema riassuntivo della classificazione dei vincoli meccanici.],
)[
  #table(
    columns: (auto, auto, auto, 33%),
    align: horizon + left,
    table.cell(colspan: 3, [*unilateri*]),
    [disequazioni],
    table.cell(rowspan: 3, [*bilateri*]),
    table.cell(colspan: 2, [*anolonomi*]),
    [equazioni che non dipendono solo da posizione e tempo],
    table.cell(rowspan: 2, [*olonomi*]),
    [*reonomi*],
    [equazioni che dipendono da posizione e tempo],
    [*scleronomi*],
    [equazioni che dipendono solo dalla posizione],
  ) // In realtà non c'era bisogno di questa tabella ma volevo esercitarmi
]

L'@ring nel caso in cui il filo è fisso è un vincolo scleronomo, mentre se si
muovesse sarebbe reonomo. I primi tre esempi presentati hanno vincoli olonomi;
l'@wheel che può sembrare avere un vincolo anolonomo, ha in realtà anch'esso un
vincolo olonomo. Infine, l'@sphere, ha un vincolo anolonomo.

Naturalmente, possono coesistere vincoli olonomi e anolonomi, così come
unilateri e bilateri.

Si assumerà sempre che la totalità dei vincoli olonomi si possa riassumere
dicendo che il vettore globale delle configurazioni $gvec(r)$ appartenga a una
varietà differenziabile dello spazio delle configurazioni, che può dipendere dal
tempo. Si assumerà inoltre che le carte di questa varietà, che possono anch'esse
dipendere dal tempo, siano "sufficientemente lisce", ossia che siano
differenziabili $n$ volte. Nel linguaggio fisico si dirà che, almeno localmente,
tutte le possibili configurazioni sono espresse da
$ gvec(r) = gvec(r)(q_1, ..., q_d, t) = gvec(r)_t (vb(q)) $
dove $vb(q)$ è un vettore libero in $RR^d$, può variare in un aperto $U subset.eq RR^d$,
e le $gvec(r)_t : U -> V subset.eq M_t$ sono funzioni biettive e
sufficientemente lisce. Per $vb(r)$ fuori da $V$ si applicheranno altre funzioni $gvec(r)_t$:
$ r = gvec(r)_t (vb(q')), vb(q') in U', vb(r) in V'. $

Le $vb(q)$ sono spesso dette _coordinate generalizzate_.

#example[
  si considera un punto vincolato a muoversi su un filo di ferro sul piano $(x,z)$,
  riprendendo l'@ring, descritto dall'equazione
  $ z = 10 + sin x, x in [0, 6 pi]. $

  Si può usare la mappatura $vb(r)(q) = (q, 0, 10 + sin q)$, con $q in (0, 6 pi)$.
  Si vede che allora il vincolo è scleronomo.
]
// "Non ha senso copiare, ha senso imparare"

#example[
  considerando sempre la configurazione dell'@ring, si considera un filo di ferro
  che si muove verso l'alto di moto uniformemente accelerato:
  $ z = a x + b/2 t^2, $
  allora in questo caso si pone
  $ vb(r)(q)= (q, 0, a q + b/2 t^2), q in RR. $
  Un punto su questa retta allora risente di una forza tangente al filo di modulo $b sin theta$,
  dove $theta$ è l'angolo che il filo forma con l'asse $x$.
]

#example[
  riprendendo l'@wheel, fissando gli assi cartesiani $(x,y)$, se il disco ha
  raggio $a$, il centro si trova in ogni istante alla posizione $(x,a)$. Per
  determinare anche la rotazione del disco in ogni istante, si può misurare
  l'angolo $phi$ formato da un certo raggio con la verticale. La velocità radiale
  (diretta lungo l'asse $x$) della particella del disco a contatto con la
  superficie di strisciamento è $-a dot(phi)$. Il vincolo è pertanto dato
  dall'equazione, indicando con $dot(x)$ la velocità del centro del disco,
  $ dot(x) = -a dot(phi). $
  Integrando, con $x(0) = x_0$ e $phi(0) = phi_0$,
  $ x-x_0 = a(phi-phi_0). $
  Ecco che il vincolo è allora olonomo, con un grado di libertà. In particolare,
  questo tipo di vincolo è detto _vincolo olonomo integrabile_.
]

== Principio di D'Alembert

D'ora in avanti, non si utilizzerà più la notazione $gvec(r)$ e $gmat(M)$ per
indicare le posizioni e le masse dei sistemi di particelle, ma si utilizzerà $vb(r) in RR^n$ e $m in RR$.
Si tratta in realtà di un cambio di notazione, perché i calcoli sono analoghi.

I vincoli sono sempre dovuti a forze. Si può esprimere il secondo principio
della meccanica distinguendo tra _forze attive_ $vb(F)$ e _reazioni vincolari_ $vb(R)$:
$ m dot.double(vb(r)) = vb(F) + vb(R). $

Si vuole trovare $vb(F)$ senza conoscere necessariamente $vb(R)$.

#def[
  uno _spostamento virtuale_ $var(vb(r)) = (var(r_1), ..., var(r_2))$ è un "cambiamento
  infinitesimo" della configurazione $vb(r)$ del sistema, compatibile con i
  vincoli del sistema ad un dato tempo $t$.
]

#principle(
  "di D'Alembert",
)[
  la reazione vincolare $vb(R)$ compie lavoro nullo sugli spostamenti virtuali:
  $ vb(R) dprod var(vb(r)) = 0. $
]

Come conseguenza del principio di D'Alembert, $forall var(vb(r))$,

#set math.equation(numbering: "(1)")

$ m dot.double(vb(r)) dprod var(vb(r)) = vb(F) dprod var(vb(r)). $

Vale che, indicando tra parentesi quadre la matrice Jacobiana,
$ var(vb(r)) = [dv(vb(r), vb(q))(vb(q))] var(vb(q)). $
Allora
$ m dot.double(vb(r)) dprod var(vb(r)) = m dot.double(vb(r)) dprod [dv(vb(r), vb(q)) var(vb(q))] = m [dv(vb(r), vb(q))]^TT dot.double(vb(r)) dprod var(vb(q)). $ <transpose>
Ma, si ha che
$ [dv(vb(r), vb(q))]^TT dot.double(vb(r)) = dv(, t) ([dv(vb(r), vb(q))]^TT dot(vb(r))) - (dv(, t) [dv(vb(r), vb(q))]^TT) dot(vb(r)). $ <transpose_derivative>
Se le $vb(r)(vb(q), t)$ sono funzioni lisce (regolari), allora
$ dv(, t) [dv(vb(r), vb(q))] = dv(dot(vb(r)), vb(q)), $
infatti,
$ dv(, t) dv(r_i, q_j) = sum_(k=1)^d pdv(r_i, q_k, q_j) dot(q_k) + pdv(r_i, t, q_j) = sum_(k=1)^d pdv(r_i, q_j, q_k) dot(q_k) + pdv(r_i, q_j, t) = pdv(, q_j) (dv(, t) r_i). $

Per definizione, vale anche che
$ [dv(vb(r), vb(q))]=[dv(dot(vb(r)), dot(vb(q)))]. $ <jacobian_derivative>

Infatti la trasformazione $(vb(q), dot(vb(q)), t) |-> dot(vb(r))$ è definita in
maniera che valga
$ dot(vb(r)) = [dv(vb(r), vb(q))] dot(vb(q)) + dv(vb(r), t). $

Utilizzando le @transpose_derivative, @jacobian_derivative in @transpose,
$ m dot.double(vb(r)) dprod var(vb(r)) = m (dv(, t) ([dv(vb(r), vb(q))]^TT dot(vb(r))) - (dv(, t) [dv(vb(r), vb(q))]^TT) dot(vb(r))) dprod var(vb(q)). $ <all_together>

#set math.equation(numbering: none)

Si esprime ora l'energia cinetica nelle coordinate $(vb(q), dot(vb(q)), t)$,
ossia $T(vb(q), dot(vb(q)), t)=T(dot(vb(r))(vb(q), dot(vb(q)), t))$,

$ dv(T, dot(q_j)) = sum_(i=1)^n dv(T, dot(r_i)) dv(dot(r_i), dot(q_j)) = m sum_(i=1)^n dot(r_i) dv(dot(r_i), dot(q_j)) = m [dv(dot(vb(r)), dot(vb(q)))]^TT dot(vb(r)) $
$ ==> grad_dot(vb(q)) T = m [dv(dot(vb(r)), dot(vb(q)))]^TT dot(vb(r)). $

Analogamente, sostituendo $dot(q_j)$ con $q_j$, si ottiene
$ grad_vb(q) T = m [dv(dot(vb(r)), vb(q))]^TT dot(vb(r)). $
La @all_together diventa quindi
$ m dot.double(vb(r)) dprod var(vb(r)) = (dv(, t) (grad_dot(vb(q)) T) - grad_vb(q) T) dprod var(vb(q)). $

Si introduce la _forza generalizzata_ $vb(G)(vb(q), dot(vb(q)), t)$
$ vb(G)(vb(q), dot(vb(q)), t)=[dv(vb(q), vb(q))]^TT vb(F)(vb(q), dot(vb(q)), t). $

Dall'ultima espressione trovata, si ha che
$ (dv(, t) (grad_dot(vb(q)) T) - grad_vb(q) T) dprod var(vb(q)) = vb(F) dprod var(vb(r)) = vb(F) [dv(vb(r), vb(q))]^TT vb(F) dprod var(vb(q)) = vb(G) dprod vb(q). $

Se si hanno soltanto vincoli olonomi, allora i $var(vb(q))$ sono vettori liberi,
e dunque in quest'ultima equazione si può usare qualsiasi $var(vb(q)) in RR^d$:
$ dv(, t) (grad_dot(vb(q)) T) - grad_vb(q) T = vb(G). $

Se, inoltre, $vb(F)$ è un campo di forze conservativo, $vb(F(r))=-grad_vb(r) U(vb(r),t)$,
allora si può esprimere l'energia come $U(vb(q),t) = U(vb(r)(vb(q),t),t)$ e
osservare che
$ grad_vb(q) U = [dv(vb(r), vb(q))]^TT grad_vb(r) U = -[dv(vb(r), vb(q))] vb(F) = -vb(G). $

Si ha llora che, per $L = T- U$,
$ dv(, t) grad_dot(vb(q)) L - grad_vb(q) L = 0. $