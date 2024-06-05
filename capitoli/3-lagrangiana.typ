#import "../setup.typ": *

#show: thmrules

= Meccanica Lagrangiana

Un _funzionale_ è un'applicazione da uno spazio di funzioni ad uno scalare
(tipicamente $RR$) ($Phi: S -> RR$, dove $S$ è un insieme di funzioni; ad
esempio $C^1[t_0,t_1]$, cioè l'insieme di tutte le funzioni $f:[t_0,t_1]->RR$,
derivabili e con derivate prime continue).

#example[
  $ Phi(f) = f(overline(t)) $
  con $overline(t) in [t_0, t_1]$ fissato.
]

#example[
  $ Phi(f) = integral_(t_0)^(t_1) f(t) dd(t) $
]

#example[
  $ Phi(f) = integral_(t_0)^(t_1) sqrt(1+(f'(t))^2) dd(t) $
  che rappresenta la lunghezza della curva data dal grafico di $f$ nel dominio $[t_0,t_1]$.
]
#example[
  Considerata $L: RR times RR times RR ->RR$ differenziabile,
  $ Phi(f) = integral_(t_0)^(t_1) L(f(t), f'(t), t) dd(t) $
]

Si noti che i primi due esempi sono applicazioni lineari, mentre gli altri
funzionali non sono lineari (il terzo è in realtà un caso particolare del
quarto).

// Tutto ciò che è lineare è reale. -G. W. F. Hegel

#def[
  il funzionale $Phi: S -> RR$ si dice _differenziabile_ nel punto $f in S$ se $forall h in S$,
  $ Phi(f + h) - Phi(f) = (D Phi_f)(h) + o(h), $
  per $h->0$, dove $D Phi_f$ è un'applicazione lineare da $S$ in $RR$, detta _differenziale_ di $Phi$ nel
  punto $f$.

  Con $h->0$, si intende $norm(h)_(C^1) -> 0$, ove
  $ norm(h)_(C^1) = max_(t in [t_0,t_1]) {abs(h(t)), abs(h'(t))}. $

  E infine, dire che $R(h) = o(h)$ equivale a dire che
  $ lim_(norm(h)_(C^1)->0) abs(R(h))/norm(h)_(C^1) = 0. $
]

Si dice quindi che $h->0$ quando è uniformemente piccola la funzione nel suo
dominio, ed è anche uniformemente piccola la sua derivata.

#exercise[
  quale che sia la definizione esatta di "$h$ piccolo", mostrare che, se $Phi$ è
  un funzionale lineare, allora $D Phi_f = Phi$, $forall f in S$.
]

Il quarto esempio fatto in precedenza, è il più generale che servirà in questo
corso, generalizzandolo a più dimensioni.

Considerando una funzione $L: RR^d times RR^d times RR -> RR$. Si assume $L$ differenziabile
e $C^1$ (tutte le derivate parziali prime sono continue). Gli argomenti di $L$ si
indicano come $(vb(x), vb(v), t)$, con $vb(x) = (x_1,...,x_d), vb(v) = (v_1,...,v_d)$.
Si definisce, con $vb(x): [t_0,t_1]->RR^d$,
$ Phi(vb(x)) = integral_(x_0)^(x_1) L(vb(x), vb(dot(x)), t) dd(t), $
definito su $S = {vb(x): [t_0,t_1]-> RR^d, vb(x) in C^1}$ (ci si potrebbe dover
restringere a funzioni $vb(x)$ tali che $(vb(x), vb(dot(x)), t)$ appartengano al
dominio di $L$). Questo funzionale è detto _funzionale d'azione_.

// Prima si porta la macchina a velocità desiderata, poi si controlla se si è entro i limiti di velocità.

#theorem[
  il funzionale $Phi$, definito come sopra, è differenziabile $forall x in S$, e
  il suo differenziale è
  $ D Phi_vb(x)(vb(h)) &= sum_(i=1)^d {integral_(t_0)^(t_1) (pdv(L, x_i)(vb(x(t)), vb(dot(x))(t), t) - dv(, t)pdv(L, v_i)(vb(x)(t), vb(dot(x))(t),t)) h_i (t) dd(t) \ &+ [pdv(L, v_i)(vb(x)(t), vb(dot(x))(t), t) h_i (t)]_(t_0)^(t_1)} $

  con $vb(vb(h))(t) = (h_1 (t), ..., h_d (t)) in C^1([t_0,t_1])$, dove la norma $C^1$,
  che era stata definita per funzioni a valori scalari, è definita in maniera
  simile:
  $ norm(vb(h))_(C^1) = max_(t in [t_0,t_1] \ i in {1,...,d}) {norm(h_i (t)), norm(h_i (t))}. $
]

In forma abbreviata, si può scrivere
$ D Phi_vb(x) (vb(h)) = sum_(i=1)^d {integral_(t_0)^(t_1) (pdv(L, x_i)-dv(, t)pdv(L, v_i)) h_i dd(t) + [pdv(L, v_i) h_i]_(t_0)^(t_1)} $
oppure
$ D Phi_vb(x) (vb(h)) = integral_(t_0)^(t_1) (grad_vb(x) L - dv(, t) grad_vb(v) L) dprod vb(h) dd(t) + [grad_vb(v) L dprod vb(h)]_(t_0)^(t_1). $

#dim[
  dalla definizione di differenziale di $L$, si ha
  $ L(vb(x) + difference(vb(x)), vb(dot(x))+ difference(vb(v)), t+ difference(t)) - L(vb(x), vb(dot(x)), t) &= sum_(i=1)^d {pdv(L, x_i) (vb(x), vb(dot(x)), t) difference(x_i) + pdv(L, v_i) (vb(x), vb(dot(x)), t) difference(v_i)} \ &+ pdv(L, t) (vb(x), vb(v), t) difference(t) + o(abs(difference(x_i, v_i, t))) $

  $ ==> Phi(vb(x)+ vb(h)) - Phi(vb(x)) = integral_(t_0)^(t_1) L(vb(x) + vb(h), vb(dot(x)) + vb(dot(h)), t) - L(vb(x), vb(dot(x)), t) dd(t) $
  $ = integral_(t_0)^(t_1) sum_(i=1)^d {pdv(L, x_i) (vb(x), vb(dot(x)), t) h_i (t) + pdv(L, v_i) (vb(x), vb(dot(x)), t) dot(h)_i (t)+ o(abs(h_i (t)), abs(dot(h)_i (t)))} dd(t), forall i in {1,...,d}. $

  Si osserva che, tramite integrazione per parti,
  $ integral_(t_0)^(t_1) pdv(L, v_i) dot(h)_i dd(t) = [pdv(L, v_i) h_i]_(t_0)^(t_1) - integral_(t_0)^(t_1) dv(, t) pdv(L, v_i) h_i dd(t). $

  Si considera $R(h) = o(norm(vb(h))_(C^1))$, che implica che $R(h)(t) <= epsilon norm(vb(h))_(C^1)$
  $ ==> abs(integral_(t_0)^(t_1) R(vb(h))(t) dd(t)) <= integral_(t_0)^(t_1) R(vb(h))(t)dd(t) <= integral_(t_0)^(t_1) epsilon norm(vb(h))_(C^1) dd(t) = epsilon (t_1-t_0) norm(vb(h))_(C^1). $

  Infine, sostituendo,
  $ Phi(vb(x)+ vb(h)) - Phi(vb(x)) = sum_(i=1)^d {integral_(t_0)^(t_1) (pdv(L, x_i)-dv(, t)pdv(L, v_i)) h_i dd(t) + [pdv(L, v_i) h_i]_(t_0)^(t_1)} + o(norm(vb(h))_(C_1)) $
  che è quanto si voleva dimostrare, per definizione di differenziale.
]

Si considera l'insieme di funzioni
$ S_(vb(x_0), vb(x_1)) = {vb(x): [t_0,t_1] -> RR^d, vb(x) in C^1, vb(x)(t_0) = vb(x_0), vb(x)(t_1) = vb(x_1)} $
Che non è un insieme lineare (se $vb(x) in S_(vb(x_0), vb(x_1))$, generalmente
non vale che $2 vb(x) in S_(vb(x_0), vb(x_1))$).

#def[
  una funzione $vb(x) in S_(vb(x_0), vb(x_1))$ è detta _estremale_ del funzionale $Phi$ ristretto
  a $S_(vb(x_0), vb(x_1))$, se vale
  $ Phi(vb(x)+ vb(h)) - Phi(vb(x)) = o(vb(h)) $
  ogni volta che $vb(x) + vb(h)$ appartiene a $S_(vb(x_0), vb(x_1))$, cioè $vb(h)(t_0) = vb(h)(t_1) = 0$.
]

#theorem(
  "equazioni di Eulero-Lagrange",
)[
  una funzione $vb(x) in S_(vb(x_0), vb(x_1))$ è estremale di $Phi$ ristretto a $S_(vb(x_0), vb(x_1))$ se
  e solo se, $forall i in {1,...,d}$,
  $ dv(, t) pdv(L, v_i) (vb(x)(t), vb(dot(x))(t), t) - pdv(L, x_i)(vb(x)(t), vb(dot(x))(t), t) = 0. $
]

In forma vettoriale, le equazioni di Eulero-Lagrange si possono scrivere come
$ dv(, t) grad_(vb(v)) L - grad_vb(x) L = 0. $

Con una notazione impropria, si usa anche scrivere
$ dv(, t) pdv(L, dot(x)_i)-pdv(L, x_i)=0; $
è una notazione impropria perché, con $pdv(, v_i)$ si intende la derivata
parziale rispetto al secondo parametro di $L$, mentre $dot(x)_i$ porta a pensare
alla derivata di qualcosa.

#lemma[
  sia $vb(f) : [t_0,t_1]->RR^d$ continua. Se vale che, $forall vb(h): [t_0,t_1]-> RR^d$ continua,
  $ integral_(t_0)^(t_1) vb(f)(t) dprod vb(h)(t) dd(t) = 0 $
  Allora $vb(f) = 0$.
]

#dim[
  Si procede per assurdo, supponendo $vb(f) != 0$. Allora, $exists overline(dotless.i) : f_overline(dotless.i) != 0$,
  $ exists overline(t) in [t_0,t_1] : f_overline(dotless.i) (overline(t)) != 0. $
  Si può allora assumere che $overline(t) in (t_0,t_1)$ (per continuità di $vb(f)$).
  Si suppone che $f_overline(dotless.i) (overline(t)) > 0$, e quindi
  $ exists delta, c > 0 : (overline(t)-delta, overline(t)+delta) subset [t_0,t_1] : forall t in (overline(t)-delta, overline(t)+delta), f_overline(dotless.i) (t) >= c. $
  Si sceglie $h_overline(dotless.i) > 0$ continua, nulla al di fuori dell'insieme $(overline(t)-delta, overline(t)+delta)$,
  con $integral_(t_0)^(t_1) h_overline(dotless.i) (t) dd(t) > 0$, quindi
  $ integral_(t_0)^(t_1) h_overline(dotless.i) (t) dd(t) = integral_(overline(t) - delta)^(overline(t) + delta) h_overline(dotless.i) (t) dd(t). $
  Si prende poi $h_i = 0, forall i != overline(dotless.i)$. Infine,
  $ 0 = integral_(t_0)^(t_1) sum_(i=1)^d f_i (t) h_i (t) dd(t) = integral_(overline(t) - delta)^(overline(t) + delta) f_overline(dotless.i) (t) h_overline(dotless.i) (t) dd(t) >= c integral_(overline(t) - delta)^(overline(t) + delta) h_overline(dotless.i) (t) > 0. $
]

#dim(
  "del teorema precedente",
)[ // Da rivedere
  vale, $forall vb(h) in S$ (quindi anche $S_(vb(x_0), vb(x_1))$),
  $ Phi(vb(x)+ vb(h)) - Phi(vb(x)) = sum_(i=1)^d {integral_(t_0)^(t_1) (pdv(L, x_i)-dv(, t)pdv(L, v_i)) h_i dd(t) + [pdv(L, v_i) h_i]_(t_0)^(t_1)} + o(vb(h)). $
  Ma, dato che $vb(h) in S_(vb(x_0), vb(x_1))$, si ha soltanto
  $ Phi(vb(x)+ vb(h)) - Phi(vb(x)) = sum_(i=1)^d integral_(t_0)^(t_1) (pdv(L, x_i)-dv(, t)pdv(L, v_i)) h_i dd(t) + o(vb(h)). $

  Per ipotesi, nel caso ($arrow.l.double$) anche la funzione integranda è nulla, e
  quindi
  $ Phi(vb(x)+ vb(h)) - Phi(vb(x)) = o(vb(h)). $

  Per quanto riguarda il caso ($=>$), si ha che, $forall vb(h) in C^1$, con $vb(h)(t_0)=0=vb(h)(t_1)$,
  per il lemma precedente,
  $ integral_(t_0)^(t_1) sum_(i=1)^d (pdv(L, x_i)-dv(, t)pdv(L, v_i)) h_i dd(t) = 0. $
  $ ==> pdv(L, x_i)-dv(, t)pdv(L, v_i) = 0. $ ]

#example[
  ci si chiede quali siano le funzioni estremali di $Phi$ definito da $L(x, v, t) = sqrt(1+v^2)$ (in
  una dimensione). Utilizzando il teorema precedente, si risolve l'equazione di
  Eulero-Lagrange. Si ha
  $ pdv(L, x) = 0 $
  e
  $ pdv(L, v) = v/sqrt(1+v^2) $
  $ ==> 0 = dv(, t) v(t)/sqrt(1+v(t)^2) = (dot(v)(t))/(1+v(t)^2)^(3/2) $
  $ <==> dot(v)(t) = 0 <==> v(t) = a <==> f(t) = a t + t_0 $
  e si è ottenuta la funzione estremale che minimizza la lunghezza della funzione $x$,
  ossia una funzione lineare.
]

== Applicazione alla meccanica

Si hanno problemi del tipo
$ m diaer(vb(r)) (t) = - grad_vb(r) U(vb(r)(t)) $

#theorem(
  "principio di minima azione di Hamilton",
)[
  le leggi orarie dell'equazione sopracitata coincidono con gli estremali di
  $ Phi(vb(r)) = integral_(t_0)^(t_1) L(vb(r)(t), vb(dot(r))(t), t) dd(t) $
  su $S_(vb(r_0), vb(r_1)) : [t_0,t_1] -> RR^d in C^1$, con $vb(r)(t_0) = vb(r_0), r(t_1)=vb(r_1)$,
  ove
  $ L(vb(r), vb(dot(r))) = T(vb(dot(r))) - U(vb(r)). $
  La funzione $L$ è detta _lagrangiana_, e non dipende esplicitamente da $t$.
]

#dim[
  si scrive l'equazione (in forma vettoriale) di Eulero-Lagrange, per tale $L=L(vb(r), vb(dot(r)))$:
  $ grad_(vb(dot(r))) L = grad_(vb(dot(r))) T = m vb(dot(r)) $
  $ ==> dv(, t) grad_(vb(dot(r))) L = m diaer(vb(r)). $
  $ grad_(vb(r)) L = -grad_vb(r) U $
  $ ==> m diaer(vb(r)) = -grad_vb(r) U. $
]

Si osserva che la lagrangiana non è unica, ossia, la forma data non è l'unica
per cui gli estremali di $Phi$ coincidono con le leggi della meccanica. Infatti,
vanno bene tutte quelle funzioni che soddisfano le equazioni di Eulero-Lagrange.

#example[
  Un esempio banale è il moto libero, per cui ($U=0$). La lagrangiana vale allora
  (con massa unitaria)
  $ L(vb(dot(r))) = T(vb(dot(r))) = norm(vb(dot(r)))^2/2 $
  $ ==> dv(, t) grad_vb(dot(r)) L = grad_vb(r) L = 0 $
  $ <==> diaer(vb(r)) = 0 <==> vb(r)(t) = vb(v_0) t + vb(r_0). $
  Le variabili da cui non dipende la lagrangiana sono dette _cicliche_, e ad
  ognuna di esse è associato un principio di conservazione (in questo caso la
  velocità/quantità di moto).
]

#example[
  Si considera la lagrangiana
  $ L(vb(r)) = norm(vb(dot(r))), $
  essa non è differenziabile in tutto $RR^3$, dato che ha dei punti angolosi.
  $ Phi(vb(dot(r))) = integral_(t_0)^(t_1) norm(vb(dot(r))(t)) dd(t). $
  Essa fornisce l'espressione della lunghezza del cammino parametrizzato $vb(r)(t)$.
  Vale
  $ grad_vb(r) L = 0, $
  $ grad_vb(dot(r)) L = vb(dot(r))/norm(vb(dot(r))) $
  $ ==> 0 = dv(, t) vb(dot(r))/norm(vb(dot(r))) = (norm(vb(dot(r)))^2 vb(diaer(r)) - (vb(dot(r)) dprod vb(diaer(r)))vb(dot(r)))/norm(vb(dot(r)))^3 $
  $ <==> norm(vb(dot(r)))^2 vb(diaer(r)) - (vb(dot(r)) dprod vb(diaer(r)))vb(dot(r)) = 0 $
  applicando a tutti i termini il prodotto scalare per $diaer(vb(r))$,
  $ norm(vb(dot(r)))^2 norm(diaer(vb(r)))^2 = (vb(dot(r)) dprod diaer(vb(r)))^2 $
  $ ==> norm(vb(dot(r))) norm(diaer(vb(r))) = norm(vb(dot(r)) dprod diaer(vb(r))) $
  e dunque $vb(dot(r))$ e $diaer(vb(r))$ sono collineari. Si ha quindi un cammino
  lineare. Nota: attenzione ai punti di non differenziabilità di $L$!
]

=== Cambio di coordinate

Si suppone di voler descrivere $RR^d$ (o un suo sottoinsieme) tramite un sistema
di coordinate diverso da quelle "naturali" $vb(r)$, denotato con $vb(q)$, le cui
coordinate sono date dalla funzione biettiva
$ vb(q) = vb(q(r))=(q_1 (r_1, ..., r_d), ..., q_d (r_1,...,r_d)) $
relativamente alle $vb(r)$. L'inversa, naturalmente, è indicata con $vb(r(q))$.

// Lenci afferma con echi marxisti che i sistemi di coordinate sono una sovrastruttura.
// Di nuovo Lenci si mette a parlare di notazione. Ok si è reso conto che sono settimane che dice che prima o poi smetterà di farlo e che sembra un drogato che cerca di smettere.

Si suppone di conoscere una legge oraria $vb(r)(t)$ nelle coordinate $vb(r)$.
Essa può essere espressa nelle coordinate $vb(q)$: $vb(q)(vb(r)(t))$. La
velocità è espressa nelle $vb(q)$ come
$ vb(dot(q))(t) = (dot(q)_1 (t), ..., dot(q)_d(t)) $
con
$ dot(q)_i (t) = dv(, t) q_i (r_1 (t), ..., r_d (t)) = sum_(j=1)^d pdv(q_i, r_j) (vb(r)(t)) dot(r)_j (t) = sum_(j=1)^d [pdv(vb(q), vb(r)) (vb(r)(t))]_(i j) dot(r)_j (t) $
dove $[pdv(vb(q), vb(r))(vb(r)(t))]$ è la matrice Jacobiana $d times d$, dove
l'elemento $(i, j)$-esimo è $pdv(q_i, r_j)$. Quindi
$ vb(dot(q))(t) = [pdv(vb(q), vb(r))(vb(r)(t))] vb(dot(r))(t). $

// Lenci dichiara di voler usare la notazione più diversa possibile da Guidetti, carissimo amico, oltre che collega di dipartimento fino a poco tempo fa.

#exercise[
  dimostrare che $forall vb(r)$,
  $ [pdv(vb(r), vb(q))(vb(q)(vb(r)))][pdv(vb(q), vb(r))(vb(r)(vb(q)))] = bb(1)_d. $
]

Vale il seguente principio:

#principle[
  la lagrangiana va vista come una quantità fisica dello spazio delle fasi,
  dipende cioè dalle posizioni e dalle velocità fisiche delle particelle e non
  dalle loro rappresentazioni numeriche.
]

#def[
  in seguito ad un cambio di coordinate $vb(r) |-> vb(q)$ nello spazio delle
  configurazioni, la funzione lagrangiana nelle $vb(q)$ diventa
  $ scriptL(vb(q), vb(dot(q)), t) = L(vb(r(q)), [pdv(vb(q), vb(r))(vb(r))] vb(dot(r)), t). $
]

Un corollario al principio di minima azione di Hamilton è il seguente:

#corollary[
  sia $vb(q)$ un (altro) sistema di coordinate sullo spazio delle configurazioni $RR^d$,
  rispetto al quale la funzione lagrangiana sia $scriptL$ come sopra definito. In
  queste coordinate le leggi del moto soddisfano
  $ dv(, t) pdv(scriptL, dot(q)_i) - pdv(scriptL, q_i) = 0 $
]

#dim[
  Si nota che, per costruzione,
  $ integral_(t_0)^(t_1) L(vb(r)(t), vb(dot(r))(t), t) dd(t) = integral_(t_0)^(t_1) scriptL(vb(q)(t), vb(dot(q))(t), t) dd(t) $
  si conclude con il fatto che, per il principio di minima azione di Hamilton, se
  l'integrale è un estremale, allora valgono le equazioni di Eulero-Lagrange per $scriptL$.
  Per definizione di estremale,
  $ Phi(vb(r)+vb(h)) - Phi(vb(r)) = o(norm(vb(h))_(C^1)) $
  $ tilde(Phi)(vb(q)+vb(l)) - tilde(Phi)(vb(q)) = o(norm(vb(l))_(C_1)) $
  ma, definendo $vb(l)$ in modo che
  $ vb(q)(t) = vb(q)(vb(r)(t)) $
  $ vb(l)(t) = vb(q)(vb(r) + vb(h)(t)) - vb(q)(vb(r)), $
  allora dunque $o_vb(r) (norm(vb(h))_(C^1))=o_vb(q) (norm(vb(l))_(C^1))$.
]

#example(
  "applicazione del corollario",
)[
  si considera un moto in un campo centrale planare. Si descrive il problema
  tramite il formalismo lagrangiano nelle coordinate polari $vb(q) = (r,phi)$. Si
  esprime $L = T-U$ nelle coordinate $(r,phi)$. In coordinate polari, l'energia
  potenziale vale $u(r)$, mentre l'energia cinetica vale
  $ scriptT(r, phi, dot(r), dot(phi)) = m/2 (dot(r)^2 + r^2 dot(phi)^2) = scriptT(r, dot(r), dot(phi)) $
  $ ==> scriptL(r, phi, dot(r), dot(phi)) = m/2 (dot(r)^2 + r^2 dot(phi)^2) - u(r) = scriptL(r, dot(r), dot(phi)) $
  e quindi la funzione lagrangiana non dipende esplicitamente da $phi$.

  Per trovare le leggi del moto, si impostano le equazioni di Eulero-Lagrange:
  $ dv(, t) pdv(scriptL, dot(r)) - pdv(scriptL, r) = 0 $
  $ ==> dv((m dot(r)), t) - m r dot(phi)^2 + dv(u(r), r) = 0 $
  $ <==> m diaer(r) = m r dot(phi)^2 - dv(u(r), r). $
  La seconda equazione invece esprime il principio di conservazione del momento
  angolare:
  $ dv(, t) pdv(scriptL, dot(phi)) - pdv(scriptL, phi) = 0 $
  $ ==> dv(, t)(m r^2 dot(phi)) = 0. $
]

// Breve parentesi sulla bruttezza dell'aula 4

Si illustra ora la terminologia generale per alcune grandezze studiate in questo
capitolo:

- un oggetto del tipo $pdv(scriptL, q_i)$ è detto _impulso_ (o _momento_) _generalizzato_;
- una variabile $q_i$ da cui $L$ non dipende è detta _variabile ciclica_. In
  questo caso, l'impulso generalizzato $pdv(scriptL, dot(q)_i)$ si conserva,
  perché $dv(, t) pdv(scriptL, dot(q)_i) = pdv(scriptL, q_i) = 0$.

// "Sono una persona molto sola... *ridacchia* no, no, c'è anche troppa gente attorno a me [...] dovete arrivare a un punto in cui le equazioni di Lagrange ve le sognate la notte"

=== Lagrangiana per un potenziale generalizzato

Si è "tradotto" in termini lagrangiani il problema
$ m diaer(vb(r)) = - grad_vb(r) U(vb(r)) $
usando le seguenti
+ #box(width: 100%)[$ dv(, t) grad_vb(dot(r)) T = m diaer(vb(r)) $]
+ $ grad_vb(r) T = 0 $
+ $ grad_vb(dot(r)) U = 0 ==> dv(, t) grad_vb(dot(r)) U = 0 $
+ $ grad_vb(r) U = vb(F(r)) $

Da cui
$ (dv(, t) grad_vb(dot(r))- grad_vb(r)) T = m diaer(vb(r)) $
e
$ (dv(, t) grad_vb(dot(r))- grad_vb(r)) U = vb(F) $
se $L = T-U$,
$ ==> (dv(, t) grad_vb(dot(r))- grad_vb(r)) L = 0 $

Ma se ora si avesse un caso di forza dipendente anche da velocità e tempo $vb(F)(vb(r), vb(dot(r)), t)$ tale
per cui esiste una funzione $U(vb(r), vb(dot(r)), t)$ con
$ grad_vb(dot(r)) U(vb(r), vb(dot(r)), t) - grad_vb(r) U(vb(r), vb(dot(r)), t) = vb(F)(vb(r), vb(dot(r)), t), $
allora, ugualmente a come appena mostrato, si risale alle equazioni di
Eulero-Lagrange, per $L=T-U$. In questi casi, $U(vb(r), vb(v), t)$ è detto _potenziale generalizzato_.

Un esempio notevole di integrale generalizzato è dato dal campo
elettromagnetico.

#example[
  la forza di Lorentz generalizzata è infatti, con $vb(E) = vb(E)(vb(r),t)$, $vb(B)=vb(B)(vb(r),t)$,
  $ vb(F) = q(vb(E) + vb(v) cprod vb(B)). $

  Si sa che esistono due funzioni $Phi(vb(r), t)$ e $vb(A)(vb(r),t)$ dette,
  rispettivamente, potenziale elettrico e potenziale magnetico, tali per cui
  $ vb(E) = - grad_vb(r) Phi - pdv(vb(A), t) $
  $ vb(B) = grad_vb(r) cprod vb(A). $

  In questo caso, si può trovare un potenziale generalizzato, mostrando che
  $ U(vb(r), vb(dot(r)),t) = q(Phi(vb(r), t) - vb(A)(vb(r),t) dprod vb(dot(r))) $
  è un potenziale generalizzato, cioè vale la relazione presentata in precedenza:
  $ dv(, t) pdv(U, v_x) - pdv(U, x) = F_x $
  con
  $ dv(, t) pdv(U, v_x) = -q dv(A_x, t) = -q (pdv(A_x, x) dot(x) + pdv(A_x, y) dot(y) + pdv(A_z, z) dot(z) + pdv(A_x, t)) $
  e
  $ pdv(U, x) = q(pdv(Phi, x)- pdv(A_x, x) v_x - pdv(A_y, x) v_y - pdv(A_z, x) v_z) $

  $ ==> dv(, t) pdv(U, v_x) - pdv(U, x) = q(v_y (pdv(A_y, x)-pdv(A_x, y)) + v_z (pdv(A_z, x)-pdv(A_x, z)) - pdv(Phi, x) - pdv(A_x, t)) = $
  $ = q((vb(v) cprod vb(B))_x + E_x) = F_x $

  Con un procedimento analogo per le altre componenti, si trova proprio
  l'espressione vettoriale della forza di Lorentz generalizzata.
]

// "Faccio come i dottori ultimamente, che vi spaventano sulle prognosi di una malattia così voi non gli fate causa"
