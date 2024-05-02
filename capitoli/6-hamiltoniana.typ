#import "../setup.typ": *

#show: thmrules

= Cenni di meccanica hamiltoniana

Si tratta di un altro formalismo della meccanica, che ha un campo di
applicazione leggermente più ristretto rispetto al formalismo lagrangiano, ma
beneficia di una serie di teoremi più forti rispetto a quello lagrangiano.

== La trasformata di Legendre

Una trasformata è in generale un'operazione tra funzioni (si è già vista in
altri corsi la _trasformata di Fourier_). Considerando funzioni del tipo $f: A subset.eq RR^n -> RR$, $f in C^2(A)$,
tali per cui la matrie hessiana di $f$, indicata come
$ (H f)_(i j) = pdv(f, x_i, x_j) $
è semidefinita positiva, ossia $vb(v) dprod H f vb(v) >= 0$, $forall vb(v) in RR^n$.

// "è tutta farina di Guidetti? Allora vado nel suo ufficio e lo bacio."

#def[
  La _trasformata di Legendre_ di una funzione $f$ definita come sopra, è la
  funzione $g = (scriptL f) : B subset.eq RR^n -> RR$ definita da
  $ g(vb(p)) = sup_(x in A) (vb(p) dprod vb(x) - f(vb(x))) $
  dove si considera nel dominio $B$ solo quelle $vb(p)$ tali che l'estremo
  superiore sia reale.
]

In molti casi, tale estremo superiore è un punto di massimo, e il punto di
massimo è al più uno, dato da
$ grad_vb(x) (vb(p) dprod vb(x) - f(vb(x))) = 0 <==> vb(p) = grad_vb(x) f(vb(x)). $
Si indica con $vb(x(p))$ l'unico punto che soddisfa questa equazione, se esiste.
Fra i casi considerati, c'è anche il caso in cui $f$ è strettamente convessa su
tutto $RR^n$. Si assume d'ora in poi che $H f (vb(x)) > 0$, $forall x in RR^n$ (che
implica che $f$ è strettamente convessa su tutto $RR^n$). In questo caso, si
darà una versione restrittiva della trasformata di Legendre, corrispondente a
$ g(vb(p)) = max_(vb(x) in A) (vb(p) dprod vb(x) - f(vb(x))) = vb(p) dprod vb(x(p)) - f(vb(x(p))). $

Si osserva che, secondo questa definizione particolare, $g$ è definita su $B' = {vb(p) in RR^n : exists max}$.
Chiaramente $B' subset.eq B$. Quindi si escludono tutte le $vb(p) in B without B'$.

#example[
  data $f(x) = x^2$, considerando la funzione $x |-> p x - f(x) = p x - x^2$, per
  cui il massimo esiste $forall p in RR$, si trova $x(p)$:
  $ p = 2 x ==> x = p/2 $
  $ ==> (scriptL f)(p) = p p/2 - f(p/2) = p^2/4. $
]

#example[
  data $f(vb(x)) = m/2 norm(vb(x))^2$, che è strettamente convessa, la funzione $x |-> p x - f(x)$ ha
  sempre un unico massimo dato da
  $ vb(p) = grad_vb(x) f(vb(x)) = m vb(x) ==> vb(x(p)) = vb(p)/m $
  $ ==> g(vb(p)) = vb(p) dprod vb(p)/m - m/2 norm(vb(p))^2/m^2 = norm(vb(p))^2/(2m). $
]

Si dà un'interpretazione geometrica della trasformata di Legendre nel caso in
cui $n=1$.
$ g(p) = sup_(x in RR) (p x - f(x)) $
$g(p)$ è allora la massima distanza verticale fra il grafo dell'iperpiano
(passante per l'origine) $vb(x) |-> vb(p) dprod vb(x)$ e il grafico di $f$. Nel
caso in cui $f$ è strettamente convessa, $vb(x(p))$ è il punto di tangenza
dell'iperpiano parallelo all'iperpiano $vb(p) dprod vb(x)$ e tangente al grafico
di $f$. Se, invece, $f: A subset RR -> RR$, ossia non è regolare e ha un dominio
più ristretto di $RR$, occorre utilizzare la definizione generale di trasformata
di Legendre.

#lemma[
  con le ipotesi restrittive su $f$ dette sopra, vale
  $ grad_vb(p) g(vb(p)) = vb(x(p)). $
]
#dim[
  si deriva la $g(vb(p)) = vb(p) dprod vb(x(p)) - f(vb(x(p)))$:
  $ pdv(g, p_i) (vb(p)) = x_i(vb(p)) + sum_(l=1)^n p_l pdv(x_l, p_i)(vb(p)) - sum_(l=1)^n pdv(L, x_l) (vb(x(p))) dprod pdv(x_l, p_i)(vb(p)) $
  Inoltre, poiché
  $ vb(p) = grad_vb(x) f(vb(x(p))), $
  allora
  $ pdv(L, x_l) (vb(x(p))) = p_l $
  e la differenza si semplifica, ottenendo l'equazione cercata.
]

Si hanno due proposizione sulla relazione tra convessità e hessiana di una
funzione.

#prop[
  una $f$ come sopra è convessa se e solo se $H f (vb(x)) >= 0, forall vb(x) in RR^n$.
]

#prop[
  per una $f$ come sopra,
  $ H f (vb(x)) > 0, forall vb(x) in RR^n => f "è strettamente convessa". $
]

#prop[
  la $g = scriptL f$ è convessa.
]
#dim[
  si verifica che $(H g)(vb(p)) >=0$. Per il lemma precedente,
  $ pdv(g(vb(p)), p_i, p_j) = pdv(x_j, p_i)(vb(p)) = pdv(x_j, p_i)(grad_vb(x) f(vb(x(p)))) = sum_(k=1)^n pdv(x_j, p_k)(grad_vb(x) f(vb(x(p)))) pdv(, p_i) pdv(f, x_k)(vb(x(p))) $
  $ =sum_(k=1)^n pdv(x_j, p_k) (vb(p)) sum_(l=1)^n pdv(f, x_l, x_k)(vb(x(p))) pdv(x_l, p_i) (vb(p)). $
  Ma
  $ pdv(x_j, p_k) (vb(p)) = pdv(x_k, p_j) (vb(p)), $
  dato che
  $ pdv(x_j, p_k) = pdv(g, p_k, p_j) = pdv(g, p_j, p_k) = pdv(x_k, p_j). $
  Si deve dimostrare che, $forall vb(v) = (v_1, ...,v_n) in RR^n$ vale che
  $ vb(v) dprod H g(vb(p)) vb(v) = sum_(i j) pdv(g(vb(p)), p_i, p_j) v_i v_j >= 0. $
  Ma,
  $ pdv(g(vb(p)), p_i, p_j) = sum_(i j k l) pdv(x_k, p_j) v_j pdv(f, x_l, x_k) pdv(x_l, p_i) v_i. $
  Si definisce
  $ vb(w) = [pdv(vb(x), vb(p))] vb(v) $
  $ ==> pdv(g(vb(p)), p_i, p_j) = sum_(k l) w_k pdv(f, x_l, x_k) w_l >=0 $
  dato che l'hessiana di $f$ è semidefinita positiva.
]

#theorem[
  la trasformata di Legendre è un'_involuzione_:
  $ scriptL^2 f = scriptL(scriptL f) = f. $
]
#dim[
  si definisce
  $ h(vb(y)) = (scriptL g)(vb(p)) = y dprod vb(p(y)) - g(vb(p(y))), $
  con $vb(p(y))$ unica soluzione di $vb(y) = grad_vb(p) g(vb(p))$, e vale che $vb(y) = grad_vb(p) g(vb(p(y)))$.
  Il lemma precedente afferma che $grad_vb(p) g(vb(p)) = vb(x(p))$. Allora
  $ vb(y) = vb(x(p(y))) $
  $ ==> h(vb(y)) = vb(y) dprod vb(p(y)) - g(vb(p(y))) = vb(x(p(y))) dprod vb(p(y)) - [vb(p(y)) dprod vb(x(p(y))) - f(vb(x(p(y))))] $
  $ ==> h(vb(y)) = f(vb(y)). $
]

#exercise[
  mostrare che, se una forma quadratica $f(vb(x)) = vb(x) dprod A vb(x)$ è
  definita positiva, allora anche la sua trasformata di Legendre $g(vb(p))$ è
  definita positiva, e vale che
  $ g(vb(p))=f(vb(x(p))). $
]

== Principi di meccanica hamiltoniana

#def[
  data la lagrangiana $L(vb(q), dot(vb(q)), t)$, convessa nelle $dot(vb(q)), forall vb(q),t$,
  si definisce _funzione hamiltoniana_ relativa a $L$ la funzione $H(vb(q), vb(p), t)$ data
  da
  $ H(vb(q), vb(p), t) = (scriptL_dot(vb(q)) L(vb(q), dot, t))(vb(p)). $
]

Si assume che la funzione lagrangiana rispetto a $dot(vb(q))$ sia regolare e
strettamente convessa $forall vb(q),t$, e quindi,
$ H(vb(q), vb(p), t) = vb(p) dprod vb(dot(q))(vb(q), vb(p), t) - L(vb(q),vb(dot(q))(vb(q), vb(p), t), t) $
ove $vb(dot(q))(vb(q), vb(p), t) = vb(dot(q))_(vb(q),t) (vb(p))$ è l'unica
soluzione di $vb(p) = grad_dot(vb(q)) L(vb(q), dot(vb(q)),t)$ per $vb(q)$ e $t$ fissati.

#example[
  $ L(vb(q), dot(vb(q)), t) = T - U = m/2 vb(dot(q)) dprod A(vb(q)) dot(vb(q)) - U(vb(q),t) $
  In questo caso, l'energia cinetica potrebbe essere data da una forma quadratica,
  a seconda della carta scelta. Allora, si ha, facendo il gradiente della
  lagrangiana,
  $ vb(p) = m vb(dot(q)) dprod A(vb(q)) dot(vb(q)) <==> dot(vb(q))=(A^(-1)(vb(q),t))/m vb(p). $
  L'inversa della matrice $A$ esiste perché è definita positiva.
  $ ==> H(vb(q), vb(p), t) = (vb(p) dprod A^(-1) vb(p))/m - m/2 1/m^2 A^(-1) vb(p) A A^(-1) vb(p)+U = (vb(p) dprod A^(-1) vb(p))/(2m) + U = T_vb(p) + U. $
]

#example[
  utilizzando $vb(r)$ come variabile lagrangiana pensando ad un problema meccanico
  non vincolato, si ottiene un caso analogo al precedente, ma semplificato:
  $ L(vb(r), dot(vb(r))) = m/2 norm(vb(r))^2 - U(vb(r)) $
  La matrice $A(vb(q))$ è la matrice identità, per ogni $vb(q)$, e
  $ H(vb(r), vb(p)) = norm(vb(p))^2/(2m) + U(vb(r)). $
  In questo caso particolare, la hamiltoniana equivale all'energia meccanica.
]

#theorem[
  se $H$ è la funzione hamiltoniana corrispondente alla lagrangiana $L$ come sopra
  (con tutte le ipotesi fatte), allora le $n$ equazioni (del secondo ordine) di
  Eulero-Lagrange sono equivalenti alle $2n$ equazioni (del primo ordine)
  seguenti, dette _equazioni di Hamilton_:
  $ cases(
    dot(vb(q))(t) = grad_vb(p) H(vb(q)(t), vb(p)(t),t),
    dot(vb(p))(t) = - grad_vb(q) H(vb(q)(t), vb(p)(t),t),

  ) $
]
#dim[
  si considera una qualsiasi funzione $t |-> (vb(q)(t), vb(p)(t))$ (anche priva di
  significato fisico). Si calcola $dv(, t) H(vb(q)(t), vb(p)(t), t)$.
  $ grad_vb(q) H dprod dot(vb(q)) + grad_vb(p) H dprod dot(vb(p)) + pdv(H, t) = -grad_vb(q) L dprod dot(vb(q)) + (vb(p) - grad_dot(vb(q)) L) dprod diaer(vb(q)) + dot(vb(q)) dprod dot(vb(p)) - pdv(L, t). $
  Tuttavia, $(vb(p) - grad_dot(vb(q)) L) dprod diaer(vb(q)) = 0$, per definizione
  di $vb(p)$.
   
  I coefficienti di $dot(vb(q))$ e $dot(vb(p))$, più il termine noto, devono
  coincidere tra loro. Infatti, scegliendo $(vb(q)(t), vb(p)(t)) = (vb(q_0), vb(p_0))$,
  identicamente costante, allora $(dot(vb(q))(t), dot(vb(p))(t)) = (0,0)$. Ma se
  l'uguaglianza vale per ogni $vb(q)$ e $vb(p)$, allora deve valere quanto
  affermato. // Integrare con le dispense del prof
  Quindi
  $ grad_vb(q) H = -grad_vb(q) L, $
  $ dot(vb(q)) = grad_vb(p) H $
  $ pdv(H, t)=-pdv(L, t). $
   
  Ora, le equazioni di Eulero-Lagrange, nella notazione che si sta utilizzando, si
  scrivono come
  $ dot(vb(p)) = grad_vb(q) L = - grad_vb(q) H $
  e dunque le equazioni di Hamilton valgono se e solo se valgono le equazioni di
  Eulero-Lagrange nelle rispettive notazioni.
]
Si osservi che la prima equazione di Hamilton vale sempre, e non solo per
soluzioni alle equazioni di Eulero-Lagrange.

#corollary[
  sulle soluzioni delle equazioni di Hamilton vale
  $ dv(H, t)(vb(q)(t), vb(p)(t), t) = pdv(H, t)(vb(q)(t), vb(p)(t), t). $
]
#dim[
  $ dv(H, t) = grad_vb(q) H dprod dot(vb(q)) + grad_vb(p) H dprod vb(dot(p)) + pdv(H, t) $
  $ = grad_vb(q) H dprod grad_vb(p) H - grad_vb(p) H dprod grad_vb(q) H + pdv(H, t) = pdv(H, t). $
]

#corollary[
  se $H$ non dipende esplicitamente dal tempo, essa una costante del moto.
]
/* prendere dalle note del prof
#exercise[

]
*/

Si osserva che, se si ha una coordinata ciclica $q_overline(dotless.i)$ per la $L$,
allora anche $H$ non dipende da $q_overline(dotless.i)$. Inoltre, in questo caso $p_overline(dotless.i)$ è
conservato. Questo non solo riduce da $2n$ a $2n-1$ i gradi di libertà dello
spazio delle fasi, ma anche da $n$ a $n-1$ i gradi di libertà nello spazio delle
configurazioni nella seguente maniera: per semplicità, si suppone $overline(dotless.i) = n$,
allora
$ H(q_1, ..., q_(n-1), p_1, ..., p_n,t). $
Si riscrivono le equazioni di Hamilton come, per $i in {1,...,n-1}$,
$ cases(dot(q)_i = pdv(H, p_i), dot(p)_i = pdv(H, q_i)), space cases(dot(q)_n = pdv(H, p_n), dot(p_n) = 0) $
Se, per $p_n = overline(p_n)$ si chiama
$ H' = H(q_1, ..., q_(n-1), p_1, ..., overline(p_n),t) $
$ ==> cases(dot(q)_i = pdv(H, p_i), dot(p)_i = pdv(H, q_i)), space cases(dot(q)_n = pdv(H, p_n), dot(p_n) = 0) $
Se si sa risolvere il sistema di sinistra, si ottiene la soluzione $(q_1 (t), ..., p_(n-1) (t))$.
Ora, si chiama
$ f(t) = pdv(H, p_n)(q_1 (t),..., overline(p_n)(t),t). $
Il sistema di destra si riscrive come
$ dot(q)_n = f(t) ==> q_n(t) = q_n(t_0) + integral_(t_0)^t f(tau)dd(tau). $

== Alcuni risultati di base sulle equazioni differenziali

Si considera un'equazione differenziale _autonoma_ (che non ha una dipendenza
diretta dalla variabile libera, in questo caso $t$) $dot(vb(x))(t) = vb(f)(vb(x)(t))$,
dove $vb(f)$ è un campo vettoriale. Si può dimostrare che, se valgono alcune
proprietà in un intorno di $vb(x)$, allora si può trovare un'unica soluzione
globale, come già visto. Si considera il problema di Cauchy
$ cases(dot(vb(x))(t) = vb(f)(vb(x)(t)), vb(x)(0)=vb(x_0)) $
Assumendo che esistano delle soluzioni globali, le si denotano con $vb(x_x_0)(t)$,
tali soluzioni appartengono a $C^1$, se anche $vb(f) : Omega -> RR^n in C^1(Omega)$.

#def[
  il _flusso_ $Phi^t: Omega->Omega$ dell'equazione differenziale $dot(vb(x))(t) = vb(f)(vb(x)(t))$ è
  la funzione $Phi^t (vb(x_0)) = vb(x_x_0)(t)$.
]

Si osserva che $Phi^0 = "id"$. Il flusso è una delle forme più semplici di _propagatori_ ossia
funzioni che mostrano l'andamento di un'equazione differenziale.

#prop[
  il flusso ha la proprietà di gruppo, cioè $forall t, s in RR$,
  $ Phi^(t+s) = Phi^t compose Phi^s. $
]

#dim[
  per l'esistenza e l'unicità delle soluzioni dell'equazione differenziale, basta
  mostrare che:
  1. $s |-> Phi^s (Phi^t (vb(x)))$
  2. $s |-> Phi^(s+t) (vb(x))$
  sono entrambe soluzioni del problema di Cauchy, $forall vb(x) in Omega, forall t in RR$.
  Si verificano facilmente le condizioni iniziali. Inoltre, soddisfano l'equazione
  differenziale. Considerando la prima funzione:
  $ dv(, t) Phi^s (Phi^t (vb(x))) = vb(f)(Phi^s (Phi^t (vb(x)))). $
  Per la seconda funzione,
  $ dv(, s) Phi^(t+s) (vb(x)) = dv((t+s), s) dv(, (t+s)) Phi^(t+s) = vb(f)(Phi^(t+s) (vb(x))). $
]

Come funzione $Omega times RR -> Omega$, ($(vb(x),t) |->Phi^t (vb(x))$) si
assumerò sempre che $Phi$ sia sufficientemente regolare, tale almeno da far
valere il teorema di Schwarz sullo scambio delle derivate parziali seconde.

#theorem(
  "della divergenza",
)[
  sotto le ipotesi date, $forall A$ misurabile in $Omega$ vale
  $ dv(, t) Vol(Phi^t (vb(x))) = integral_(Phi^t (A)) div vb(f(x)) dd(x, [n]). $
]

#corollary[
  il flusso di un'equazione differenziale con campo vettoriale a divergenza nulla
  conserva i volumi.
]

#example[
  un esempio è un sistema hamiltoniano con $pdv(H, t) = 0$:
  $ cases(dot(vb(q)) = grad_vb(p) H, dot(vb(q)) = grad_vb(q) H) $
  Se si pone $vb(x)=(vb(q), vb(p))$, allora si possono scrivere le equazioni di
  Hamilton nella forma
  $ dot(vb(x)) = vb(f(x)) = JJ grad_vb(x) H(vb(x)) $
  dove $JJ$ è una matrice $2n times 2n$, divisa in quattro blocchi quadrati, dati
  da
  $ JJ = mat(0, II_n;-II_n, 0), $
  visto che
  $ vb(f(x)) = (grad_vb(p) H(vb(x)), grad_vb(q) H(vb(x))). $
   
  Si mostra che si tratta di un sistema di equazioni differenziali a divergenza
  nulla:
  $ grad_vb(x) dprod vb(f) = sum_(i=1)^n pdv(f_i, x_i) + sum_(i=1)^n pdv(f_(i+n), x_(i+n)) $
  $ = sum_(i=1)^n pdv(, q_i)pdv(H, p_i)- pdv(, p_i)pdv(H, q_i) = 0. $
]

#dim(
  "del teorema della divergenza",
)[
  $ Phi^(t+s) = Phi^s compose Phi^t $
  $ ==> D Phi^(t+s)_vb(x) = D Phi^s_(Phi^t) D Phi^t_vb(x), $
  $ J Phi^(t+s) (vb(x)) = J Phi^s ((Phi^t)(vb(x))) J Phi^t (vb(x)) $
  con $J = [pdv(Phi^t, vb(x))(vb(x))]$ (matrice jacobiana).
  $ ==> det J Phi^(t+s) (vb(x)) = det J Phi^s ((Phi^t)(vb(x))) det J Phi^t (vb(x)). $
  Il determinante della matrice jacobiana serve perché:
  $ Vol(Phi^t (vb(x))) = integral_(Phi^t (vb(x))) dd(y, [n]). $
  Facendo un cambio di variabile,
  $ vb(y) = Phi^t (vb(x)) <==> vb(x) = Phi^(-t) (vb(y)) $
  $ ==> dd(y, [n]) = abs(det [pdv(vb(y), vb(x))]) dd(x, [n]) = abs(det J Phi^t (vb(x))) $
  $ y in Phi^t (A) <==> vb(x) in A. $
  Allora
  $ Vol(Phi^t (vb(x))) = integral_A abs(det J Phi^t (vb(x))) dd(x, [n]). $
   
  Si asserisce che
  $ det J Phi^t (vb(x)) > 0 space forall vb(x), forall t $
  ed è continua in $t$. Infatti, $J Phi^0 (vb(x)) = 1$. Affinché il determinante
  diventi negativo, deve esistere un tempo $overline(t)$ in cui il determinante è
  nullo. Siccome ogni $Phi^t$ (e la sua inversa $Phi^(-t)$) è differenziabile, e
  dato che sono biiettive, $J Phi^t$ è una matrice non singolare (a determinante
  non nullo).
   
  Quindi,
  $ Vol(Phi^t (vb(x))) = integral_A det J Phi^t (vb(x)) dd(x, [n]). $
   
  Senza perdita di generalità, si assume che $A$ sia un insieme di volume finito
  (nel caso in cui non lo fosse si potrebbe suddividerlo in una quantità
  numerabile di insiemi di volume finito). Allora,
  $ pdv(J Phi^t, t) = eval(pdv(, s) det J Phi^s (Phi^t (vb(x))))_(s=0) det J Phi^t (vb(x)), $
  per un corollario del teorema della convergenza dominata di Lebesgue, che vale
  se $abs(pdv(, t) J Phi^t (vb(x))) <= g(vb(x))$, con $g$ sommabile in un intorno
  di $t$ (nel caso che si sta considerando vale in quanto $Phi in C^2$),
  $ dv(, t) Vol(Phi^t (A)) = integral_A pdv(, t) J Phi^t (vb(x)) dd(x, [n]) $
  $ ==> dv(, t) Vol(Phi^t (A)) = integral_A eval(pdv(, s) det J Phi^s (Phi^t (vb(x))))_(s=0) det J Phi^t (vb(x)) dd(x, [n]). $
   
  Si verifica che
  $ eval(pdv(, s) det J Phi^s (Phi^t (vb(x))))_(s=0) = div vb(f). $
   
  Una dimostrazione sbagliata ma data da molti libri usa il fatto che
  $ Phi^s (vb(x)) = Phi^0 (vb(x)) + s eval(pdv(Phi^s (vb(x)), s))_(s=0) + o(s) = vb(x) + s vb(f(x)) + o(s). $
  Infatti, la derivata di un flusso rispetto al parametro $s$ è, per definizione
  di flusso,
  $ pdv(, s) Phi^s (vb(x)) = vb(f) (Phi^s (vb(x))) $
  $ ==> eval(pdv(Phi^s (vb(x)), s))_(s=0) = vb(f(x)) = dot(vb(x)) $
  $ ==> [J Phi^s (vb(x))]_(i j) = (Phi_i^s (vb(x)), x_j) = delta_(i j) + s pdv(f_i, x_j) + o(s). $
  Quest'ultima equazione è vera, ma c'è un errore: infatti, in generale,
  $ pdv(o(s), x_i) != o(s). $
   
  Per una dimostrazione corretta, si usano comunque le proprietà del flusso, ma
  direttamente sulla jacobiana:
  $ J Phi^s (vb(x)) = J Phi^0 (vb(x)) + s eval(pdv(, s) J Phi^s (vb(x)))_(s=0) + o(s). $
  Ora, $J Phi^0 (vb(x)) = II$ è la matrice identità, e
  $ eval(pdv(, s) J Phi^s (vb(x)))_(s=0) = pdv(, s) pdv(Phi_i^s (vb(x)), x_j) = pdv(, x_j) eval(pdv(Phi_i^s (vb(x)), s))_(s=0) = pdv(, x_i) (f_i (vb(x))). $
  E dunque
  $ [J Phi^s (vb(x))]_(i j) = delta_(i j) + s pdv(f_i, x_j)(vb(x)) + o(s). $
  Si calcola il determinante utilizzando il teorema di Binet:
  - Moltiplicando gli elementi diagonali, si ha
  $ product_(i=1)^n (1+s pdv(f_i, x_i)+o(s)) = 1+ sum_(i=1)^n pdv(f_i, x_i) +o(s). $
  - Per le altre permutazioni, si devono sempre prendere almeno due termini fuori
    dalla diagolane (altrimenti si ripeterebbe almeno una riga o una colonna).
    Quindi tutti gli altri termini sono $o(s)$, dato che gli elementi fuori
    diagonale non hanno gli $1$. Allora,
  $ det J Phi^s (vb(x)) = 1 + s sum_(i=1)^n pdv(f_i, x_j)(vb(x)) + o(s) $
  $ ==> eval(pdv(, s) J Phi^s (vb(x)))_(s=0) = div vb(f(x)). $
   
  Allora, si ha che, invertendo il cambio di variabile fatto a inizio
  dimostrazione,
  $ dv(, t) Vol(Phi^t (A)) = integral_A div vb(f)(Phi^t (vb(x))) det J Phi^t (vb(x)) dd(x, [n]) = integral_(Phi^t (A)) div vb(f(y)) dd(y, [n]). $
]

Per i campi vettoriali che conservano i volumi vale un importante teorema, il _teorema di ricorrenza di Poincaré_,
che fa utilizzo del concetto di _misura_, ossia una funzione $A |-> mu(A)$, con $A in scriptM_n$ (misurabile
secondo Lebesgue), con
$ mu(A) = integral_A f(vb(x)) dd(x, [n]) $
per una certa funzione $f >= 0$. Ad esempio, nella misura di Lebesgue, si prende $f(vb(x)) = 1$.

#def[
  un flusso $Phi^t : Omega -> Omega$ preserva la misura $mu$ se, $forall t, forall A in scriptM_n$,
  $ mu(Phi^t (A)) = mu(A). $
]

#theorem(
  "di ricorrenza di Poincaré",
)[
  sia dato un flusso $Phi^t : Omega -> Omega$ che preserva una misura $mu$ su $Omega$,
  con $mu(Omega) < +infinity$. Allora, preso $A$ misurabile e $T>0$, per quasi
  ogni $vb(x) in A$,
  $ exists t(vb(x)) >= T : Phi^t (vb(x)) in A. $
]

In altre parole, quasi ogni $vb(x) in A$ "tornerà" in $A$ dopo un intervallo di
tempo $[0,t)$ abbastanza lungo. Se anche si hanno delle condizioni iniziali "strane",
queste si ripeterano nell'evoluzione del sistema.

#dim[
  si definisce l'insime dei punti che non tornano in $A$ per multipli di $T$:
  $ B = {vb(x) in A : Phi^(n T) (vb(x)) in.not A, forall n in NN^+}. $
  Si mostra che $mu(B) = 0$ (in realtà si sta mostrando qualcosa di più forte,
  ossia che il tempo a cui quasi ogni punto torna è multiplo di $T$).
  Innanzitutto, essendo $Omega without A$ misurabile,
  $ B = sect.big_(n=1)^infinity Phi^(-n T) (Omega without A) ==> B "è misurabile". $
   
  Si osserva inoltre che
  $ Phi^(-n T) (B) sect B = emptyset, forall n in NN^+. $
  Infatti, se si avesse un punto nell'intersezione, cioè $vb(x) in B$ e $Phi^(n T) (vb(x)) in B$,
  si otterrebbe un assurdo, dato che $B subset.eq A$.
   
  Infine, si osserva che
  $ Phi^(n T) (B) sect Phi^(m T) = emptyset, forall m,n in NN^+. $
  Sia, senza perdita di generalità, $m>n$. Allora si ha che (applicando $Phi^(-m T)$,
  essendo i flussi iniettivi e $Phi^(n T) = emptyset$)
  $ Phi^(-m T + n T) sect B = emptyset. $
  Da cui si ottiene l'enunciato, grazie all'osservazione precedente. In altre
  parole, si è affermato che tutti i ${Phi^(n T)}_(n in NN^+)$ sono disgiunti.
  Dalle ipotesi, si ha che, essendo i flussi disgiunti,
  $ infinity > mu(Omega) >= mu(union.big_(n in ZZ^times) Phi^n (B)) = sum_(n in NN^+) mu(Phi^(n T) (B)) = sum_(n in NN^+) mu(B). $
  L'ultima uguaglianza vale perché il flusso, per ipotesi, preserva la misura. Si
  ha quindi una somma di infinite (numerabilmente) quantità positive tutte uguali
  tra loro, che dà un risultato finito, dunque necessariamente $mu(B)=0$.
]

#corollary[
  con le stesse ipotesi, quasi ogni $vb(x) in A$ "ritorna in $A$ infinite volte",
  ovvero per quasi ogni $vb(x) in A$, $exists {t_j}_(j>=0)$, con $t_j -> infinity$,
  dipendente da $vb(x)$, tale che $Phi^(t_j) (vb(x)) in A$.
]
La dimostrazione del corollario è lasciata come esercizio.

#example[
  Si considera un sistema formato da cento biglie disposte casualmente in una
  scatola, divisa in due settori. Ogni secondo, le biglie sono ridistribuite
  casualmente, ossia ogni pallina ha il $50%$ di probabilità di andare nel settore
  destro o sinistro. Siccome la probabilità di avere tutte le palline nel settore
  sinistro è di $(1/2)^100$, ci si aspetta allora che serva un tempo dell'ordine
  di $2^100$ secondi per avere tutte le palline a sinistra (un tempo di molti
  ordini di grandezza maggiore dell'età dell'universo).
]

== Applicazione ai sistemi hamiltoniani

In molti casi si ha, per una particella
$ H(vb(q), vb(p)) = norm(vb(p))^2/(2 m) + U(vb(q)) $
o per $n$ particelle
$ H(vb(q), vb(p)) = iprod(gvec(p), gmat(M)^(-1) gvec(p))/2 + U(vb(q)). $

Si considera la _superficie isoenergetica_
$ Sigma_E = {(vb(q), vb(p)) in RR^(2n) : H(vb(q), vb(p)) = E}. $
Essa ha misura nulla, avendo due dimensioni in meno rispetto a $RR^(2n)$. Si
definisce allora
$ G_(E, difference(E)) = {(vb(q), vb(p)) in RR^(2n) : E - difference(E) <= H(vb(q), vb(p)) <= E + difference(E)}, $
che non ha misura nulla. In questo caso si è limitati sia nelle $vb(q)$ ($U(vb(q)) <= E + difference(E)$)
che nelle $vb(p)$ ($norm(vb(p)) <= sqrt(2 m (E + difference(E)))$).

#exercise[
  risolvere completamente (integrare) nel formalismo hamiltoniano il seguente
  sistema: si ha un tubo di massa trascurabile, che vincola una massa $m$ al suo
  interno, alla posizione $(x,y)$, collegata al centro del tubo $(x_1,y_1)$ mediante
  una molla di costante $k$.
   
  Il sistema ha due gradi di libertà, infatti senza vincoli si avrebbero due punti
  (alle due estremità della molla) e dunque quattro gradi di libertà.
   
  _Principio di soluzione_: nelle coordinate libere (trascurando il vincolo), il
  potenziale è
  $ U(x,y,x_1,y_1) = k/2 abs(x-x_1)^2 + k/2 abs(y-y_2)^2 $
  e l'energia cinetica è
  $ T(dot(x), dot(y), dot(x)_1, dot(x)_2) = 1/2 m (dot(x)^2 + dot(y)^2) + 1/2 m_1 (dot(x)_1^2 + dot(y)_1^2). $
  Passando ora alle coordinate locali $(x,y) = vb(q)$, si ha una carta che
  riflette i vincoli del sistema:
  $ vb(r(q)) = cases(x=x, y=y, x_1=0, y_1=y) $
  $ ==> hat(U)(vb(r(q))) = k/2 x^2 $
  $ hat(T)(dot(vb(x)), dot(vb(y))) = hat(T)(dot(vb(r)) (vb(q), dot(vb(q)))) = hat(T)([pdv(vb(r), vb(q))] vb(dot(q))) = m/2 (dot(x)^2 + dot(y)^2) $
  dato che la massa del tubo è trascurabile. Si ha quindi $L = T-U$, ma si può
  anche ottenere l'hamiltoniana (tramite la trasforma di Legendre della
  lagrangiana)
  $ H(x,y,p_x,p_y) = (p_x^2 + p_y^2)/(2m) + U(x) $
  con $p_x = m dot(x)$ e $p_y = m dot(y)$. Dunque la $y$ è una coordinata ciclica.
]

#example[
  in alcuni casi, $vb(p) = grad_dot(vb(q))L$ non rappresenta la quantità di moto.
  Per esempio, per il campo elettromagnetico,
  $ L(vb(r), dot(vb(r)), t) = T-U = m/2 norm(dot(vb(r)))^2 - hat(q)(V(vb(r),t)- vb(A)(vb(r),t) dprod dot(vb(r))). $
  In questo caso,
  $ vb(p) = grad_dot(vb(r)) L = m dot(vb(r)) + hat(q) vb(A)(vb(r),t) <==> dot(vb(r)) = (vb(p)-hat(q) vb(A))/m $
  Da cui 
  $ H(vb(r), dot(vb(r)),t)=vb(p) dprod dot(vb(r))(vb(p)) - L(vb(r), dot(vb(r)), t) = abs(vb(p) - hat(q) vb(A))/(2m) + hat(q)V. $
  Nel caso speciale $pdv(V, t) = 0 = pdv(vb(A), t)$, neanche lagrangiana e
  hamiltoniana dipendono dal tempo, e inoltre
  $ pdv(H, t) = 0 ==> dv(H, t) = 0. $
  Se $(vb(q)(t), vb(p)(t))$ è soluzione delle equazioni di Hamilton, allora 
  $ dv(, t)H(vb(q)(t), vb(r)(t), t) = pdv(, t)H(vb(q)(t), vb(r)(t) ,t). $
  Quindi $H$ è una costante del moto e la sua espressione è data da 
  $ 1/2 "massa" times "velocità"^2 + "energia potenziale elettrica". $
]

