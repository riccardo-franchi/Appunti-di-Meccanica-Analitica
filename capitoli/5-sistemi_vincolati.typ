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
$ r = gvec(r)_t (vb(q')), vb(q') in 𝒰, vb(r) in V'. $

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
ossia $𝒯(vb(q), dot(vb(q)), t)=T(dot(vb(r))(vb(q), dot(vb(q)), t))$,

$ dv(𝒯, dot(q_j)) = sum_(i=1)^n dv(𝒯, dot(r_i)) dv(dot(r_i), dot(q_j)) = m sum_(i=1)^n dot(r_i) dv(dot(r_i), dot(q_j)) = m [pdv(dot(vb(r)), dot(q_j))]^TT dot(vb(r)) $
dove stiamo considerando lo jacobiano con l'indice $j$ fissato (abbiamo un vettore).\
Da ciò consegue che
$ grad_dot(vb(q)) 𝒯 = m [pdv(dot(vb(r)), dot(vb(q)))]^TT dot(vb(r)). $

Analogamente, sostituendo $dot(q_j)$ con $q_j$, si ottiene
$ grad_vb(q) 𝒯 = m [pdv(dot(vb(r)), vb(q))]^TT dot(vb(r)). $
La @all_together diventa quindi
$ m dot.double(vb(r)) dprod var(vb(r)) = (dv(, t) (grad_dot(vb(q)) T) - grad_vb(q) T) dprod var(vb(q)). $

Si introduce la _forza generalizzata_ $vb(G)(vb(q), dot(vb(q)), t)$
$ vb(G)(vb(q), dot(vb(q)), t)=[pdv(vb(r), vb(q))]^TT vb(F)(vb(q), dot(vb(q)), t). $

Dall'ultima espressione trovata, si ha che
$ (dv(, t) (grad_dot(vb(q)) 𝒯) - grad_vb(q) 𝒯) dprod var(vb(q)) = vb(F) dprod var(vb(r)) = vb(F) [pdv(vb(r), vb(q))]^TT vb(F) dprod var(vb(q)) = vb(G) dprod vb(q). $

Se si hanno soltanto vincoli olonomi, allora i $var(vb(q))$ sono vettori liberi,
e dunque in quest'ultima equazione si può usare qualsiasi $var(vb(q)) in RR^d$:
$ dv(, t) (grad_dot(vb(q)) 𝒯) - grad_vb(q) 𝒯 = vb(G). $

Se, inoltre, $vb(F)$ è un campo di forze conservativo, $vb(F(r))=-grad_vb(r) 𝒰(vb(r),t)$,
allora si può esprimere l'energia come $𝒰(vb(q),t) = U(vb(r)(vb(q),t),t)$ e
osservare che
$ grad_vb(q) 𝒰 = [pdv(vb(r), vb(q))]^TT grad_vb(r) 𝒰 = -[pdv(vb(r), vb(q))] vb(F) = -vb(G). $

Si ha allora che, per $ℒ = 𝒯- 𝒰$,
$ dv(, t) grad_dot(vb(q)) ℒ - grad_vb(q) ℒ = 0. $

Si noti che se il problema ammette un potenziale generalizzato $U(vb(r), vb(v), t)$,
cioè
$ vb(F)(vb(r), dot(vb(r)), t) = dv(, t) grad_dot(vb(r)) U - grad_vb(r) U, $
ciò non implica le equazioni di Eulero-Lagrange per la lagrangiana $ℒ = 𝒯-𝒰$,
ove
$ 𝒰(vb(q), dot(vb(q)),t) = U(vb(r)(vb(q),t), [pdv(vb(r), vb(q))(vb(q),t)]dot(vb(q))+pdv(vb(r), t),t), $
perché non è detto che
$ dv(, t) grad_dot(vb(q)) 𝒰 - grad_vb(q) 𝒰 = [pdv(vb(r), vb(q))]^TT vb(F). $

Si presenta una serie di esempi di sistemi vincolati, in cui si vogliono trovare
le espressioni delle equazioni di Eulero-Lagrange.

#example[
  Si considera l'esempio della particella vincolata da un filo metallico (@ring),
  di forma data da $G(psi)$ (il grafico della funzione $psi$), nel piano $(x,z)$,
  soggetta alla forza di gravità ($U = m g z$, $T = m/2 (dot(x)^2+dot(z)^2)$).

  Si vuole mappare la varietà data dal grafico di $psi$ (il vincolo è scleronomo),
  in modo da poter esprimere la lagrangiana nella coordinata generalizzata $q$:
  $ cases(x=q, z=psi(q)) ==> vb(r)(q)=(q, psi(q)). $

  $ ==> T = m/2 (dot(x)^2+dot(z)^2) = m/2(dot(q)^2 + (psi'(q)dot(q))^2) = 𝒯(vb(q), dot(vb(q))) $
  $ U(z) = m g z = m g phi(q) = 𝒰(q) $
  $ ==> ℒ = m/2 dot(q)^2(1 + (psi'(q))^2) - m g psi(q) $
  $ pdv(ℒ, dot(q)) = m dot(q)(1+(psi'(q))^2) $
  $ ==> dv(, t) pdv(ℒ, dot(q)) = m dot.double(q) (1+(psi'(q))^2) + 2m dot(q)^2 psi'(q) psi''(q) $
  $ pdv(ℒ, q) = m dot(q) psi'(q) psi''(q) - m g psi'(q). $
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
  Si considera una particella vincolata ad un filo inclinato di equazione (al
  tempo $t=0$) $z=a x + c$ che si muove verso l'alto con accelerazione costante $b$ (vincolo
  reonomo), non soggetta a forze esterne ($U = 0$).

  $ vb(r)(q(t),t) = (q, a q + c + b/2 t^2) $
  $ ==> dot(vb(r))(q(t),t) = (dot(q), a dot(q) + b t) = [pdv(vb(r), q)] dot(q) + pdv(vb(r), t) $
  $ ==> abs(dot(vb(r)))^2 = dot(q)^2 (1+ a^2) + 2a b t dot(q) + b^2 t^2. $
  Allora, dato che $ℒ=𝒯$,
  $ pdv(ℒ, dot(q)) = m(1+a^2)dot(q) + m a b t $
  $ ==> dv(, t)pdv(ℒ, dot(q)) = m((1+a^2)dot.double(q)+a b) $
  $ pdv(ℒ, q)=0. $
  L'equazione di Eulero-Lagrange è allora
  $ (1+a^2)dot.double(q)+a b=0 <==> dot.double(q) = -a/(1+a^2) b. $

  Facendo riferimento a quanto detto alla fine dell'esempio precedente, si può
  riscrivere l'espressione in funzione dell'angolo $theta$:
  $ dot.double(q) = -b sin theta cos theta. $

  Quindi il caso in cui il vincolo accelera verso l'alto è equivalente al caso in
  cui la particella è accelerata verso il basso.
]

#example[
  Si considera una particella vincolata ad una superficie di rotazione attorno
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

  $ pdv(L, dot(phi)) = (r(z))^2 dot(phi) = L_0 $
  che è quindi una costante, come ci si aspettava.
]

#exercise[
  Mostrare che, in relazione all'esempio precedente, tutti i meridiani (curve a $phi$ costante)
  sono geodetiche (ossia soluzioni delle equazioni di Eulero-Lagrange), i
  paralleli (curve a $z$ costante) sono geodetiche se corrispondono a una $z$ per
  cui $r'(z) = 0$.

  Rifare poi tutti i conti dell'esempio precedente nel caso non trattato in cui si
  fa ruotare una curva del tipo $z=z(x)$.
]