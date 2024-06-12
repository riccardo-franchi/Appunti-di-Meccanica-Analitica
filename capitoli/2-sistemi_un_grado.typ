#import "../setup.typ": *

#show: thmrules

= Sistemi ad un grado di libertà

Intendiamo sistemi di una particella soggetta ad una forza posizionale,
descritti quindi da equazioni della forma:
$ diaer(x)(t) = f(x(t)), $
ricordando che una forza posizionale in $RR$ è sempre conservativa (se la
funzione forza è integrabile). Infatti,
$ U(x)=-integral_(x_0)^x f(s) dd(s) $
è un potenziale per $f$. Come visto, vale anche che
$ (dot(x)(t))^2/2 + U(x(t)) = E(t) = "costante". $

#example("oscillatore armonico")[
  posto
  $ diaer(x) = -x. $
  La soluzione generale è della forma
  $ x(t) = b sin t + a cos t, $
  per condizioni iniziali
  $ cases(x(0)=0, dot(x)(0)=1). $
  Si trova quindi la soluzione particolare, date le condizioni iniziali:
  $ dot(x)(t)= b cos t - a sin t $
  $ ==> cases(x(0)=a=0, dot(x)(0)=b=1) $
  $ ==> x(t) = sin t $
  $ ==> v(t) = dot(x)(t) = cos t. $
  Allora, l'energia totale è
  $ E(t) = (v(t))^2/2 + (x(t))^2/2 = E(0) = 1/2 $
  scegliendo come potenziale per $f(x)=-x$, $U(x)=1/2 x^2$.
]

== Studio qualitativo delle equazioni del moto
Si può trasformare l'equazione differenziale del secondo ordine
$ diaer(x)(t) = f(x(t)) $
in due equazioni differenziali del primo ordine accoppiate tra loro,
introducendo una nuova variabile:
$ cases(dot(x)=v, dot(v)=f(x)) $
$ dv("", t) vec(x, v) = vb(G)(x,v) = vec(v, f(x)). $

Si utilizza inoltre un piano $x, v$ detto _piano di fase_ o _piano delle fasi_.
In generale, l'equazione differenziale vettoriale $vb(dot(x))=vb(G)(vb(x)(t)), G: RR^d->RR^d$ si
può visualizzare sullo spazio di fase $RR^d$, graficando su di esso il campo
vettoriale $vb(G)$.

Risolvere un'equazione differenziale è equivalente a trovare una $vb(x)(t)$ a
valori nello spazio di fase tale che per ogni $t$ la derivata di $vb(x)(t)$ è
uguale al campo vettoriale $vb(G)$ in $vb(x)(t)$.

#example[
  nell'esempio dell'oscillatore armonico,
  $ vb(F)(x,v)=(v, -x). $

  La traiettoria delle soluzioni è allora costituita da cerchi concentrici
  percorsi in senso orario.

  Con le condizioni iniziali dette,
  $ vec(x(t), v(t))&=vec(sin t, cos t) \
  vec(x(0), v(0))&=vec(0, 1). $
]

Per un generale sistema meccanico posizionale in una dimensione, le traiettorie
delle leggi orarie (note anche come _curve di fase_) sono determinabili a
partire dalla conservazione dell'energia
$ E(v,x) = v^2/2+U(x). $
In particolare, per potenziali _non patologici_, gli insiemi di livello
dell'energia
$ Sigma_E = {(x,v) in RR^2 : v^2/2 + U(x) = E} $
sono generalmente curve, e le curve di fase sono loro sottoinsiemi.

I punti $overline(x)$ tali che $f(overline(x)) = 0$, (corrispondenti a punti
critici dell'energia potenziale), sono detti _posizioni di equilibrio_.

#def[
  le posizioni di equilibrio sono dette stabili se dopo una piccola perturbazione
  delle condizioni iniziali di equilibrio ($x(t)=overline(x), v(t)=0$) si ha che $x(t)$ rimane
  vicino a $overline(x), forall t$.
]

#figure(
  image("../immagini/curve_livello.png", width: 70%),
  caption: [Curve di livello relative a differenti energie meccaniche $E_i$. Quella#footnote[L'_Arnold_ osserva che ad una separatrice corrispondono 3 curve di livello. Vedi
      il problema a pag. 25.] corrispondente ad $E_2$ è detta _curva separatrice_.],
)<fig_curve_livello>

Si fanno ora alcune osservazioni.

+ Le curve di livello dell'energia sono simmetriche rispetto all'asse $x$, infatti $E(x,v)=E(x,-v)$.

+ Nel semipiano superiore del piano di fase le traiettorie vanno verso destra (nel
  verso positivo delle $x$), mentre nel semipiano inferiore vanno verso sinistra:
  #set math.equation(numbering: "(1)")
  $ abs(v(t)) = sqrt(2(E-U(x(t)))) $ <velocity>
  #set math.equation(numbering: none)
  e il segno dipende dal semipiano in cui si trova il punto considerato.

+ Gli unici punti del piano di fase per cui la traiettoria (di fase) rimane nel
  punto sono quelli del tipo $(overline(x), 0)$, con $f(overline(x))=0$.

+ Al di fuori dei punti $(overline(x), 0)$, con $f(overline(x))=0$ (posizioni di
  equilibrio), le curve di livello dell'energia sono curve lisce, assumendo $U$ due
  volte differenziabile, con $U''$ continua. Dire $Sigma_E_0$ è liscia significa
  che per ogni punto $(hat(x), hat(y)) in Sigma_E_0$ esiste un intorno
  rettangolare $Upsilon$ tale che $Sigma_E_0 sect Upsilon$ è il grafico di una
  funzione $v=g(x)$ o $x=g(v)$ con $g$ differenziabile con derivata continua.
  Infatti, $ pdv(E, x) &= U'(x) = -f(x) \ pdv(E, v) &= v $ e, al di fuori delle
  posizioni di equilibrio, almeno una di queste due derivate parziali è non nulla.
  Si può allora applicare il teorema di Dini alla funzione $ F(x,v) = E(x,v)-E_0. $

Possono esistere soluzioni non globali anche per le equazioni differenziali
della meccanica. Infatti
$ diaer(x) = 2x^3 <==> dot(vec(x, v)) = vec(v, 2x^3) $
ha come soluzione non globale
$ x(t)= 1/(t-1) $
che tende a $+infinity$ per $t->1$.

Per i sistemi unidimensionali, non solo sono note le traiettorie (utilizzando il
fatto che sono contenute negli insiemi di livello dell'energia), ma, almeno
indirettamente, è possibile conoscere l'intera legge oraria. Vale infatti il
seguente

#theorem[
  sia $x(t), t in [t_1, t_2]$ una parte di legge oraria, con condizioni iniziali $x(t_0) = x_0$, $v(t_0)=v_0$, $t_0 in [t_1,t_2]$ tale
  che, o
  $ dot(x)(t) >=0, forall t in [t_1,t_2] $
  oppure
  $ dot(x)(t) <=0, forall t in [t_1,t_2] $
  (rispettivamente si ha un moto verso destra o sinistra), allora vale che, $forall t in [t_1,t_2]$,
  $ t-t_0 = integral_(x_0)^x dd(xi)/(plus.minus sqrt(2(E-U(xi)))) $
  con il segno $+$ nel caso $dot(x)>=0$ e $-$ nel caso $dot(x)<=0$; con $x=x(t)$ e $E=E(x_0, v_0)$ (che
  corrisponde all'energia della legge oraria considerata).
]

Questo metodo è detto _per quadratura_ e permette di ricavare $t(x)$, cioè $t$ come
funzione di $x$, ovvero l'inversa di $x(t)$, per tratti di tempo in cui la
velocità non cambia segno.

Sperabilmente poi è possibile invertire la $t(x)$ e ottenere la $x(t)$ su un
intervallo in cui il segno di $dot(x)(t)$ è costante fino al prossimo tempo
(diciamo $t_2$) in cui la velocità si annulla, detto _tempo di inversione_. A
quel punto, conoscendo $t_2$ e $x_2=x(t_2)$, si può studiare il problema con lo
stesso metodo su $[t_2,t_3]$, dove $t_3$ è il successivo tempo di inversione,
sperando di riuscire a invertire $t(x)$ tra $x_2$ e $x_3=x(t_3)$, e così via
(quando si dice sperabilmente, si intende che si possa fare un conto esplicito
per ricavare $x(t)$ su un certo intervallo di tempo, ma gli argomenti di cui
sopra in ogni caso identificano univocamente la legge oraria, anche nel caso non
si riuscisse a scriverne una forma esplicita).

#example[
  si ricava nuovamente la legge oraria dell'oscillatore armonico, con condizioni
  iniziali $t_0 =0, x(t_0)=0, dot(x)(t_0)=1$
  $ ==> E := E(t)=E(0)=1/2. $

  Dato che nel primo tratto (per $t$ vicini a $t_0$) la particella va a destra, si
  usa la formula
  $ t = t-t_0 = integral_0^x dd(xi)/sqrt(2(E-U(xi))) = integral_0^x dd(xi)/sqrt(1-xi^2) = [arcsin xi]_0^x = arcsin x $
  da cui $t=t(x) = arcsin x$
  $ ==> x(t) = sin t. $

  Tuttavia, per quanto se ne sa, questa formula vale soltanto su $[t_1,t_2]$ dove $t_1$ è
  il primo tempo di inversione per tempi $t<t_0$, e $t_2$ è il primo tempo di
  inversione per $t>t_0$. Svolgendo il calcolo solo su $t_2$ (il caso con $t_1$ è
  analogo), il punto di inversione è chiaramente $x_1=1$, e quindi $t_1$ è il
  primo tempo maggiore di $t_0$ in cui la particella raggiunge $x_1=1$, e cioè $t_1=pi/2$.

  Ora, si ripete il calcolo per tempi $t>=t_1 = pi/2$, sotto l'ipotesi che $dot(x)(t)<=0$:
  $ t-pi/2 = t-t_1 = integral_1^x dd(x)/(-sqrt(1-xi^2)) = [arccos xi]_1^x = [-arcsin xi]_1^x = pi/2 - arcsin x $
  $ ==> t-pi=-arcsin x <==> x = sin (pi-t) = sin t $
  e quindi anche nell'intervallo $[t_1,t_2]$ vale $x(t)= sin t$.

  Ma quanto vale $t_2$, corrispondente al prossimo tempo di inversione? Si può
  vedere che $t_2$ è il primo tempo $t>t_1$ per cui $x(t_2) = -1$ (corrispondente
  al punto di inversione). Oppure si considera $dot(x)(t) = "costante"$ e si cerca
  il primo $t_2 > pi/2$ per cui $dot(x)(t_2) = 0$. In entrambe le maniere si
  ottiene $t_2 = 3/2 pi$. E così via per i successivi tempi di inversione.
]

Prima di darne una dimostrazione, si presenta una giustificazione del precedente
teorema.

Si può riscrivere la @velocity come
$ dv(x, t) = plus.minus sqrt(2(E-U(x))). $
Quindi
$ dd(t) = dd(x)/(plus.minus sqrt(2(E-U(x)))). $
Integrando e sapendo che $x_0 = x(t_0), x=x(t)$, si ottiene
$ t-t_0 = integral_(x_0)^x dd(xi)/(plus.minus sqrt(2(E-U(xi)))). $

Si dimostra ora rigorosamente il teorema:

#dim[
  per evitare confusione fra $x$ come funzione di $t$ e $x$ come numero, si indica
  con $x$ la funzione e $xi$ il numero. Quindi, $xi = x(t)$ e $t=x^(-1)(xi)$; e la
  @velocity si riscrive come
  $ dot(x)(t) = plus.minus sqrt(2(E-U(x(t)))) $
  $ ==> dot(x)(x^(-1)(xi)) = plus.minus sqrt(2(E-U(xi))) $
  $ ==> dv(x^(-1)(xi), xi) = (x^(-1))'(xi) = 1/(x'(x^(-1)(xi))) = 1/(plus.minus sqrt(2(E-U(xi)))). $

  Chiamando $xi_0 = x(t_0), xi_1 = x(t_1)$, si ha
  $ integral_(xi_0)^(xi_1) plus.minus 1/sqrt(2(E-U(xi))) dd(xi) = integral_(xi_0)^(xi_1) dv(x^(-1)(xi), xi) dd(xi) = x^(-1)(xi_1) - x^(-1)(xi_0) = t_1-t_0 $
  che è essenzialmente quanto asserito dal teorema, riscritto con una notazione
  più precisa.
]

#def[
  una _separatrice_ è una traiettoria di fase (altrimenti detta curva di fase),
  non riducibile ad un punto, la cui energia corrisponde ad un massimo locale del
  potenziale.

  Si chiama così perché separa due tipi di moti sostanzialmente diversi, cioè non
  vicini fra loro (almeno come leggi orarie).
]

#prop[
  se $overline(x)$ è un punto di massimo locale tale che $U''(overline(x)) <0$,
  allora per ogni separatrice corrispondente a $(overline(x), 0)$ nel piano di
  fase, vale
  $ lim_(t->plus.minus infinity) x(t) = overline(x) $
  con $x(t) != overline(x), forall t$. Cioè, la traiettoria (fisica) converge a $overline(x)$ o
  nel futuro o nel passato (o in entrambi i casi), senza mai raggiungerlo.
]

Imprecisamente, questa situazione è talvolta descritta come "$x(t)$ raggiunge $overline(x)$ in
un tempo infinito".

#dim[
  per definizione, l'energia corrispondente alla separatrice è $E=U(overline(x))$.
  Siccome $U''(overline(x))<0$, per ogni punto $(x,v)$ sulla separatrice, molto
  vicino a, ma non coincidente con, $(overline(x), 0)$, vale
  $ T(v) = E-U(x)>0 $
  $ ==> v != 0 $
  e quindi (o andando avanti o indietro nel tempo, a seconda dei casi) il punto
  materiale non si può fermare in un punto $hat(x)$ vicino ma diverso da $overline(x)$.
  Quindi è immediato che
  $ lim_(t->plus.minus infinity) x(t) = overline(x). $
  La parte non banale della proposizione è dimostrare che $overline(x)$ non è mai
  raggiunto. A riguardo si possono avere due argomenti, il primo è elegante ma
  poco intuitivo, mentre il secondo è più quantitativo.

  Assumendo che l'equazione differenziale che regola il moto
  $ dv(, t) (x,v) = G(x,v) = (v,f(x)) $
  abbia la proprietà di esistenza e unicità delle soluzioni (per cui basta
  assumere che $G$ sia Lipschitziana in un intorno di $(overline(x), 0)$), allora
  non può esistere una soluzione $x(t)$ non costante con $x(overline(t)) = overline(x)$ per
  qualche $overline(t)$, perché altrimenti il problema di Cauchy considerato
  $ cases(
    dot((x,v)) = G(x,v),
    (x(overline(t)), v(overline(t))) = (overline(x), 0),

  ) $
  avrebbe sia la soluzione $t |-> (x(t), dot(x)(t))$, che la soluzione $t |-> (overline(x), 0)$,
  e queste sono diverse tra loro.

  Il secondo argomento è invece il seguente. Sia $-a = U''(overline(x))$ ($a>0$).
  Essendo $overline(x)$ un punto di massimo locale, in un intorno di $overline(x)$,
  $ U(x) tilde U(overline(x)) + U'(overline(x))(x-overline(x))+1/2 U''(overline(x)) (x-overline(x))^2 = E - a/2 (x-overline(x))^2 $
  $ ==> sqrt(2(E-U(x))) tilde sqrt(a) abs(x-overline(x)). $
  Quindi per un tempo $t_1$ tale che $x_1 = x(t)$ sia nell'intorno in cui vale
  l'approssimazione citata,
  $ t-t_1 = integral_(x_1)^x plus.minus 1/sqrt(2(E-U(xi))) dd(xi) tilde plus.minus 1/sqrt(a) integral_(x_1)^x 1/abs(xi-overline(x)) dd(xi). $
  La funzione $abs(xi-overline(x))^(-1)$ non è integrabile in $xi$ attorno a $overline(x)$ e
  quindi, per $x->overline(x)$, l'integrale va a $plus.minus infinity$, a seconda
  dei casi, ovvero $t-t_1 -> plus.minus infinity$, e quindi anche $t->plus.minus infinity$.
]

#let arctanh(content) = $"arctanh"(content)$

#example[
  risolvere il problema unidimensionale $diaer(x) = -2x+2x^3$, con condizioni
  iniziali $x(0) = 0$, $dot(x)(0)=1$, con il metodo delle quadrature.

  Si prende
  $ U(x) = -integral_0^x (-2 xi + 2 xi^3) dd(xi) = x^2 - x^4/2. $
  Inoltre,
  $ E=E(0) = (dot(x)(0))^2/2 + (x(0))^2 - (x(0))^4/2 = 1/2 $
  $ ==> 2(E-U(x)) = 2(1/2-x^2 + x^4/2) = 1-2x^2 + x^4 = (1-x^2)^2 $
  da cui, usando che $x=0$ per $t=0$, si ricava $t(x)$ da $t=0$ fino al primo
  tempo di inversione (se finito):
  $ t = integral_0^x dd(xi)/sqrt(2(E-U(xi))) = integral_0^x dd(xi)/(1-xi^2) = [1/2 ln (1+xi)/(1-xi)]_0^x = 1/2 ln (1+x)/(1-x) $

  La funzione $1/2 ln (1+x)/(1-x)$ si chiama anche $arctanh(x)$, ed è la funzione
  inversa di
  $ tanh(x) = (e^x-e^(-x))/(e^x+e^(-x)) = (e^(2x)-1)/(e^(2x)+1). $
  Quindi si ha che $t = arctanh(x) ==> x(t) = tanh(t)$.

  Si vede che il primo tempo di inversione è $+infinity$, come in effetti ci si
  poteva aspettare dalla forma del potenziale che mostra che la curva studiata è
  in effetti una separatrice.
  $ lim_(t->+infinity) x(t) =1, x(t)<1, forall t. $
]

#example[
  data una traiettoria chiusa, simmetrica rispetto all'asse $x$, sul piano di fase
  con energia $E$, e sia $S(E)$ l'area racchiusa dalla curva di fase. Dimostrare
  che il periodo $T=dv(S, E)$, se tale derivata esiste finita.

  Si ha, per simmetria, che
  $ T = 2 integral_(x_1)^(x_2) 1/sqrt(2(E-U(xi))) dd(xi). $
  Per quanto riguarda $S$, sempre per simmetria,
  $ S = 2 integral_(x_1)^(x_2) v(xi) dd(xi) = 2 integral_(x_1)^(x_2) sqrt(2(E-U(xi))) dd(xi). $

  Avendo una funzione del tipo $F(x_1(E), x_2(E), E)$,
  $ dv(F, E) = diff_1 F dv(x_1, E) + diff_2 F dv(x_2, E) + diff_3 F $
  // "si cucca un sacco con le derivate parziali"

  E dunque
  $ 1/2 dv(S, E) = -sqrt(2(E-U(x_1(E)))) dv(x_1, E) + sqrt(2(E-U(x_2(E)))) dv(x_2, E) + integral_(x_1)^(x_2) 1/sqrt(2(E-U(xi))) dd(xi) $
  L'ultimo termine è $T(E)/2$, e quindi in un intorno di $E$ si ha che tale
  espressione è limitata uniformemente in $E$, e dunque è giustificato il fatto di
  portare la derivata all'interno dell'integrale, applicando il corollario del
  teorema della convergenza dominata. I primi due termini della somma sono invece
  nulli, in quanto $E=U(x_1)=U(x_2)$.
]

#example(
  "limite di piccole oscillazioni",
)[
  sia $E gt.tilde U(overline(x))$, con $overline(x)$ un punto di equilibrio
  stabile, tale che la traiettoria di fase corrispondente a $E$ è chiusa, di
  periodo $T(E)$. Dimostrare che
  $ lim_(E->U(overline(x))) T(E) = (2 pi)/sqrt(U''(overline(x))). $

  Si approssima
  $ U(x) tilde.eq U(overline(x)) + 1/2 U''(overline(x))(x-overline(x))^2. $
  Tale approssimazione migliora con $E->U(overline(x))^+$. Detta $E_0 = U(overline(x))$,
  la conservazione dell'energia implica che
  $ E = v^2/2 + E_0 + a/2 (x-overline(x))^2 ==> epsilon = v^2/2+(x-overline(x))^2/(2/a) $
  dove $epsilon = E-E_0$ e $a = U''(overline(x))$
  $ ==> (x-overline(x))^2/(2 epsilon/a)+v^2/(2 epsilon) = 1 $
  che corrisponde all'equazione di un'ellisse del piano di fase. Allora
  $ S(E) = 2 pi epsilon/sqrt(a) = 2 pi (E-E_0)/sqrt(a) $
  $ ==> T = dv(S, E) = (2 pi)/(sqrt(U''(overline(x)))). $

  Questa proprietà vale per qualsiasi potenziale quadratico (_isocronia
  dell'oscillatore armonico_).
]

== Casi riconducibili ad un grado di libertà

Tutti quei sistemi che sono completamente separabili sono riconducibili a
sistemi a un grado di libertà. Un esempio notevole è l'oscillatore armonico in $d$ dimensioni:
$ vb(F(x)) = -k vb(x), space.quad k>0 $
$ ==> m diaer(vb(x))=-k vb(x) $
che si può separare, componente per componente, in $d$ equazioni differenziali
indipendenti tra loro $diaer(x)_i=-k/m x_i$.

#exercise[
  mostrare che se si sa risolvere (trovare la legge oraria per ogni condizione
  iniziale) $diaer(vb(r))=-vb(r)$, allora si sa risolvere $diaer(vb(x))=-omega^2 vb(x)$.

  // L'idea è che se ho la soluzione $r(t)$, allora posso porre $r(t/omega)$: la costante è dovuta alla doppia derivazione
]

Un altro caso riconducibile a sistemi a un grado sono i _campi centrali_,
$ vb(F(r))=f(norm(vb(r))) vb(r)/norm(vb(r)) $
ricordando che essi sono conservativi con potenziali $U(vb(r)) = u(norm(vb(r)))$,
con $-u'(r) = f(r)$.

In tre dimensioni, il moto in un campo centrale (in cui il centro del campo è
l'origine) avviene tutto nel piano passante per l'origine e perpendicolare a $vb(L)$,
che si conserva. Utilizzando le coordinate polari nel piano del moto $(x,y)$
$ cases(x=r cos phi, y=r sin phi) $
con versori ortonormali $vu(e_r), vu(e_phi)$, che definiscono un sistema di
riferimento mobile:
$ vu(e_r) = vu(e_r)(phi) = (cos phi, sin phi) $
$ vu(e_phi) = vu(e_phi)(phi) = (-sin phi, cos phi). $

// Ogni giorno che passa Lenci ha la voce più grave

#lemma[
  se $vb(r)(t)$ è la legge oraria del sistema espressa come $(r(t), phi(t))$,
  allora
  $ vb(dot(r))(t)= dot(r)(t) vu(e_r)(phi(t))+r(t) dot(phi)(t) vu(e_phi)(phi(t)). $
] <lem:derivata_r>

#dim[
  Per come si sono definiti i versori polari,
  $ dv(, t) vu(e_r)(phi(t)) = dot(phi)(t)(-sin phi(t), cos phi(t)) = dot(phi)(t) vu(e_phi)(phi(t)) $
  $ dv(, t) vu(e_phi)(phi(t)) = dot(phi)(t)(-cos phi(t), -sin phi(t)) = -dot(phi)(t) vu(e_r)(phi(t)) $

  Vale che
  $ vb(r)(t) = r(t) vu(e_r)(phi(t)) $
  $ ==> vb(dot(r))(t) = dot(r)(t) vu(e_r)(phi(t)) + r(t) dot(phi)(t) vu(e_phi)(phi(t)). $
]

Come già fatto, si pone la massa $m=1$ e si trascurano le unità di misura.
Dunque
$ vb(L) = vb(r) cprod vb(dot(r)) = vb(r) cprod (dot(r) vu(e_r) + r dot(phi) vu(e_phi)) = r^2 dot(phi) vu(e_r) cprod vu(e_phi) = r^2 dot(phi) vu(e_z). $

La conservazione del momento angolare in tre dimensioni corrisponde quindi, in
realtà, a tre equazioni di conservazione, trattandosi di un'equazione
vettoriale.

Si giustifica geometricamente l'espressione di $vb(dot(r))(t)$. Considerato un
punto in un piano con coordinate polari, in un piccolo intervallo di tempo $difference(t)$ il
punto si sposta dalla posizione $vb(r)(t)$ a $vb(r)(t + difference(t))$. Quindi $difference(vb(r)) =vb(r)(t + difference(t)) - vb(r)(t)$ e $difference(phi) = phi(t+difference(t))-phi(t)$.

Tramite osservazioni geometriche si può approssimare
$ difference(vb(r)) tilde.eq difference(r) vu(e_r) + r difference(phi) vu(e_phi) $

#figure(
  image("../immagini/derivata_r.png", width: 70%),
  caption: [Argomento geometrico del @lem:derivata_r ],
)
da cui
$ difference(vb(r))/difference(t) = difference(r)/difference(t) vu(e_r) + r difference(phi)/difference(t) vu(e_phi) arrow.r dot(r) vu(e_r) + r dot(phi) vu(e_(phi)) $

D'ora in avanti si assumerà che il modulo del momento angolare sia non nullo ($L != 0$),
altrimenti non si avrebbe un moto bidimensionale.

Nota: assumendo $L != 0$, $phi$ è monotona (altrimenti si avrebbe $L = 0$ per un
certo $t$), crescente se $L>0$ e decrescente se $L<0$.

Si osserva che vale la _seconda legge di Keplero_: in un campo centrale la _velocità areolare_ $s(t)$ è
costante. La velocità areolare è la derivata rispetto al tempo dell'area
spazzata dal raggio vettore. Infatti, l'area spazzata in un tempo infinitesimo è
$ 1/2 r^2(t) dd(phi) $
e dunque
$ s(t) = 1/2 r^2(t) dot(phi)(t) = 1/2 L. $

== Studio qualitativo di un campo centrale

Dato un campo centrale $vb(F(r))=f(r) vu(e_r)$, che è conservativo con
potenziale $U(vb(r))=u(r)$, con $u'(r) = -f(r)$. Si vuole trovare $vb(r)(t)=(r(t), phi(t))$.

#theorem[
  la "legge oraria" $r(t)$ è la stessa che si otterrebbe studiando il problema
  unidimensionale dato dal _potenziale efficace_
  $ V(r) = u(r) + L^2/(2r^2), space.quad r>0 $
  dove $L$ è il modulo (conservato) di $vb(L)$.
]

#dim[
  si deriva in $t$ la formula
  $ vb(dot(r)) = dot(r) vu(e_r) + r dot(phi) vu(e_phi). $
  $ diaer(vb(r)) = diaer(r) vu(e_r) + dot(r) dot(phi) vu(e_phi) + dot(r) dot(phi) vu(e_phi) + r diaer(phi) vu(e_phi) - r dot(phi)^2 vu(e_r) $
  $ ==> diaer(vb(r)) = (diaer(r)-r dot(phi)^2) vu(e_r) + (2 dot(r) dot(phi) + r diaer(phi)) vu(e_phi) $
  Ma $diaer(vb(r)) = -u'(r) vu(e_r)$, e dunque vale che

  #set math.equation(numbering: "(1)")
  $ diaer(r) - r dot(phi)^2 = -u'(r) $ <acceleration>
  $ 2 dot(r) dot(phi) + r diaer(phi) = 0 $ <angular>
  #set math.equation(numbering: none)

  Allora, da @acceleration,
  $ diaer(r) = -u'(r) + r L^2/r^4 = -dv(, r)(u(r)+L^2/(2 r^2)) $
  Ma $u(r)+L^2/(2 r^2)$ è proprio $V(r)$.
]

Questo problema può essere affrontato per quadrature:
$ dd(t) = plus.minus dd(r)/sqrt(2(E-V(r))). $

Avendo $r(t)$, $phi(t)$ si trova facilmente, da
$ dot(phi) = L/r^2 $
$ ==> phi(t) = phi_0 + integral_(t_0)^t L/r^2 dd(t). $

Spesso, però, $vb(r)(t)$ è difficile da trovare. In alcuni casi si è però
interessati soltanto, ad esempio, a trovare l'immagine di $vb(r)(t)$ (cioè
l'orbita), cercando allora $r(phi)$. Sotto le ipotesi in cui ci si trova, con $L!=0$,
ciò è possibile, perché $phi(t)$ è monotona (e quindi invertibile con inversa $t(phi)$).
Allora, chiamando $r(phi)$ la funzione inversa di $phi(r)$, $r(phi) = r(t(phi))$.

Dall'equazione @angular si risale nuovamente al principio di conservazione del
momento angolare:
$ L = r^2 dot(phi) $
$ ==> 0 = dot(L) = r(2 dot(r) dot(phi) + r diaer(phi)). $

Si osserva anche che l'energia totale $E_V$ del nuovo problema unidimensionale
in $r$, che vale
$ E_V = dot(r)^2/2 + V(r) $
è uguale all'energia totale del problema originario in due dimensioni $E_U$:
$ E_U = norm(vb(dot(r)))^2/2 + U(vb(r)). $
Infatti,
$ norm(vb(dot(r)))^2/2 = 1/2 norm(dot(r) vu(e_r) + r dot(phi) vu(e_phi))^2 = (dot(r)^2 + r^2 dot(phi)^2)/2 = dot(r)^2/2 + L^2/(2 r^2). $
E, per definizione, $u(r) = u(norm(vb(r))) = U(vb(r))$.

Si può studiare, come visto, solo la traiettoria $r(phi) = r(t(phi))$, dove $t(phi)$ esiste
perché $phi(t)$ è invertibile, e non la legge oraria. Dato che
$ dot(r)= plus.minus sqrt(2(E-V(r))) $
$ dot(phi) = L/r^2 $
$ ==> dv(phi, r) = dv(phi, t) dv(t, r) = plus.minus L/(r^2 sqrt(2(E-V(r)))). $

Si può fare uno studio qualitativo considerando il grafico di $V(r)$, spesso si
ha che la funzione tende a $+infinity$ per $r->0$, dovuto al termine $L^2/(2 r^2)$.
Detti $r_min$ e $r_max$ i due punti in cui una particella oscilla per un certo
valore di energia totale (vedi @fig:orbite), a meno di non trovarsi su una
separatrice, si ha allora, nel problema originario bidimensionale, che l'orbita
è compresa tra le due circonferenze di raggio $r_min$ e $r_max$ (i cui punti
sono rispettivamente _pericentri_ e _apocentri_). In altre parole, $r(phi)$ è
una funzione periodica, di periodo non necessariamente $2 pi$, e dunque l'orbita
non forma necessariamente ellissi chiuse.

#figure(
  image("../immagini/orbite.png", width: 80%),
  caption: [Particella sul piano delle configurazioni che oscilla tra $r_min$ e $r_max$],
) <fig:orbite>

In un intervallo di monotonia di $r(phi)$ vale
$ phi-phi_0 = plus.minus integral_(r_0)^r L/(rho^2 sqrt(2(E-V(rho)))) dd(rho) $
e dunque il semiperiodo (differenza angolare tra pericentro e apocentro) $Phi$ di $r(phi)$ vale
$ Phi = integral_(r_min)^(r_max) L/(rho^2 sqrt(2(E-V(rho)))) dd(rho). $

#figure(
  image("../immagini/periodo.png", width: 70%),
  caption: [Grafico di $r$ in funzione di $phi$],
)

Quindi il periodo dell'orbita è $2 Phi$. Ora, l'orbita nel piano delle
configurazioni è chiusa (e periodica) se e solo se $2 Phi$ è un multiplo
razionale di $2 pi$.

Vale il seguente teorema, la cui dimostrazione si trova nell'_Arnold_.
#theorem[
  Solo in due casi tutte le orbite nel piano delle configurazioni sono chiuse:
  + $ u(r) = a r^2, space.quad a>0 $
  + $ u(r) = -k/r, space.quad k>0. $
]

Si osserva che, se la traiettoria è aperta, allora è densa nella corona
circolare.

== Problema di Keplero

Quando $u(r)=-k/r$, con $k>0$,
$ V(r) = -k/r + L^2/(2 r^2) $
e si trova che il punto di minimo è
$ (L^2/k, -k^2/(2L^2)) $
(la cui derivazione è lasciata come esercizio), quindi
$ phi(r) = plus.minus integral_(r_0)^r (L/rho^2 dd(rho))/sqrt(2(E-V(rho))) = plus.minus integral_(r_0)^r (L/rho^2 dd(rho))/sqrt(2E + 2k/rho - L^2/rho^2). $
Completando il quadrato,
$ 2E + 2k/rho - L^2/rho^2 = 2E + k^2/L^2 - (L/rho - k/L)^2, $
e chiamando
$ a:= sqrt(2E + k^2/L^2) $
$ ==> phi(r) = plus.minus integral_(r_0)^r (L/rho^2 dd(rho))/sqrt(a^2 - (L/rho - k/L)^2). $

Si prende un'energia compresa in $-k^2/(2 L^2) <= E <= 0$, e facendo il cambio
di variabile con $x:= L/rho-k/L$, per cui $dd(x) = -L/rho^2 dd(rho)$ (che, a
meno del segno, corrisponde con il numeratore della funzione integranda), si
ottiene
$ phi(r) = minus.plus integral_(x_0)^x dd(x)/sqrt(a^2-x^2). $

Assumendo di avere il segno positivo,
$ phi(r) = arcsin((L/r - k/L)/(sqrt(2E + k^2/L^2))) + phi_0. $

Chiamando, per convenienza, $p := L^2/k$, $e := sqrt(1+(2 E L^2)/k^2)$, e dunque
si ottiene, moltiplicando a numeratore e denominatore per $L/k$,
$ phi(r) = arcsin((L^2/(k r) - 1)/sqrt(1+(2 E L^2)/k^2)) + phi_0 = arcsin((p/r -1)/e) + phi_0 $
$ ==> sin (phi-phi_0) = (p/r-1)/e $
$ ==> r = p/(1+e sin (phi-phi_0)). $
A meno di effettuare una ritraslazione degli angoli, si sceglie $phi_0 = - pi/2$,
ottenendo
$ r = p/(1+e cos phi). $

Assumendo invece di avere il segno negativo,
$ phi(r) = arccos((L/r - k/L)/(sqrt(2E + k^2/L^2))) + phi_0. $
E si procede analogamente al caso precedente, scegliendo infine $phi_0 = 0$, e
trovando la medesima formula.

$p$ è detto _parametro dell'ellisse_, ed $e$ è detta _eccentricità_, compresa in $[0,1)$.
Infatti $E$ è negativa, e vale, al minimo, $-k/(2L^2)$.

Si può mostrare che la formula ottenuta è quella di un'ellisse, passando alle
coordinate cartesiane:
$ r + r e cos phi = p $
$ ==> (r e cos phi - p)^2 = r^2 $
$ ==> (e x - p)^2 = x^2 + y^2. $

Si ha che $r=r_min$ per $phi = 0$ e che $r = r_max$ per $phi = pi$, e si ha
quindi fissato l'origine degli angoli nel pericentro. In particolare,
$ r_min = p/(1+e) $
$ r_max = p/(1-e) $

E infatti, per $E->E_min$, $e->0$ e dunque $r_min$ e $r_max$ tendono a
coincidere, avendo un'orbita circolare; mentre per $E->0^-$, l'orbita si
allunga, con $r_"max" -> +infinity$.

#exercise[
  dimostrare, a partire dalle ultime considerazioni fatte, la terza legge di
  Keplero.
]