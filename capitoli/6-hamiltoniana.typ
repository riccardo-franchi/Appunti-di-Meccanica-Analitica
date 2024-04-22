#import "../setup.typ": *

#show: thmrules

= Cenni di meccanica Hamiltoniana

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
