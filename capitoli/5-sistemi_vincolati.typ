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
$ r = gvec(r)_t (vb(q')), vb(q') in scriptU, vb(r) in V'. $

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
indicare le posizioni e le masse dei sistemi di particelle, ma si utilizzerà $vb(r) in RR^n$ e $m in RR$,
supponendo di lavorare con una sola particella. Si tratta in realtà di un cambio
di notazione, perché i calcoli sono analoghi.

I vincoli sono sempre dovuti a forze. Si può esprimere il secondo principio
della meccanica distinguendo tra _forze attive_ $vb(F)$ e _reazioni vincolari_ $vb(R)$:
$ m dot.double(vb(r)) = vb(F) + vb(R). $

L'obiettivo è trovare $vb(F)$ senza conoscere necessariamente $vb(R)$. Questo è
possibile a partire dal _principio di D'Alembert_.

#def[
  uno _spostamento virtuale_ $var(vb(r)) = (var(r_1), ..., var(r_2))$ è un "cambiamento
  infinitesimo" della configurazione $vb(r)$ del sistema, compatibile con i
  vincoli del sistema ad un dato tempo $t$.
]

Questi spostamenti infinitesimi vanno pensati in una situazione idealizzata di
tempo "congelato", e con esso lo sono tutte le quantità dipendenti dal tempo.

#principle(
  "di D'Alembert",
)[
  la reazione vincolare $vb(R)$ compie lavoro nullo sugli spostamenti virtuali:
  $ vb(R) dprod var(vb(r)) = 0. $
]

Si può riflettere sulla ragionevolezza di questo principio: la reazione
vincolare può fare lavoro, ma non lungo gli spostamenti virtuali, che sono
quelli che coinvolgono il moto "all'interno del vincolo". La reazione vincolare
ha l'unico effetto di tenere la particella vincolata, non di fornirle o
toglierle energia per il moto entro il vincolo.

Come conseguenza del principio di D'Alembert, $forall var(vb(r))$,

#set math.equation(numbering: "(1)")

$ m dot.double(vb(r)) dprod var(vb(r)) = vb(F) dprod var(vb(r)). $

Si utilizzano le carte e i concetti definiti nel capitolo precedente, che
consentono di descrivere il moto (e quindi gli spostamenti infinitesimi)
vincolato nelle $vb(r)$ tramite il moto nelle $vb(q)$, perché in molti casi gli
spostamenti infinitesimi nelle $vb(q)$ saranno _liberi_.

Vale che, indicando tra parentesi quadre la matrice Jacobiana,
$ var(vb(r)) = [pdv(vb(r), vb(q))(vb(q))] var(vb(q)). $
Allora
$ m dot.double(vb(r)) dprod var(vb(r)) = m dot.double(vb(r)) dprod [pdv(vb(r), vb(q)) var(vb(q))] = m [pdv(vb(r), vb(q))]^TT dot.double(vb(r)) dprod var(vb(q)). $ <transpose>
Ma, si ha che
$ [pdv(vb(r), vb(q))]^TT dot.double(vb(r)) = dv(, t) ([pdv(vb(r), vb(q))]^TT dot(vb(r))) - (dv(, t) [pdv(vb(r), vb(q))]^TT) dot(vb(r)). $ <transpose_derivative>
Se le $vb(r)(vb(q), t)$ sono funzioni lisce (regolari), allora
$ dv(, t) [pdv(vb(r), vb(q))] = dv(dot(vb(r)), vb(q)), $
infatti,
$ dv(, t) pdv(r_i, q_j) = sum_(k=1)^d pdv(r_i, q_k, q_j) dot(q_k) + pdv(r_i, t, q_j) = sum_(k=1)^d pdv(r_i, q_j, q_k) dot(q_k) + pdv(r_i, q_j, t) = pdv(, q_j) (dv(, t) r_i). $

Per definizione, vale anche che
$ [pdv(vb(r), vb(q))]=[pdv(dot(vb(r)), dot(vb(q)))]. $ <jacobian_derivative>

Infatti la trasformazione $(vb(q), dot(vb(q)), t) |-> dot(vb(r))$ è definita in
maniera che valga
$ dot(vb(r)) = [pdv(vb(r), vb(q))] dot(vb(q)) + dv(vb(r), t). $

Utilizzando le @transpose_derivative, @jacobian_derivative in @transpose,
$ m dot.double(vb(r)) dprod var(vb(r)) = m (dv(, t) ([pdv(vb(r), vb(q))]^TT dot(vb(r))) - (dv(, t) [pdv(vb(r), vb(q))]^TT) dot(vb(r))) dprod var(vb(q)). $ <all_together>

#set math.equation(numbering: none)

Si esprime ora l'energia cinetica nelle coordinate $(vb(q), dot(vb(q)), t)$,
ossia $scriptT(vb(q), dot(vb(q)), t)=T(dot(vb(r))(vb(q), dot(vb(q)), t))$,

$ dv(scriptT, dot(q_j)) = sum_(i=1)^n dv(scriptT, dot(r_i)) dv(dot(r_i), dot(q_j)) = m sum_(i=1)^n dot(r_i) dv(dot(r_i), dot(q_j)) = m ([pdv(dot(vb(r)), dot(q_j))]^TT dot(vb(r)))_j $
$ ==> grad_dot(vb(q)) scriptT = m [pdv(dot(vb(r)), dot(vb(q)))]^TT dot(vb(r)). $

Analogamente, sostituendo $dot(q_j)$ con $q_j$, si ottiene
$ grad_vb(q) scriptT = m [pdv(dot(vb(r)), vb(q))]^TT dot(vb(r)). $
La @all_together diventa quindi
$ m dot.double(vb(r)) dprod var(vb(r)) = (dv(, t) (grad_dot(vb(q)) scriptT) - grad_vb(q) scriptT) dprod var(vb(q)). $

Si introduce la _forza generalizzata_ $vb(G)(vb(q), dot(vb(q)), t)$
$ vb(G)(vb(q), dot(vb(q)), t)=[pdv(vb(r), vb(q))]^TT vb(F)(vb(q), dot(vb(q)), t). $

Dall'ultima espressione trovata, si ha che
$ (dv(, t) (grad_dot(vb(q)) scriptT) - grad_vb(q) scriptT) dprod var(vb(q)) = vb(F) dprod var(vb(r)) = vb(F) dprod [pdv(vb(r), vb(q))]^TT var(vb(q)) = vb(G) dprod var(vb(q)). $

Se si hanno soltanto vincoli olonomi, allora i $var(vb(q))$ sono vettori liberi,
e dunque in quest'ultima equazione si può usare qualsiasi $var(vb(q)) in RR^d$:
$ dv(, t) (grad_dot(vb(q)) scriptT) - grad_vb(q) scriptT = vb(G). $
L'ipotesi di avere vincoli olonomi equivale a dire che l'unico vincolo è
appartenere alla varietà $M_t$ nello spazio delle configurazioni $RR^n$, data
dalle carte $vb(q) |-> vb(r)(vb(q),t)$.

Nel caso olonomo, quindi, gli spostamenti virtuali $var(vb(r))$ sono i vettori
tangenti a $M_t$ in $vb(r)$, ovvero la posizione del sistema al tempo $t$ "di
congelamento". Questa è una definizione ben posta, differentemente dalla
precedente, in cui si parlava di spostamenti infinitesimi. Inoltre, gli
spostamenti virtuali sono mappati da vettori liberi $var(vb(q))$ di $RR^d$ (non
ci sono cioè restrizioni per $var(vb(q))$) secondo l'equazione già vista $var(vb(r)) = [pdv(vb(r), vb(q))] var(vb(q))$.

Se, inoltre, $vb(F)$ è un campo di forze conservativo, $vb(F(r))=-grad_vb(r) U(vb(r),t)$,
allora si può esprimere l'energia come $scriptU(vb(q), t) = U(vb(r)(vb(q),t),t)$ e
osservare che
$ grad_vb(q) scriptU = [pdv(vb(r), vb(q))]^TT grad_vb(r) U = -[pdv(vb(r), vb(q))]^TT vb(F) = -vb(G). $

Si ha allora che, per $scriptL = scriptT- scriptU$,
$ dv(, t) grad_dot(vb(q)) scriptL - grad_vb(q) scriptL = 0. $

Si noti che le equazioni del moto nel caso di soli vincoli olonomi solo le
equazioni di Eulero-Lagrange per $scriptL(vb(q), dot(vb(q)), t) = L(vb(r)(vb(q), t), [pdv(vb(r), vb(q)) (vb(q),t)] dot(vb(q)) + pdv(vb(r), t)(vb(q),t)),$ data
dal potenziale generalizzato.

Infatti, si dimostra che 
$ vb(G)=[pdv(vb(r), vb(q))]^TT vb(F) = dv(, t) grad_dot(vb(q)) scriptU - grad_vb(q) scriptU $
con $scriptU(vb(q), dot(vb(q)), t) = U(vb(r)(vb(q), t), [pdv(vb(r), vb(q)) (vb(q),t)] dot(vb(q)) + pdv(vb(r), t)(vb(q),t))$.

$ ==> vb(G)(vb(q), dot(vb(q)), t) &= [pdv(vb(r), vb(q))]^TT vb(F) = [pdv(vb(r), vb(q))]^TT (dv(, t) grad_dot(vb(r)) U - grad_vb(r) U) = [pdv(vb(r), vb(q))]^TT dv(, t) grad_dot(vb(r)) U - [pdv(vb(r), vb(q))]^TT grad_vb(r) U 
\                               &= dv(, t) ([pdv(vb(r), vb(q))]^TT grad_dot(vb(r)) U) - (dv(, t) [pdv(vb(r), vb(q))]^TT grad_vb(r) U) - [pdv(vb(r), vb(q))]^TT grad_vb(r) U 
\                               &= dv(, t) ([pdv(dot(vb(r)), dot(vb(q)))]^TT grad_vb(r) U)- [pdv(dot(vb(r)), vb(q))]^TT grad_dot(vb(r)) U - [pdv(vb(r), vb(q))]^TT grad_vb(r) U. $

#lemma[
  data una funzione $f: RR^(2n+1) -> RR$, $f(vb(r), dot(vb(r)), t)$, e una
  funzione $phi: RR^(2d +1) -> RR^(2n+1)$, $phi(vb(q), dot(vb(q)), t)$, si pone
  $ tilde(f) = f compose phi: RR^(2n+1) -> RR. $
  Vale che
  $ grad_vb(q) tilde(f) = [pdv(vb(r), vb(q))]^TT grad_vb(r) tilde(f) + [pdv(dot(vb(r)), vb(q))]^TT grad_dot(vb(r)) tilde(f) $
  $ grad_dot(vb(q)) tilde(f) = [pdv(vb(r), vb(q))]^TT grad_dot(vb(r)) tilde(f) + [pdv(dot(vb(r)), dot(vb(q)))]^TT grad_dot(vb(r)) tilde(f) $
]

La dimostrazione è lasciata come esercizio. Utilizzando questo lemma, osservando
che $vb(r) = vb(r)(vb(q), t)$ (che implica che $[pdv(vb(r), dot(vb(q)))]=0$),
$ vb(G)(vb(q), dot(vb(q)), t) = dv(, t) grad_vb(q) scriptU(vb(q), dot(vb(q)), t)-grad_vb(q) scriptU(vb(q), dot(vb(q)), t) $
che era quanto si voleva mostrare.

// "Vi meritate una birra o una qualunque altra sostanza psicotropa. Ci vediamo domani"

Si presenta una serie di esempi di sistemi vincolati, in cui si vogliono trovare
le espressioni delle equazioni di Eulero-Lagrange.

#example[
  si considera l'esempio della particella vincolata da un filo metallico (@ring),
  di forma data da $G(psi)$ (il grafico della funzione $psi$), nel piano $(x,z)$,
  soggetta alla forza di gravità ($U = m g z$, $T = m/2 (dot(x)^2+dot(z)^2)$).
   
  Si vuole mappare la varietà data dal grafico di $psi$ (il vincolo è scleronomo),
  in modo da poter esprimere la lagrangiana nella coordinata generalizzata $q$:
  $ cases(x=q, z=psi(q)) ==> vb(r)(q)=(q, psi(q)). $
   
  $ ==> T = m/2 (dot(x)^2+dot(z)^2) = m/2(dot(q)^2 + (psi'(q)dot(q))^2) = scriptT(vb(q), dot(vb(q))) $
  $ U(z) = m g z = m g phi(q) = scriptU(q) $
  $ ==> scriptL = m/2 dot(q)^2(1 + (psi'(q))^2) - m g psi(q) $
  $ pdv(scriptL, dot(q)) = m dot(q)(1+(psi'(q))^2) $
  $ ==> dv(, t) pdv(scriptL, dot(q)) = m dot.double(q) (1+(psi'(q))^2) + 2m dot(q)^2 psi'(q) psi''(q) $
  $ pdv(scriptL, q) = m dot(q) psi'(q) psi''(q) - m g psi'(q). $
  Si può scrivere quindi l'equazione di Eulero-Lagrange (la massa si semplifica):
  $ (1+(psi'(q))^2) dot.double(q)+ psi'(q) psi''(q) dot(q)^2 + g psi'(q) = 0. $
   
  Si considera, per esempio, il caso di un piano inclinato, per cui $psi(q) = a q$.
  In tal caso, l'equazione di Eulero-Lagrange si riscrive
  $ (1+a^2) dot.double(q) + g a = 0 <==> dot.double(q) = -a/(1+a^2) g. $
  siccome $a = tan theta$, con $theta$ angolo del piano inclinato, allora,
  riscrivendo l'equazione rispetto alla costante $theta$,
  $ dot.double(q) = -g sin theta cos theta. $
  Scegliendo, al posto di $q$ una variabile $rho$ lungo il piano inclinato: $rho = q/(cos theta)$,
  si ottiene
  $ dot.double(rho) = - g sin theta $
  che è esattamente la consueta equazione del piano inclinato.
]

#example[
  si considera una particella vincolata ad un filo inclinato di equazione (al
  tempo $t=0$) $z=a x + c$ che si muove verso l'alto con accelerazione costante $b$ (vincolo
  reonomo), non soggetta a forze esterne ($U = 0$).
   
  $ vb(r)(q(t),t) = (q, a q + c + b/2 t^2) $
  $ ==> dot(vb(r))(q(t),t) = (dot(q), a dot(q) + b t) = [pdv(vb(r), q)] dot(q) + pdv(vb(r), t) $
  $ ==> norm(dot(vb(r)))^2 = dot(q)^2 (1+ a^2) + 2a b t dot(q) + b^2 t^2. $
  Allora, dato che $scriptL=scriptT$,
  $ pdv(scriptL, dot(q)) = m(1+a^2)dot(q) + m a b t $
  $ ==> dv(, t)pdv(scriptL, dot(q)) = m((1+a^2)dot.double(q)+a b) $
  $ pdv(scriptL, q)=0. $
  L'equazione di Eulero-Lagrange è allora
  $ (1+a^2)dot.double(q)+a b=0 <==> dot.double(q) = -a/(1+a^2) b. $
   
  Facendo riferimento a quanto detto alla fine dell'esempio precedente, si può
  riscrivere l'espressione in funzione dell'angolo $theta$:
  $ dot.double(q) = -b sin theta cos theta. $
   
  Quindi il caso in cui il vincolo accelera verso l'alto è equivalente al caso in
  cui la particella è accelerata verso il basso.
]

#example[
  si considera una particella vincolata ad una superficie di rotazione attorno
  all'asse $z$ (data dalla rotazione completa di una curva rispetto all'asse $z$),
  non soggetta a forze esterne.
   
  Si introducono le coordinate cilindriche, che hanno simmetria rotazionale
  attorno all'asse $z$:
  $ cases(x=r cos phi, y = r sin phi, z = z). $
   
  Si assume che la superficie sia data dall'equazione $r=r(z)$ (non viene trattato
  il caso in cui la superficie di rotazione è data dalla rotazione di una curva
  del tipo $z=z(x)$).
   
  Si prendono come variabili generalizzate $z$ e $phi$. La carta è allora
  $ (z,phi) |-> (r(z) cos phi, r(z) sin phi, z) $
   
  // "Facciamo come si fa da grandi, utilizando sempre T senza cambiare carattere"
  $ ==> dot(vb(r)) = (r'(z) dot(z) cos phi - r(z) sin phi dot(phi), r'(z) dot(z) sin phi + r(z) cos phi dot(phi), dot(z)). $
  Il resto dei calcoli è lasciato come esercizio. Si ha infine
  $ T = 1/2 (dot(r)^2 + r^2 dot(phi)^2 + dot(z)^2) = 1/2 ((r'(z) dot(z))^2 + (r(z) dot(phi))^2 + dot(z)^2) = T(z, dot(z), dot(phi)) = L(z, dot(z), dot(phi)). $
  L'energia cinetica non dipende da $phi$, per la simmetria del sistema, e dunque $phi$ è
  una coordinata ciclica, e quindi ci si aspetta che
  $ pdv(L, dot(phi)) = "costante". $
   
  $ pdv(L, dot(z)) = (1+(r'(z))^2) dot(z) $
  $ ==> dv(, t) pdv(L, dot(z)) = (1+(r'(z))^2) dot.double(z) + 2 r'(z) r''(z) dot(z)^2 $
  $ pdv(L, z) = r'(z) r''(z) dot(z)^2+r(z) r'(z) dot(phi)^2. $
   
  L'equazione di Eulero-Lagrange nella prima coordinata (in $(z, dot(z))$) è
  $ (1+(r'(z))^2) dot.double(z) + r'(z) r''(z) dot(z)^2 - r(z) r'(z) dot(phi)^2 = 0. $
   
  Per quanto riguarda l'equazione di Eulero-Lagrange nella seconda coordinata,
  invece,
  $ pdv(L, dot(phi)) = (r(z))^2 dot(phi) = L_0 $
  che è quindi una costante, come ci si aspettava.
]

#def[
  // Integrare con le dispense del prof
  una _geodetica_ è una soluzione fisica di equazioni vincolate con forze attive
  nulle.
]

#exercise[
  mostrare che, in relazione all'esempio precedente, tutti i meridiani (curve a $phi$ costante)
  sono geodetiche, i paralleli (curve a $z$ costante) sono geodetiche se
  corrispondono a una $z$ per cui $r'(z) = 0$.
   
  Rifare poi tutti i conti dell'esempio precedente nel caso non trattato in cui si
  fa ruotare una curva del tipo $z=z(x)$.
]

Si noti che in quest'ultimo esempio $norm(dot(vb(r)))$ è una costante del moto.
Infatti, 
+ La reazione vincolare non compie lavoro, quindi la conservazione dell'energia
  vale anche se si esclude la parte di sistema che genera la reazione vincolare.
  Dunque, per la particella considerata, si conserva $T+U=T$. Ma allora si
  conserva $norm(vb(dot(r)))^2$ e dunque $norm(vb(dot(r)))$.
+ Per il principio di D'Alembert, la reazione vincolare è perpendicolare a $T_(vb(r)(t))M$.
  Quindi 
$ dv(, t) norm(dot(vb(r)))^2 = 2 dot(vb(r)) dprod dot.double(vb(r)) = 2 dot(vb(r)) dprod vb(F_"tot") = 2 dot(vb(r)) dprod vb(R) = 0. $

Per una traiettoria qualsiasi, detto $alpha$ l'angolo formato con
l'orrizzontale, dato che $norm(dot(vb(r))) = "costante"$,
$ abs(r^2 dot(phi)) = r abs(r dot(phi)) = r norm(dot(vb(r))) abs(sin alpha) = "costante" $
$ ==> r abs(sin alpha) = "costante". $
Questa relazione è detta _Teorema di Clairaut_.

Si fanno alcune osservazioni:
+ $r$ e $abs(sin alpha)$ hanno correlazione negativa (sono inversamente
  proporzionali).
+ Se $r_0$ e $alpha_0$ sono le condizioni iniziali di $r(t)$ e $alpha(t)$, allora
  $ r(t) = (r_0 abs(sin alpha_0))/abs(sin alpha(t)) >= r_0 abs(sin alpha_0). $
  Quindi $r_0 abs(sin alpha_0)$ è il raggio minimo.

