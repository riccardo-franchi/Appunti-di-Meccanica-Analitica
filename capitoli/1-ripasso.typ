#import "../setup.typ": *

#show: thmrules

= Richiami e notazioni di meccanica
Si indica la legge oraria come:
$ vb(r)(t) $
che è una funzione da un sottoinsieme di $RR$ a un sottoinsieme di $RR^3$. Essa
non deve essere confusa con la _traiettoria_ di un punto, che è l'immagine di $vb(r)(t)$.
Si definisce poi $vb(v)(t) := vb(dot(r))(t)$ la velocità della legge oraria $vb(r)(t)$,
e $vb(a)(t) := vb(diaer(r))(t)$.

Si ha come equazione della _meccanica newtoniana_ di una particella
$ vb(a)=vb(F_"tot")/m $
che dà un'equazione differenziale (ordinaria):
$ vb(diaer(r))(t)=(vb(F_"tot")(vb(r)(t), vb(dot(r))(t), t))/m. $

Si assumerà sempre che esiste unica una soluzione di quest'ultima equazione
differenziale, con condizioni iniziali "sensate"
$ cases(vb(r)(t_0)=:vb(r_0), vb(dot(r))(t_0) =: vb(v_0)). $

Spesso la soluzione $vb(r)(t)$ dell'equazione differenziale sarà _globale_,
ovvero definita $forall t in RR$.

Si può trasformare un'equazione differenziale lineare di secondo ordine
vettoriale, come quella appena vista, in due equazioni differenziali lineari del
primo ordine. Si pone $vb(v)(t) := vb(dot(r))(t)$. Allora l'equazione è
equivalente a
$ cases(
  vb(dot(r))(t)=vb(v)(t),
  vb(dot(v))(t) = (vb(F_"tot")(vb(r)(t), vb(dot(r))(t), t))/m,

) $

Si definisce $vb(f) : RR^3 times RR^3 times RR -> RR^3 times RR^3$
$ vb(f)(vb(r), vb(v), t) := (vb(v), (vb(F_"tot")(vb(r)(t), vb(dot(r))(t), t))/m) $
e $vb(y): RR ->RR^3 times RR^3$
$ vb(y)(t) := (vb(r)(t), vb(v)(t)). $
Il sistema diventa quindi
$ vb(dot(y))(t)=vb(f)(vb(y)(t), t). $

Utilizzando la notazione vettoriale,
$ dv(, t) vec(vb(r)(t), vb(v)(t)) = vec(vb(v)(t), (vb(F_"tot")(vb(r)(t), vb(dot(r))(t), t))/m). $

Si è quindi passati da un'equazione di secondo grado con tre gradi di libertà ad
una equazione di primo grado con sei gradi di libertà.

== Lavoro ed energia

Data una forza $vb(F)$ (che non è necessariamente la forza totale che agisce su
una particella) e uno spostamento infinitesimo $vb(dd(r))$, il lavoro
infinitesimo di $vb(F)$ lungo $vb(dd(r))$ è
$ dd(W)=vb(F) dprod vb(dd(r)) $

Data una forza $vb(F)(vb(r)(t), vb(v)(t), t)$ è una legge oraria $vb(r)(t), t in [t_1, t_2]$ il
lavoro della forza lungo la $vb(r)(t)$ è definito come
$ W =integral_(t_1)^(t_2) vb(F) dprod vb(dd(r))= integral_(t_1)^(t_2) vb(F)(vb(r)(t), vb(v)(t), t) dprod vb(v)(t) dd(t). $

Se $vb(F)$ dipende solo dalla traiettoria allora si può risolvere anche il primo
integrale, svolgendo il prodotto scalare, ma se $vb(F)$ dipende anche dal tempo $t$ questo
procedimento non si può utilizzare. Il passaggio dal primo integrale al secondo
equivale, a livello matematico, ad un cambio di variabile. Il secondo integrale
è utile per notare esplicitamente che il lavoro non è la somma di tanti piccoli
spostamenti, ma può dipendere anche dalla velocità e dall'intervallo di tempo.

Come accennato prima, se la forza è di tipo $vb(F(r))$, cioè dipende solo dalla
posizione della particella (campo posizionale), allora il lavoro $W$ dipende
solo da $vb(F)$ e dalla traiettoria $gamma = Im(vb(r))$ e si può scrivere
$ W = integral_gamma vb(F) dprod vb(dd(r)). $

#dim[
  si considera un'altra parametrizzazione di $gamma$:
  $ vb(q): [s_1, s_2] -> gamma. $
  Sotto certe ipotesi, illustrate sotto, si può scrivere
  $ vb(r)(t) = vb(q)(phi.alt(t)) $
  con $phi.alt$ biettiva e derivabile.

  Si è cioè definita una funzione $vb(q)(s)$ che al tempo $s$ corrisponde al
  valore della funzione $vb(r)(t)$ al tempo $t$, e si è definita un'altra funzione $phi.alt(t)$ tale
  che $phi.alt(t) = s$.

  Le ipotesi sono
  - $vb(r): [t_1, t_2] -> gamma$ biettiva
  - $vb(q): [s_1, s_2] -> gamma$ biettiva

  Si noti che:
  $ vb(r) = vb(q) compose phi.alt <=> phi.alt = vb(q)^(-1) compose vb(r). $

  Si deve quindi compiere un moto in cui la particella non è mai ferma e non torna
  mai indietro lungo la sua traiettoria.

  Si hanno due casi, $phi.alt$ crescente o decrescente. Si dimostra il caso in cui
  è crescente, mentre l'altro, analogo, è lasciato come esercizio.

  Si ha l'integrale
  $ integral_(t_1)^(t_2) vb(F(r)) dprod vb(v)(t) dd(t) = integral_(t_1)^(t_2) vb(F)(vb(q)(phi.alt(t))) dprod dv(, t) vb(q)(phi.alt)(t) dd(t) =
  integral_(t_1)^(t_2) vb(F)(vb(q)(phi.alt(t))) dprod vb(dot(q))(phi.alt(t)) dot(phi.alt)(t) dd(t) $

  Facendo il cambio di variabile
  $ s := phi.alt(t) $
  $ => dd(s) = dot(phi.alt)(t) dd(t), $
  $ s_1 := phi.alt(t_1), s_2:= phi.alt(t_2) $
  $ ==> integral_(t_1)^(t_2) vb(F)(vb(q)(phi.alt(t))) dprod vb(dot(q))(phi.alt(t)) dot(phi.alt)(t) dd(t) = integral_(s_1)^(s_2) vb(F)(vb(q)(s)) dprod vb(dot(q))(s) dd(s). $
]

L'energia cinetica $T$ vale
$ T(vb(v)) = 1/2 m v^2 $
espressa come funzione generica di $v$, mentre lungo una legge oraria $vb(r)(t)$:
$ T(t) = T(vb(dot(r))(t)). $
Si noti che, per semplicità, si è indicato ugualmente con $T$ una funzione che
ha come parametro un vettore e una funzione che prende uno scalare.

#prop[
  il lavoro $W$ della _forza totale_ agente su una particella lungo una legge
  oraria $vb(r)(t), t in [t_1,t_2]$ è pari alla variazione dell'energia cinetica
  in $[t_1, t_2]$, indicata con $difference(T) = T(t_2)-T(t_1)$.
]

#dim[
  $ dv(, t)T(t) = dv(, t) m/2 vb(dot(r))(t) dprod vb(dot(r))(t) = m vb(dot(r))(t) dprod vb(diaer(r))(t) = vb(F_"tot")(vb(r)(t), vb(dot(r))(t), t) dprod vb(dot(r))(t) $
  $ ==> W_"tot" = integral_(t_1)^(t_2) vb(F_"tot") dprod vb(dot(r))(t) dd(t) = integral_(t_1)^(t_2) dv(T(t), t) dd(t) = T(t_2)- T(t_1). $
]

#def[
  un campo di forza _posizionale_ $vb(F)=vb(F(r))$ si dice _conservativo_ se
  esiste una funzione a valori scalari $U(vb(r))$ tale che
  $ vb(F(r)) = -grad U(vb(r)) = -(pdv(U, x)(vb(r)), pdv(U, y)(vb(r)), pdv(U, z)(vb(r))) $
  dove $vb(r) = (x,y,z)$. La funzione $U(vb(r))$ è detta _energia potenziale_.
]

Si noti la differenza tra $U(vb(r))$ e $U(vb(r)(t))$, come per l'energia
cinetica. Si noti anche che $U$ è definita a meno di una costante: con
$ U_c (vb(r)) := U(vb(r)) + c, $
$U_c (vb(r))$ ha le stesse proprietà fisiche di $U(vb(r))$.

#prop[
  il lavoro compiuto da un campo conservativo lungo una legge oraria $vb(r)(t), t in [t_1,t_2]$ (ma
  si potrebbe anche dire lungo la traiettoria data da $vb(r)$) è pari all'opposto
  della variazione dell'energia potenziale
  $ W=-difference(U) = U(t_1)-U(t_2). $
]

#dim[
  per $U(vb(r)), vb(r)(t)$ funzioni differenziabili
  $ dv(, t)U(vb(r)(t)) = grad U(vb(r)(t)) dprod vb(dot(r))(t). $

  Allora si può scrivere
  $ W = integral_(t_1)^(t_2) vb(F)(vb(r)(t)) dprod vb(dot(r))(t) dd(t) = - integral_(t_1)^(t_2) grad U(vb(r)(t)) dprod vb(dot(r))(t) dd(t) = - integral_(t_1)^(t_2) dv(, t) U(t) dd(t) = - difference(U). $
]

#def[
  per una particella sottoposta (soltanto) ad un campo conservativo ($vb(F) = vb(F_"tot")$)
  l'_energia totale_ è definita ome
  $ E(vb(r),vb(v)) := T(vb(v)) + U(vb(r)). $
]

Una notazione utilizzata è
$ E(t) = E(vb(r)(t), vb(dot(r))(t)). $

#theorem(
  "conservazione dell'energia totale",
)[
  l'energia totale $E(t)$ di una particella sottoposta (soltanto) ad un campo
  conservativo è costante.
]

#dim[
  nell'intervallo di tempo $[t_0,t]$ vale
  $ T(t)-T(t_0) = W_"tot" = W_vb(F) = U(t_0)- U(t) $
  $ ==> T(t) + U(t) = T(t_0)+ U(t_0). $
]

== Momenti della quantità di moto e della forza

Si indica con $vb(p) = m vb(v)$ la quantità di moto. Dato un punto (o un
vettore) $vb(r_0)$ fissato, si definisce
$ vb(L) = (vb(r)- vb(r_0)) cprod vb(p) $
_momento della quantità di moto_ $vb(p)$ e
$ vb(N) = (vb(r)-vb(r_0)) cprod vb(F) $
_momento della forza_ $vb(F)$.

Con $vb(L)(t) = vb(r)(t) cprod (m vb(dot(r))(t))$, ponendo $vb(r_0) = 0$,
$ vb(dot(L))(t) = m vb(dot(r))(t) cprod vb(dot(r))(t) + m vb(r)(t) cprod vb(diaer(r))(t) = vb(N_"tot" (r)) = vb(r) cprod vb(F_"tot") $

Si lascia come esercizio rifare il conto per $vb(r_0) eq.not 0$.

#def[
  un campo di forze _centrale_ è un campo posizionale $vb(F(r))$ tale che
  $ vb(F(r)) = f(r) vb(r)/r = f(r) vu(r) $
  per una funzione $f : [0, +infinity) -> RR$.
]

#prop[
  un campo centrale è conservativo con energia potenziale $U(vb(r)) = -g(r)$, dove $g$ è
  una primitiva di $f$ (definita sopra):
  $ g(r) = integral_(r_0)^r f(rho) dd(rho). $
]

#dim[
  si mostra che $vb(F(r)) = - grad U(vb(r))$:
  $ -grad U(vb(r)) = grad g(r) = g'(r) grad r = g'(r) vb(r)/r = vb(F(r)) $
  (si è fatto uso di un lemma dell'analisi matematica che vale per funzioni
  differenziabili). Si mostra che $grad r = vu(r)$:
  $ vb(r) = (x,y,z) $
  $ ==> r = sqrt(x^2+y^2+z^2) $
  $ ==> pdv(r, x) = (2x)/(2 sqrt(x^2+y^2+z^2)) = x/r $
  $ ==> grad r = (x/r, y/r, z/r) = vb(r)/r. $
]

#prop[
  se una particella è sottoposta ad un campo centrale $vb(F)$ essa conserva il
  momento della quantità di moto rispetto all'origine.
]

#dim[
  $ vb(dot(L))(t) =vb(N_"tot")= vb(r)(t) cprod vb(F)(vb(r)(t)) = 0 $
  dato che $vb(F) parallel vb(r)$ dato che la forza è centrale.
]

== Meccanica newtoniana di sistemi di particelle

Dato un sistema con $N$ particelle, con posizioni e velocità $vb(r_i), vb(v_i)$,
ponendo
$ gvec(r) = (vb(r_1), ..., vb(r_N)) in RR^(3N) $
$ gvec(v) = (vb(v_1), ..., vb(v_N)) in RR^(3N) $
$ gvec(p) = (vb(p_1), ..., vb(p_N)) in RR^(3N), $
e chiamandoli _vettori globali_, allora
$ gvec(F) = gvec(dot(p)) $
con
$ gvec(F) = (vb(F_1), ..., vb(F_N)) $
e $vb(F_i)$ è la forza totale agente sulla particella $i$-esima. Si può quindi
riscrivere il secondo principio della dinamica per tutto il sistema come
$ gvec(F) = gmat(M) gvec(a) $
dove $gvec(a)$ è il vettore globale delle accelerazioni e $gmat(M)$ è la matrice
diagonale $3N times 3N$ delle masse:

$ dmat(m_1 bb(1)_3, dots.down, m_n bb(1)_3, delim: "[") $
dove con $m_i bb(1)_3$ si indica la massa $i$-esima moltiplicata per la matrice
identità $3 times 3$:
$ m_i bb(1)_3 = dmat(m_i, m_i, m_i, delim: "[") $

#def[
  si definisce energia cinetica totale
  $ T(gvec(v)) = 1/2 iprod(gvec(v), gmat(M) space.hair gvec(v)). $
]

Si mostra facilmente che, con questa definizione,
$ T(gvec(v)) = sum_(i=1)^N m_i/2 v_i^2 = sum_(i=1)^N T(vb(v_i)). $
L'energia cinetica totale è quindi la somma delle energie cinetiche individuali.

Se il sistema totale di forze è posizionale, ossia
$ gvec(F) = (vb(F_1)(gvec(r)), ..., vb(F_N)(gvec(r))) $
dove la forza che agisce su ogni particella dipende solo dalle posizioni di
tutte le particelle, ed esiste una funzione $U(gvec(r)), U : RR^(3N) -> RR$,
tale che
$ gvec(F)(gvec(r))= -grad_gvec(r) U(gvec(r)) = -(grad_vb(r_1) U(gvec(r)), ..., grad_vb(r_N) U(gvec(r))) = -(pdv(U(gvec(r)), x_1), pdv(U(gvec(r)), y_1), pdv(U(gvec(r)), z_1), ...) $
allora il sistema di particelle si dice _conservativo_ e $U$ è detta _energia potenziale totale_.

#example[
  Considerate le forze
  $ vb(F_i) = - grad_vb(r_i) U(vb(r_i)) $
  Si dimostra che il sistema è conservativo per
  $ U(gvec(r)) = sum U_i (vb(r_i)), $
  infatti,
  $ grad_gvec(r) U(gvec(r)) = (grad_vb(r_1) U(gvec(r)), ..., grad_(vb(r_N)) U(gvec(r))) $
  con
  $ grad_vb(r_i) U(gvec(r)) = grad_vb(r_i)(sum_(k=1)^N U_k (vb(r_k))) = grad_vb(r_i) U_i (vb(r_i)) = - vb(F_i (r_i)) $

  $ ==> -grad_gvec(r) U(gvec(r)) = (vb(F_1 (r_i)), ..., vb(F_N (r_N))) = gvec(F)(gvec(r)). $
]

#def[
  l'_energia totale del sistema_ è data da
  $ E(gvec(r), gvec(v)) = T(gvec(v)) + U(gvec(r)) $
]

Per una legge oraria $gvec(r)(t)$,
$ E(t) = E(gvec(r)(t), gvec(dot(r))(t)). $

#theorem("conservazione dell'energia totale")[
  in un sistema conservativo, l'energia totale si conserva:
  $E(t) = "costante"$.
]
La dimostrazione è lasciata per esercizio.

=== Forze esterne e interne
Generalmente, la forza totale agente su una particella, può essere scomposta in
una componente esterna e una interna:
$ vb(F_i) = vb(F_i)^"ext" + sum_(j=1 \ j eq.not i)^N vb(F_(i j)) $
dove con $vb(F_(i j))$ si indica la forza che la particella $j$-esima esercita
sulla $i$-esima, e
$ vb(F_i)^"ext" = vb(F_i)^"ext" (vb(r_i), vb(v_i), t), $
$ vb(F_(i j)) = vb(F_(i j)) (vb(r_i), vb(v_i), vb(r_j), vb(v_j)). $

Inoltre, in molti casi,
$ vb(F_(i j)) = vb(F_(i j))(vb(r_i) - vb(r_j)) $
e, in particolare,
$ vb(F_(i j))= f_(i j)(norm(vb(r_i)- vb(r_j)))(vb(r_i)-vb(r_j))/norm(vb(r_i)- vb(r_j)) $
con $f_(i j) = f_(j i), f_(i j): RR_0^+ -> RR$. Come conseguenza di
quest'assunzione, si ha $vb(F_(i j)) = -vb(F_(j i))$, ed entrambe sono parallele
a $vb(r_i)-vb(r_j)$. Si tratta di un'espressione della _forma forte_ della terza
legge di Newton. Sotto queste ultime ipotesi, il campo di forze interne è
conservativo.

#def("centro di massa")[
  $ vb(R) = (sum_(i=1)^N m_i vb(r_i))/(sum_(i=1)^N m_i) in RR^3. $
]

Spesso si indica $M = sum_(i=1)^N m_i$. Vale che, sotto l'ipotesi che $vb(F_(i j)) = -vb(F_(j i))$,
$ M vb(diaer(R)) = sum_i m_i vb(diaer(r)_i) = sum_i vb(F_i) = sum_i vb(F_i)^"ext" + sum_(i != j) vb(F_(i j)) = sum_i vb(F_i)^"ext". $
Quindi è come se la forza esterna totale agente sul sistema agisse sul centro di
massa.

#def("quantità di moto totale")[
  $ vb(P) = sum_(i=1)^N vb(p_i). $
]

Si ha che $vb(P)$ si conserva nel caso in cui $sum_i vb(F_i)^"ext"=0$.
#def("momento angolare totale e momento della forza totale")[
  si definisce, per un punto di riferimento $vb(r_0) in RR^3$,
  $ vb(L) = sum_i vb(L_i) = sum_i (vb(r_i)- vb(r_0)) cprod vb(p_i) $
  e
  $ vb(N) = sum_i vb(N_i) = sum_i (vb(r_i)-vb(r_0)) cprod vb(F_i). $
]

Vale che
$ vb(dot(L)) = sum_i vb(dot(L)_i) = sum_i vb(N_i) $
se $vb(F_i) = vb(F_i)^"tot"$, nell'ipotesi che $vb(F_(i j)) = -vb(F_(j i))$,
$ vb(dot(L)) = sum_i (vb(r_i)-vb(r_0)) cprod vb(F_i)^"ext" + sum_i (vb(r_i) - vb(r_0)) cprod sum_(j!= i) vb(F_(i j)). $
Ora, si mostra che il secondo termine della somma è nullo, dove nella seconda
uguaglianza si sono scambiati gli indici $i$ e $j$:
$ sum_i (vb(r_i) - vb(r_0)) cprod sum_(j!= i) vb(F_(i j)) = sum_(i<j) (vb(r_i) - vb(r_0)) cprod vb(F_(i j)) +sum_(i>j) (vb(r_i) - vb(r_0)) cprod vb(F_(i j)) = sum_(i<j) (vb(r_i)-vb(r_j)) cprod vb(F_(i j)) = 0 $
dato che $vb(r_i)-vb(r_j)$ è parallelo a $vb(F_(i j))$.

Si mostra che un sistema con forze interne del tipo
$ vb(F_(i j))=f_(i j)(norm(vb(r_k)-vb(r_j)))(vb(r_k)-vb(r_j))/norm(vb(r_k)-vb(r_j)) $
è conservativo con energia potenziale
$ U^"int" (gvec(r))-U(gvec(r)) = - sum_(i<j) g_(i j)(norm(vb(r_i)-vb(r_j))) $
con
$ g_(i j)(r) = integral_(r_0)^r f_(i j)(rho)dd(rho). $
Si ha che
$ -grad_gvec(r) U(gvec(r)) = -(grad_vb(r_1) U(gvec(r)), ..., grad_vb(r_N) U(gvec(r))), $
dove ogni gradiente vale
$ -grad_vb(r_k) U(gvec(r)) = sum_(i<j \ i = k or j = k)^N grad_vb(r_k) g_(i j)(norm(vb(r_i)-vb(r_j))) = sum_(j=1 \ j != k)^N g'_(k j)(norm(vb(r_k)-vb(r_j)))(vb(r_k)-vb(r_j))/norm(vb(r_k)-vb(r_j)) = sum_(j!=k) vb(F_(k j)) = vb(F_k^"int"). $

#example[
  con $N=4$, il potenziale è, omettendo gli argomenti delle funzioni,
  $ U(gvec(r)) = g_12 + g_13 + g_14 + g_23 + g_24 + g_34. $
  Ponendo $k=3$,
  $ grad_vb(r_3) U(gvec(r)) = grad_vb(r_3) g_31 + grad_vb(r_3) g_32 + grad_vb(r_3) g_34. $
]