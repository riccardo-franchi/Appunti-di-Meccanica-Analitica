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
  )
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
$ m diaer(vb(r)) = vb(F) + vb(R). $

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

$ m diaer(vb(r)) dprod var(vb(r)) = vb(F) dprod var(vb(r)). $

Si utilizzano le carte e i concetti definiti nel capitolo precedente, che
consentono di descrivere il moto (e quindi gli spostamenti infinitesimi)
vincolato nelle $vb(r)$ tramite il moto nelle $vb(q)$, perché in molti casi gli
spostamenti infinitesimi nelle $vb(q)$ saranno _liberi_.

Vale che, indicando tra parentesi quadre la matrice Jacobiana,
$ var(vb(r)) = [pdv(vb(r), vb(q))(vb(q))] var(vb(q)). $
Allora

#set math.equation(numbering: "(1)")
$ m diaer(vb(r)) dprod var(vb(r)) = m diaer(vb(r)) dprod [pdv(vb(r), vb(q)) var(vb(q))] = m [pdv(vb(r), vb(q))]^TT diaer(vb(r)) dprod var(vb(q)). $ <transpose>
Ma, si ha che
$ [pdv(vb(r), vb(q))]^TT diaer(vb(r)) = dv(, t) ([pdv(vb(r), vb(q))]^TT vb(dot(r))) - (dv(, t) [pdv(vb(r), vb(q))]^TT) vb(dot(r)). $ <transpose_derivative>
#set math.equation(numbering: none)
Se le $vb(r)(vb(q), t)$ sono funzioni lisce (regolari), allora
$ dv(, t) [pdv(vb(r), vb(q))] = dv(vb(dot(r)), vb(q)), $
infatti,
$ dv(, t) pdv(r_i, q_j) = sum_(k=1)^d pdv(r_i, q_k, q_j) dot(q)_k + pdv(r_i, t, q_j) = sum_(k=1)^d pdv(r_i, q_j, q_k) dot(q)_k + pdv(r_i, q_j, t) = pdv(, q_j) (dv(, t) r_i). $

Per definizione, vale anche che
#set math.equation(numbering: "(1)")
$ [pdv(vb(r), vb(q))]=[pdv(vb(dot(r)), vb(dot(q)))]. $ <jacobian_derivative>
#set math.equation(numbering: none)

Infatti la trasformazione $(vb(q), vb(dot(q)), t) |-> vb(dot(r))$ è definita in
maniera che valga
$ vb(dot(r)) = [pdv(vb(r), vb(q))] vb(dot(q)) + dv(vb(r), t). $

Utilizzando le @transpose_derivative, @jacobian_derivative in @transpose,
#set math.equation(numbering: "(1)")
$ m diaer(vb(r)) dprod var(vb(r)) = m (dv(, t) ([pdv(vb(r), vb(q))]^TT vb(dot(r))) - dv(, t) [pdv(vb(r), vb(q))]^TT vb(dot(r))) dprod var(vb(q)). $ <all_together>
#set math.equation(numbering: none)


Si esprime ora l'energia cinetica nelle coordinate $(vb(q), vb(dot(q)), t)$,
ossia $scriptT(vb(q), vb(dot(q)), t)=T(vb(dot(r))(vb(q), vb(dot(q)), t))$,

$ dv(scriptT, dot(q)_j) = sum_(i=1)^n pdv(scriptT, dot(r)_i) pdv(dot(r)_i, dot(q)_j) = m sum_(i=1)^n dot(r)_i pdv(dot(r)_i, dot(q)_j) = m ([pdv(vb(dot(r)), dot(q)_j)]^TT vb(dot(r)))_j $
$ ==> grad_vb(dot(q)) scriptT = m [pdv(vb(dot(r)), vb(dot(q)))]^TT vb(dot(r)). $

Analogamente, sostituendo $dot(q)_j$ con $q_j$, si ottiene
$ grad_vb(q) scriptT = m [pdv(vb(dot(r)), vb(q))]^TT vb(dot(r)). $
La @all_together diventa quindi
$ m diaer(vb(r)) dprod var(vb(r)) = (dv(, t) (grad_vb(dot(q)) scriptT) - grad_vb(q) scriptT) dprod var(vb(q)). $

Si introduce la _forza generalizzata_ $vb(G)(vb(q), vb(dot(q)), t)$
$ vb(G)(vb(q), vb(dot(q)), t)=[pdv(vb(r), vb(q))]^TT vb(F)(vb(q), vb(dot(q)), t). $

Dall'ultima espressione trovata, si ha che
$ (dv(, t) (grad_vb(dot(q)) scriptT) - grad_vb(q) scriptT) dprod var(vb(q)) = vb(F) dprod var(vb(r)) = vb(F) dprod [pdv(vb(r), vb(q))]^TT var(vb(q)) = vb(G) dprod var(vb(q)). $

Se si hanno soltanto vincoli olonomi, allora i $var(vb(q))$ sono vettori liberi,
e dunque in quest'ultima equazione si può usare qualsiasi $var(vb(q)) in RR^d$:
$ dv(, t) (grad_vb(dot(q)) scriptT) - grad_vb(q) scriptT = vb(G). $
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
$ dv(, t) grad_vb(dot(q)) scriptL - grad_vb(q) scriptL = 0. $

Si noti che le equazioni del moto in un sistema con soli vincoli olonomi e con
forze date da un potenziale generalizzato sono le equazioni di Eulero-Lagrange
per $scriptL(vb(q), vb(dot(q)), t) = L(vb(r)(vb(q), t), [pdv(vb(r), vb(q)) (vb(q),t)] vb(dot(q)) + pdv(vb(r), t)(vb(q),t)),$ data
dal potenziale generalizzato.

Infatti, si dimostra che 
$ vb(G)=[pdv(vb(r), vb(q))]^TT vb(F) = dv(, t) grad_vb(dot(q)) scriptU - grad_vb(q) scriptU $
con $scriptU(vb(q), vb(dot(q)), t) = U(vb(r)(vb(q), t), [pdv(vb(r), vb(q)) (vb(q),t)] vb(dot(q)) + pdv(vb(r), t)(vb(q),t), t)$.

$ ==> vb(G)(vb(q), vb(dot(q)), t) &= [pdv(vb(r), vb(q))]^TT vb(F) = [pdv(vb(r), vb(q))]^TT (dv(, t) grad_vb(dot(r)) U - grad_vb(r) U) = [pdv(vb(r), vb(q))]^TT dv(, t) grad_vb(dot(r)) U - [pdv(vb(r), vb(q))]^TT grad_vb(r) U 
\                               &= dv(, t) ([pdv(vb(r), vb(q))]^TT grad_vb(dot(r)) U) - (dv(, t) [pdv(vb(r), vb(q))]^TT grad_vb(dot(r)) U) - [pdv(vb(r), vb(q))]^TT grad_vb(r) U 
\                               &= dv(, t) ([pdv(vb(dot(r)), vb(dot(q)))]^TT grad_vb(dot(r)) U)- [pdv(vb(dot(r)), vb(q))]^TT grad_vb(dot(r)) U - [pdv(vb(r), vb(q))]^TT grad_vb(r) U = dv(, t) grad_vb(dot(q)) scriptU - grad_vb(q) scriptU $
dove, nell'ultimo passaggio, si è applicato il seguente lemma:

#lemma[
  data una funzione $f: RR^(2n+1) -> RR$, $f(vb(r), vb(dot(r)), t)$, e una
  funzione $phi: RR^(2d +1) -> RR^(2n+1)$, $phi(vb(q), vb(dot(q)), t) = (vb(r)(vb(q), vb(dot(q)), t), vb(dot(r))(vb(q), vb(dot(q)), t),t)$,
  si pone
  $ tilde(f) = f compose phi: RR^(2n+1) -> RR. $
  Vale che
  $ grad_vb(q) tilde(f) = [pdv(vb(r), vb(q))]^TT grad_vb(r) f + [pdv(vb(dot(r)), vb(q))]^TT grad_vb(dot(r)) f $
  $ grad_vb(dot(q)) tilde(f) = [pdv(vb(r), vb(dot(q)))]^TT grad_vb(r) f + [pdv(vb(dot(r)), vb(dot(q)))]^TT grad_vb(dot(r)) f $
]

La dimostrazione è lasciata come esercizio. Utilizzando questo lemma, osservando
che $vb(r) = vb(r)(vb(q), t)$ (che implica che $[pdv(vb(r), vb(dot(q)))]=0$),
$ vb(G)(vb(q), vb(dot(q)), t) = dv(, t) grad_vb(q) scriptU(vb(q), vb(dot(q)), t)-grad_vb(q) scriptU(vb(q), vb(dot(q)), t) $
che era quanto si voleva mostrare.

Si presenta una serie di esempi di sistemi vincolati, in cui si vogliono trovare
le espressioni delle equazioni di Eulero-Lagrange.

#example[
  si considera l'esempio della particella vincolata da un filo metallico (@ring),
  di forma data da $G(psi)$ (il grafico della funzione $psi$), nel piano $(x,z)$,
  soggetta alla forza di gravità ($U = m g z$, $T = m/2 (dot(x)^2+dot(z)^2)$).
   
  Si vuole mappare la varietà data dal grafico di $psi$ (il vincolo è scleronomo),
  in modo da poter esprimere la lagrangiana nella coordinata generalizzata $q$:
  $ cases(x=q, z=psi(q)) ==> vb(r)(q)=(q, psi(q)). $
   
  $ ==> T = m/2 (dot(x)^2+dot(z)^2) = m/2(dot(q)^2 + (psi'(q)dot(q))^2) = scriptT(vb(q), vb(dot(q))) $
  $ U(z) = m g z = m g phi(q) = scriptU(q) $
  $ ==> scriptL = m/2 dot(q)^2(1 + (psi'(q))^2) - m g psi(q) $
  $ pdv(scriptL, dot(q)) = m dot(q)(1+(psi'(q))^2) $
  $ ==> dv(, t) pdv(scriptL, dot(q)) = m diaer(q) (1+(psi'(q))^2) + 2m dot(q)^2 psi'(q) psi''(q) $
  $ pdv(scriptL, q) = m dot(q) psi'(q) psi''(q) - m g psi'(q). $
  Si può scrivere quindi l'equazione di Eulero-Lagrange (la massa si semplifica):
  $ (1+(psi'(q))^2) diaer(q)+ psi'(q) psi''(q) dot(q)^2 + g psi'(q) = 0. $
   
  Si considera, per esempio, il caso di un piano inclinato, per cui $psi(q) = a q$.
  In tal caso, l'equazione di Eulero-Lagrange si riscrive
  $ (1+a^2) diaer(q) + g a = 0 <==> diaer(q) = -a/(1+a^2) g. $
  siccome $a = tan theta$, con $theta$ angolo del piano inclinato, allora,
  riscrivendo l'equazione rispetto alla costante $theta$,
  $ diaer(q) = -g sin theta cos theta. $
  Scegliendo, al posto di $q$ una variabile $rho$ lungo il piano inclinato: $rho = q/(cos theta)$,
  si ottiene
  $ diaer(rho) = - g sin theta $
  che è esattamente la consueta equazione del piano inclinato.
]

#example[
  si considera una particella vincolata ad un filo inclinato di equazione (al
  tempo $t=0$) $z=a x + c$ che si muove verso l'alto con accelerazione costante $b$ (vincolo
  reonomo), non soggetta a forze esterne ($U = 0$).
   
  $ vb(r)(q(t),t) = (q, a q + c + b/2 t^2) $
  $ ==> vb(dot(r))(q(t),t) = (dot(q), a dot(q) + b t) = [pdv(vb(r), q)] dot(q) + pdv(vb(r), t) $
  $ ==> norm(vb(dot(r)))^2 = dot(q)^2 (1+ a^2) + 2a b t dot(q) + b^2 t^2. $
  Allora, dato che $scriptL=scriptT$,
  $ pdv(scriptL, dot(q)) = m(1+a^2)dot(q) + m a b t $
  $ ==> dv(, t)pdv(scriptL, dot(q)) = m((1+a^2)diaer(q)+a b) $
  $ pdv(scriptL, q)=0. $
  L'equazione di Eulero-Lagrange è allora
  $ (1+a^2)diaer(q)+a b=0 <==> diaer(q) = -a/(1+a^2) b. $
   
  Facendo riferimento a quanto detto alla fine dell'esempio precedente, si può
  riscrivere l'espressione in funzione dell'angolo $theta$:
  $ diaer(q) = -b sin theta cos theta. $
   
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
   
  $ ==> vb(dot(r)) = (r'(z) dot(z) cos phi - r(z) sin phi dot(phi), r'(z) dot(z) sin phi + r(z) cos phi dot(phi), dot(z)). $
  Il resto dei calcoli è lasciato come esercizio. Si ha infine
  $ T = 1/2 (dot(r)^2 + r^2 dot(phi)^2 + dot(z)^2) = 1/2 ((r'(z) dot(z))^2 + (r(z) dot(phi))^2 + dot(z)^2) = T(z, dot(z), dot(phi)) = L(z, dot(z), dot(phi)). $
  L'energia cinetica non dipende da $phi$, per la simmetria del sistema, e dunque $phi$ è
  una coordinata ciclica, e quindi ci si aspetta che
  $ pdv(L, dot(phi)) = "costante". $
   
  $ pdv(L, dot(z)) = (1+(r'(z))^2) dot(z) $
  $ ==> dv(, t) pdv(L, dot(z)) = (1+(r'(z))^2) diaer(z) + 2 r'(z) r''(z) dot(z)^2 $
  $ pdv(L, z) = r'(z) r''(z) dot(z)^2+r(z) r'(z) dot(phi)^2. $
   
  L'equazione di Eulero-Lagrange nella prima coordinata (in $(z, dot(z))$) è
  $ (1+(r'(z))^2) diaer(z) + r'(z) r''(z) dot(z)^2 - r(z) r'(z) dot(phi)^2 = 0. $
   
  Per quanto riguarda l'equazione di Eulero-Lagrange nella seconda coordinata,
  invece,
  $ pdv(L, dot(phi)) = (r(z))^2 dot(phi) = L_0 $
  che è quindi una costante, come ci si aspettava.
]

#def[
  una _geodetica_ è una soluzione fisica (una legge oraria) di equazioni vincolate
  in assenza di forze esterne.
]

#exercise[
  mostrare che, in relazione all'esempio precedente, tutti i meridiani (curve a $phi$ costante)
  sono geodetiche, i paralleli (curve a $z$ costante) sono geodetiche se
  corrispondono a una $z$ per cui $r'(z) = 0$.
   
  Rifare poi tutti i conti dell'esempio precedente nel caso non trattato in cui si
  fa ruotare una curva del tipo $z=z(x)$.
]
Riguardo alle geodetiche generali per questo problema, si potrebbe ricavare $dot(phi)$ dalla
seconda equazione di Eulero-Lagrange e inserirla nella prima, ottenendo
un'equazione differenziale in $z$, che si potrebbe ricondurre a un problema
monodimensionale.

Tuttavia in questo caso è più semplice ragionare in maniera geometrica. Si noti
innanzitutto che $norm(vb(dot(r)))$ è una costante del moto. Infatti, 
+ La reazione vincolare non compie lavoro, quindi la conservazione dell'energia
  vale anche se si esclude la parte di sistema che genera la reazione vincolare.
  Dunque, per la particella considerata, si conserva $T+U=T$. Ma allora si
  conserva $norm(vb(dot(r)))^2$ e dunque $norm(vb(dot(r)))$.
+ Per il principio di D'Alembert, la reazione vincolare è perpendicolare a $T_(vb(r)(t))M$.
  Quindi 
$ dv(, t) norm(vb(dot(r)))^2 = 2 vb(dot(r)) dprod diaer(vb(r)) = 2 vb(dot(r)) dprod vb(F_"tot") = 2 vb(dot(r)) dprod vb(R) = 0. $

Per una traiettoria qualsiasi, detto $alpha$ l'angolo che la traiettoria $vb(dot(r))$
forma con il meridiano passente per il punto $vb(r)(t)$, dato che $norm(vb(dot(r))) = "costante"$,
$ abs(r^2 dot(phi)) = r abs(r dot(phi)) = r norm(vb(dot(r))) abs(sin alpha) = "costante" $
$ ==> r abs(sin alpha) = "costante". $
Questa relazione è detta _teorema di Clairaut_, e mostra che, quando $r$ cresce
o descresce, il vettore velocità diventa rispettivamente meno o più orizzontale.

Si fanno alcune osservazioni:
+ $r$ e $abs(sin alpha)$ hanno correlazione negativa (sono inversamente
  proporzionali).
+ Se $r_0$ e $alpha_0$ sono le condizioni iniziali di $r(t)$ e $alpha(t)$, allora
   
  #box(
    width: 100%,
  )[$ r(t) = (r_0 abs(sin alpha_0))/abs(sin alpha(t)) >= r_0 abs(sin alpha_0). $]
  Quindi $r_0 abs(sin alpha_0)$ è il raggio minimo.

#example[
  un esempio di applicazione del teorema di Clairaut è dato dalla superficie
  laterale di un cono. Naturalmente, essa è una superficie di rotazione.
  Considerata una particella su un parallelo generico, con velocità iniziale $vb(v_0)$.
  Poiché si ha
  $ r abs(sin alpha) = "costante" = r_0 abs(sin alpha_0) = r_0 $
  $ ==> r >= r_0 abs(sin alpha_0) = r_0, $
  la particella tende allora ad andare verso la base del cono.
]

== Il principio di minima azione vincolata

Si assume di avere solo vincoli scleronomi, dati dalla condizione che $vb(r) in M$ (il
vincolo è dato da un sottoinsieme $RR^n$ che è anche una varietà
differenziabile). Si considera il funzionale d'azione
$ Phi(vb(r)) = integral_(t_0)^(t_1) L(vb(r)(t), vb(dot(r))(t), t) dd(t) $
ma con $vb(r): [t_0,t_1] -> M$ e non in $RR^n$.

#def[
  si dice che $vb(r)$ è un _estremale vincolato_ ad $M$ del funzionale $Phi$ come
  sopra, se 
  $ Phi(vb(r)+vb(h))-Phi(vb(r)) = o(norm(vb(h))_(C^1)) $
  $forall vb(h) : vb(r)(t) + vb(h)(t) in M, forall t in [t_0,t_1], vb(h)(t_0)=vb(h)(t_1)=0$.
]

Per le lagrangiane viste finora (date dalla differenza tra energia cinetica ed
energia potenziale generalizzata) vale che una legge oraria è un estremale
vincolato a $M$ se e solo se vale per essa il principio di D'Alembert. Questo
corrobora sia quest'ultimo sia il fatto che la legge oraria fisica, in presenza
di un vincolo scleronomo sia proprio un estremale vincolato.

#theorem[
  dato un vincolo scleronomo rappresentato dalla varietà $M$, una legge oraria $vb(r): [t_0,t_1]->M$ è
  un estremale vincolato ad $M$ se e solo se, per essa vale il principio di
  D'Alembert:
  $ (m diaer(vb(r)) - vb(F)(vb(r)(t), vb(dot(r))(t), t)) dprod var(vb(r_t))=0 $
  $forall t in [t_0,t_1], forall var(vb(r_t)) in T_(vb(r)(t))M$.
]

Si danno due dimostrazioni del teorema, di cui una è più generale.

#dim(
  "meno generale",
)[
  Si assume, oltre alle ipotesi del teorema, che $vb(r)([t_0,t_1])$ sia contenuta
  nell'immagine di una sola carta.
   
  Per il principio di D'Alembert, le leggi orarie fisiche sono tutte e sole quelle
  che in coordinate locali $vb(q)$ soddisfano le equazioni di Eulero-Lagrange
  $ dv(, t) grad_vb(dot(q)) scriptL - grad_vb(q) scriptL = 0, $
  che corrisponde a un problema libero in $RR^d$ per $scriptL(vb(q), vb(dot(q)), t)$,
  cioè è equivalente ad essere un estremale libero di 
  $ Phi_0(vb(q)) = integral_(t_0)^(t_1) scriptL(vb(q)(t), vb(dot(q))(t), t) dd(t) = integral_(t_0)^(t_1) L(vb(r)(t), vb(dot(r))(t), t) dd(t) $
  che è quindi equivalente al fatto che la $vb(r)(t)$ corrisponde a $vb(q)(t)$ è
  estremale vincolato di $Phi(vb(r))$, dato che i due funzionali descrivono la
  stessa quantità fisica (l'azione, cioè l'integrale della lagrangiana).
   
  Si noti che, chiamando $vb(q)(t) + vb(g)(t)$ la funzione in coordinate locali
  corrispondente a $vb(r)(t)+vb(h)(t)$, allora $o(vb(g)) = o(vb(h))$. È "ovvio" se
  la carta è differenziabile.
   
  Viceversa, se vale il principio di minima azione vincolata in $M$ (per la legge
  oraria $vb(r)$), allora vale il principio di minima azione libera in $RR^d$ per $scriptL$ e
  per la legge oraria $vb(q)$. Questo vale se e solo se valgono le equazioni di
  Eulero-Lagrange per $vb(q)$
  $ (dv(, t) grad_vb(dot(q)) scriptL - grad_vb(q) scriptL) dprod var(vb(q)) = 0 $
  $forall var(vb(q)) in RR^d$.
]

Per la seconda dimostrazione del teorema, è utile il seguente lemma.

#lemma[
  sia $vb(r): [t_0,t_1]->M$ una legge oraria e $vb(f): [t_0,t_1]->RR^n$ una
  funzione continua. Se, per ogni funzione contiuna $vb(xi): [t_0,t_1]->RR^n$ tale
  che $vb(xi)(t) in T_vb(r) M$, vale 
  $ integral_(t_0)^(t_1) vb(f)(t) dprod vb(xi)(t) dd(t) = 0, $
  allora $vb(f)(t)$ è perpendicolare a $T_vb(r) M, forall t in [t_0,t_1]$.
]

La dimostrazione del lemma, equivalente al lemma già fatto nel caso libero, è
lasciata come esercizio.

#dim[
  dato $vb(h)(t)$ tale che $vb(h)(t_0) = vb(h)(t_1)=0$, pensato come "infinitesimo",
  esiste un vettore in $T_(vb(r)(t)) M$ detto $var(vb(r)(t))$, tale che
  sostituendo $var(vb(r)(t))$ a $vb(h)(t)$ nelle formule a venire si commette un
  errore $o(norm(vb(h)(t))) = o(norm(var(vb(r)(t))))$ (ad esempio $var(vb(r))(t)$ può
  essere pensato come la proiezione ortogonale di $vb(h)(t)$ su $T_(vb(r)(t))M$).
   
  Quindi, ricordando la sezione sul funzionale d'azione libero,
  $ Phi(vb(r)+vb(h)) - Phi(vb(r)) = integral_(t_0)^(t_1) (dv(, t) grad_vb(dot(r)) L - grad_vb(r) L) dprod var(vb(r)) dd(t) + o(norm(vb(h))) = integral_(t_0)^(t_1) (m vb(diaer(r)) - vb(F)) dprod var(vb(r)) dd(t) + o(norm(vb(h))). $
  Il principio di D'Alembert implica che l'integrale è nullo e quindi $vb(r)$ è un
  estremale condizionato (vincolato).
   
  Viceversa, se $vb(r)$ è un estremale condizionato,
  $ integral_(t_0)^(t_1) (m diaer(vb(r)) - vb(F)(vb(r)(t), vb(dot(r))(t), t)) dprod var(vb(r)(t)) dd(t) = 0 $
  per ogni variazione $var(vb(r))(t)$. Ciò implica il principio di D'Alembert per
  il lemma precedente.
]

#example[
  si mostra che le leggi orarie soluzioni di un sistema lagrangiano vincolato non
  dipendono dalla carta (dalle coordinate locali).
   
  Considerata una legge oraria con le caratteristiche appena elencate, su una
  certa varietà differenziabile, si considerano due carte distinte $phi_alpha$ e $phi_beta$.
  Dalla parte della carta $phi_alpha$ (a cui corrisponde la coordinata locale $vb(q)$),
  si scrive la lagrangiana $L(vb(q), vb(dot(q)), t)$. Dalla parte della carta $phi_beta$ (a
  cui corrisponde la coordinata locale $vb(Q)$, invece, si scrive la lagrangiana $scriptL(vb(Q), vb(dot(Q)), t)$.
  Il cambio di coordinate è dato da 
  $ vb(Q) = (phi_beta^(-1) compose phi_alpha)(vb(q)) = psi(vb(q)). $
  Si dimostra che chiamando $vb(Q)(t) = psi(vb(q)(t))$, vale
  $ dv(, t) grad_vb(dot(Q)) scriptL - grad_vb(Q) scriptL = 0 <==> dv(, t) grad_vb(dot(q)) L - grad_vb(q) L = 0. $
  Si ha che, nel caso considerato, sostituendo $(vb(q)(t), vb(dot(q))(t))$ al
  posto delle variabili libere $(vb(q), vb(dot(q)))$
  $ grad_vb(q) L = [pdv(vb(Q), vb(q))]^TT grad_vb(Q) scriptL + [pdv(vb(dot(Q)), vb(q))]^TT grad_vb(dot(Q)) scriptL = [pdv(vb(Q), vb(q))]^TT grad_vb(Q) scriptL + (dv(, t)[pdv(vb(Q), vb(q))]^TT grad_vb(dot(Q)) scriptL) $
  $ grad_vb(dot(q)) L = [pdv(vb(Q), vb(dot(q)))]^TT grad_vb(Q) scriptL + [pdv(vb(dot(Q)), vb(dot(q)))]^TT grad_vb(dot(Q)) scriptL = [pdv(vb(Q), vb(q))]^TT grad_vb(dot(Q)) scriptL. $
  $ L(vb(q), vb(dot(q)),t) = scriptL(vb(Q(q)), vb(dot(Q))(vb(q), vb(dot(q))), t) $
  $ dv(, t) grad_vb(dot(q)) L = (dv(, t)[pdv(vb(Q), vb(q))]^TT) grad_vb(dot(Q)) scriptL + [pdv(vb(Q), vb(q))]^TT dv(, t) grad_vb(Q) scriptL $
  $ ==> dv(, t) grad_vb(dot(q)) L - grad_vb(q) L = [pdv(vb(Q), vb(q))]^TT (dv(, t) grad_vb(dot(Q)) scriptL - grad_vb(Q) scriptL) $
  dunque il membro di sinistra è nullo se e solo se è nullo quello di destra,
  essendo $[pdv(vb(Q), vb(q))]^TT$ non degenere.
]

== Il teorema di Noether

Si assume anche in questo paragrafo di avere soltanto vincoli scleronomi. Si può
generalizzare il fatto che se la lagrangiana non dipende da una coordinata
(coordinata ciclica), allora si ha una quantità che si conserva, avendo una
derivata nulla.

#def[
  si dice che la funzione differenziabile $h: M->M$ _conserva_ la lagrangiana $L$ se $forall (vb(q), vb(dot(q)), t)$,
  vale che 
  $ L(vb(q),vb(dot(q)),t)=L(h(vb(q)), D h_vb(q) (vb(dot(q))), t) $
  dove $h(vb(q))$ è la notazione contratta per indicare $(phi_beta^(-1) compose h compose phi_alpha)(vb(q))$ con $alpha, beta$ variabili.
]

Sarebbe più proprio dire che il differenziale di $h$, visto come funzione sul
fibrato tangente conserva la lagrangiana, perché essa è funzione non solo dei
punti, ma dei punti e delle tangenti ai punti.

// "Non so se fare la considerazione sociologica o politica. Tutti i teoremi nell'Arnold sono chiamati con i cognomi, tranne questo che è chiamato 'di Emmy Noether', magari voleva specificare che non è il fratello"

#theorem(
  "di Noether",
)[
  nel caso di un vincolo scleronomo dato da $M$, se esiste una famiglia di
  trasformazioni $h^s : M->M, s in (-epsilon, epsilon), h^0 = "id"$,
  sufficientemente regolari, che conservano $L$, allora il corrispondente sistema
  lagrangiano ammette una costante del moto che in coordinate locali è data da
  $ I(vb(q), vb(dot(q)),t) = grad_vb(dot(q)) L(vb(q), vb(dot(q)),t) dprod eval(pdv(h^s (vb(q)), s))_(s=0). $
]
#dim[
  - Asserto 1: $forall s in (-epsilon, epsilon), vb(Q)(t) = h^s (vb(q)(t))$ soddisfa
    le equazioni di Eulero-Lagrange.
  Infatti, se $vb(dot(Q))(t) = D h^s_(vb(q)(t)) (vb(dot(q))(t))$, è immediato
  verificare che il principio di minima azione per la legge oraria $vb(q)(t)$ si
  traduce nel principio di minima azione per $vb(Q)(t)$.
   
  Data una soluzione $vb(q)(t)$ delle equazioni di Eulero-Lagrange, si definisce
  $ Gamma(s, t) = h^s (vb(q)(t)). $
  Si utilizza come notazione:
  $ dot(Gamma) = pdv(Gamma, t), space.quad Gamma' = pdv(Gamma, s). $
  Per ipotesi su $h^s$, vale 
  $ L(h^s (vb(q)(t)), D h^s_(vb(q)(t)) (vb(dot(q))(t)), t) = L(vb(q)(t), vb(dot(q))(t), t), forall s, t $
  $ ==> L(Gamma(s, t), dot(Gamma)(s,t), t) $
  è costante in $s$. La sua derivata in $s$ (a $t$ fissato) è
   
  #set math.equation(numbering: "(1)")
  $ 0 = grad_vb(q) L dprod Gamma' + grad_vb(dot(q)) L dprod (dot(Gamma))' $ <pdvLs>
  #set math.equation(numbering: none) 
   
  - Asserto 2: $(dot(Gamma))' = dot(Gamma')$, cioè, $pdv(Gamma, s, t) = pdv(Gamma, t, s)$,
    per il teorema di Schwarz.
  Dall'asserto 1, $Gamma(s, dot)$ soddisfa le equazioni di Eulero-Lagrange.
  Utilizzando quindi l'asserto 2 in @pdvLs,
  $ 0 = pdv(, t) grad_vb(dot(q)) L dprod Gamma' + grad_vb(dot(q)) L dprod dot(Gamma') = pdv(, t)(grad_vb(dot(q)) L dprod Gamma'). $
  Svolgendo il calcolo in $s=0$,
  $ 0 = pdv(, t) grad_vb(dot(q)) L dprod eval(pdv(h^s, s))_(s=0) = dv(, t) grad_vb(dot(q)) L(vb(q)(t), vb(dot(q))(t), t) dprod eval(pdv(h^s, s))_(s=0) = dv(, t) I(vb(q), vb(dot(q)), t). $
]

#example[
  si considera una coordinata ciclica $q_overline(dotless.i)$, cioè $q_overline(dotless.i) |-> L(vb(q), vb(dot(q)),t) $ è
  costante. Si considera $h^s (vb(q)) = (q_1, ..., q_overline(dotless.i) + s, ..., q_d)$ (detta
  anche traslazione sulla $i$-esima coordinata). Si tratta di trasformazioni da $M$ in $M$.
  Il differenziale, visto nel fibrato tangente, è dato da
  $ D h^s (vb(q), vb(dot(q))) = (h^s (vb(q)), D h^s_vb(q) (vb(dot(q)))) = (q_1,..., q_overline(dotless.i) + s, ...,q_d, dot(q)_1, ..., dot(q)_d) $
  $ ==> L(h(vb(q)), D h_vb(q) (vb(dot(q))), t) = L(vb(q), vb(dot(q)),t). $
  Applicando il teorema di Noether, si ha quindi
  $ grad_vb(dot(q)) L(vb(q), vb(dot(q)),t) dprod eval(pdv(h^s (vb(q)), s))_(s=0) = pdv(L, q_overline(dotless.i)). $
]

#example[
  si considera un sistema di $N$ particelle di massa $m_i$ e posizione $vb(r_i) = (r_(i x), r_(i y), r_(i z))$,
  con forze conservative date dall'energia potenziale $U(vb(r_1), ..., vb(r_N))$.
  Si suppone che $U$ non dipenda da nessuna delle variabili $r_(i x)$, con $i in {1,...,N}$.
  Si ritornerà a utilizzare la notazione dei vettori globali: $gvec(r) = (vb(r_1), ..., vb(r_n)) in RR^(3N)$.
  Si scrive allora la lagrangiana come
  $ L(gvec(r), dot(gvec(r)),t) = 1/2 iprod(dot(gvec(r)), gmat(M) space.hair dot(gvec(r))) - U(gvec(r)). $
   
  Una possibilità per definire $h^s$ è questa, facendo variare soltanto la prima
  coordinata:
  $ h^s (gvec(r)) = (r_(1 x) + s, r_(1 y), r_(1 z), ..., r_(N x), r_(N y), r_(N z)) = gvec(r) + (s, 0, ..., 0) $
  $ ==> U compose h^s (gvec(r)) = U(gvec(r)) $
  $ (D h^s)_gvec(r) = "id" $
  Bisogna allora mostrare l'uguaglianza
  $ L(h^s (gvec(r)), (D h^s)_gvec(r) (dot(gvec(r))), t) = L(gvec(r), dot(gvec(r))) $
  che è vera in quanto il differenziale di $h^s$ è l'identità. Sono allora
  soddisfatte le ipotesi del teorema di Noether, e
  $ eval(pdv(h^s (gvec(r)), s))_(s=0) = (1,0,...,0), $
  $ grad_dot(gvec(r)) L = gmat(M) gvec(dot(r)) $
  $ ==> I(gvec(r), dot(gvec(r)), t) = grad_dot(gvec(r)) L dprod eval(pdv(h^s (gvec(r)), s))_(s=0) = m_1 dot(r)_(1 x) $
  e dunque è conservata la componente $x$ della quantità di moto della prima
  particella. Si può procedere in modo analogo per le componenti $x$ di tutte le
  altre particelle, ottenendo che ciascuna delle componenti $x$ delle quantità di
  moto si conservano.
]

#example[
  si è nella stessa situazione dell'esempio precedente, ma ora l'ipotesi (molto
  più debole) su $U$ è che sia invariabile per traslazione dello spazio fisico $RR^3$ nella
  coordinata $x$, ossia
  $ U(..., r_(i x) + s, r_(i y), r_(i z), ...) = U(gvec(r)). $
  Si definisce allora $h^s$ come 
  $ h^s (gvec(r)) = (..., r_(i x) + s, r_(i y), r_(i z), ...) = gvec(r) + (s,0,0,s,0,0,...) $
  $ ==> (D h^s)_gvec(r) = "id" $
  E allora, analogamente all'esempio precedente,
  $ L(h^s (gvec(r)), (D h^s)_gvec(r) (dot(gvec(r))), t) = L(gvec(r), dot(gvec(r))) $ 
  $ grad_dot(gvec(r)) L dprod eval(pdv(h^s (gvec(r)), s))_(s=0) = sum_(i=1)^N m_i r_(i x) = P_x $
  e dunque si conserva la somma delle componenti $x$ delle quantità di moto delle
  particelle, ossia la componente $x$ della quantità di moto totale $vb(P)$.
]

#example[
  si considera la lagrangiana di un sistema di particelle invariante per la
  rotazione di ogni vettore $vb(r_i)$ di un medesimo angolo $alpha$ attorno
  all'asse $z$.
   
  La famiglia di trasformazioni $h^s$ è data da
  $ h^s (gvec(r)) = (vb(R_s) vb(r_1), ..., vb(R_s) vb(r_N)) $
  dove $R_s$ è una matrice di rotazione di un angolo $s$ rispetto all'asse $z$.
  Vale che
  $ L(h^s (gvec(r)), (D h^s)_gvec(r) (dot(gvec(r))), t) = L(gvec(r), dot(gvec(r))). $
  Si deve quindi trovare il _generatore_ $eval(pdv(h^s (gvec(r)), s))_(s=0)$.
  Tramite considerazioni geometriche, si trova
  $ eval(pdv(h^s (gvec(r)), s))_(s=0) = (vu(e_z) cprod vb(r_1), ..., vu(e_z) cprod vb(r_N)) $
  Quindi
  $ I = grad_dot(gvec(r)) L dprod eval(pdv(h^s (gvec(r)), s))_(s=0) = (m_1 vb(dot(r)_1), ..., m_N vb(dot(r)_N)) dprod (vu(e_z) cprod vb(r_1), ..., vu(e_z) cprod vb(r_N)) $
  $ ==> I = sum_(i=1)^N (vb(r_i) cprod m_i vb(dot(r_i))) dprod vu(e_z) = L_z $
  e dunque si conserva la componente $z$ del momento angolare totale $vb(L)$.
]

#example[
  dimostrare che la lagrangiana 
  $ L'(vb(q), vb(dot(q)),t) = L(vb(q), vb(dot(q)),t) + sum_(i=1)^n F_i (vb(q),t) dot(q)_i + F_t (vb(q),t) $
  con $F_i (vb(q),t) = pdv(F, q_i) (vb(q),t)$ e $F_t (vb(q),t) = pdv(F, t) (vb(q),t)$,
  per una qualche funzione $F(vb(q),t)$, dà luogo alle stesse equazioni del moto.
   
  $ pdv(L', q_k) = pdv(L, q_k) + sum_(i=1)^n pdv(F_i, q_k) dot(q)_i + pdv(F_t, q_k) $
  $ pdv(L', dot(q)_k) = pdv(L, dot(q)_k) + F_k ==> dv(, t) pdv(L', dot(q)_k) = dv(, t) pdv(L, dot(q)_k) + sum_(i=1)^n pdv(F_k, q_i) dot(q)_i + pdv(F_k, t). $
  Allora basta mostrare che
  $ sum_(i=1)^n pdv(F_i, q_k) dot(q)_i + pdv(F_t, q_k) = sum_(i=1)^n pdv(F_k, q_i) dot(q)_i + pdv(F_k, t). $
  Ma
  $ pdv(F_i, q_k) = pdv(F, q_k, q_i) = pdv(F, q_i, q_k) = pdv(F_k, q_i), $
  $ pdv(F_t, q_k) = pdv(F, q_k, t) = pdv(F, t, q_k) = pdv(F_k, t) $
  e dunque è immediato verificare l'uguaglianza. Queste trasformazioni sono dette _di gauge_.
]
