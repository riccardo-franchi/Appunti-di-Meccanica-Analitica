#import "../setup.typ": *

#show: thmrules

= Cinematica relativa

Dato un sistema lagrangiano $L(vb(q), vb(dot(q)),t)$, alle volte è conveniente
fare un cambio di coordinate dipendente dal tempo
$ vb(Q) = vb(Q)(vb(q),t) = vb(Q_t)(vb(q)) $
con $vb(Q_t)$ biettiva, e con inversa $vb(q_t)(vb(Q))$.

#prop[
  se $scriptL(vb(Q), vb(dot(Q)), t)$ è la lagrangiana $L$ espressa nelle $vb(Q), vb(dot(Q)), t$,
  ovvero
  $ scriptL(vb(Q), vb(dot(Q)), t)=L(vb(q)(vb(Q),t), [pdv(vb(q), vb(Q))(vb(Q),t)]vb(dot(Q)) + pdv(vb(q), t),t) $
  allora le soluzioni lagrangiane per $L$ sono le soluzioni lagrangiane per $scriptL$,
  espresse nelle $vb(q)$.
]
Sì è già data una dimostrazione di questa proposizione, utilizzando il lemma per
la trasformazione dei gradienti.

Si considerano due sistemi di riferimento $S$ e $S'$, la cui origine è a
distanza $vb(r_0)$ dall'origine di $S$. Si chiama $B_t$ la matrice $3 times 3$ di
rotazione, o semplicemente rotazione, tale che
$ B_t vu(e_x) = vu(e_X), space.quad B_t vu(e_y) = vu(e_Y), space.quad B_t vu(e_z) = vu(e_Z) $
dove con le lettere minuscole si denota la base canonica di $S$ e con le
maiuscole quella di $S'$.

#def[
  se $tau_vb(a)$ denota la trasformazione di una quantità $vb(a)$ in $RR^3$, cioè $tau_vb(a) (vb(r)) = - vb(r) + vb(a)$,
  si dice che la trasformazione
  $ D_t = tau_vb(r_0) compose B_t $
  _porta_ $S$ in $S'$.
]

Ciò significa (per definizione) che se $vb(r)$ è il vettore nel sistema $S$ e
che indica un punto dello spazio, e $R$ è il vettore nel sistema $S'$ che indica
lo stesso punto. Allora
$ vb(r) = B_t vb(R) + vb(r_0). $

Supponendo di seguire un moto, indicandolo con $vb(r)(t)$ se visto da $S$, o con $vb(R)(t)$ se
visto da $S'$, allora

#set math.equation(numbering: "(1)")

$ vb(dot(r)) = dot(B) vb(R) + B vb(dot(R)) + vb(dot(r)_0). $ <general_dot_r>

#set math.equation(numbering: none)

Si esaminano alcuni casi particolari:

- *Moto traslatorio di $S'$ rispetto a $S$:*
La @general_dot_r diventa
$ vb(v) = vb(v') + vb(v_0) $
dove $vb(v)$ è la _velocità assoluta_ di $vb(r)$, nel sistema di riferimento $S$,
mentre $vb(v')$ è la _velocità relativa_, con $vb(v_0)$ velocità del sistema $S'$ (rispetto
a $S$).
 
- *$S'$ non traslato rispetto a $S$, con origine coincidente:*
Si ha quindi $vb(dot(R)) = 0$ e $vb(r_0) =0$. Si scrive in questo caso la
@general_dot_r:
$ vb(dot(r)) = dot(B) vb(R) $

#theorem[
  in ogni istante $t$ si può trovare un vettore $vb(omega)=vb(omega)(t)$ tale che, $forall vb(r)(t)$ dal
  sistema $S$, vale
  $ vb(dot(r)) = vb(omega cprod vb(r)). $
]
#exercise[
  dimostrare che $vb(omega)$ è univocamente determinato.
]
 
Un $vb(omega)$ come nel teorema appena enunciato si denota come _velocità angolare_ (istantanea),
mentre la $vb(dot(r))$, nel caso che si sta considerando, è detta _velocità di trascinamento_.
 
#corollary[
  se il sistema $S'$ ruota attorno all'origine $O'$ fisso in $S$, allora in ogni
  istante $t$, esiste un asse istantaneo di rotazione passante per $O'$ i cui
  punti hanno velocità nulla. Per tutti gli altri punti la velocità è
  proporzionale alla distanza da $O'$ e perpendicolare a tale asse.
]
 
La dimostrazione del corollario è immediata considerando un terzo sistema $S''$,
con origine $O'$, e fermo rispetto a $S$.
 
#dim(
  "del teorema",
)[
  $ vb(dot(r)) = dot(B) vb(R) = dot(B) B^TT vb(r). $
   
  Si afferma che $A = dot(B) B^TT$ è una matrice antisimmetrica ($A^TT = -A$).
  Infatti, $B B^TT = bb(1)$,
  $ ==> dot(B)B^TT + B dot(B)^TT = 0 ==> A+A^T = 0. $
   
  Si afferma inoltre che c'è una corrispondenza biunivoca (lineare) fra le matrici
  antisimmetriche $3 times 3$ e i vettori $omega in RR^3$, tale che, indicando con $A$ una
  generica matrice siffatta,
  $ forall vb(r) in RR^3, space.quad A vb(r) = vb(omega) times vb(r). $
  Intuitivamente, infatti, $A$ ha solo tre gradi di libertà, avendo gli elementi
  diagonali nulli:
  $ A = mat(
    0, -omega_z, omega_y;omega_z, 0, -omega_x;-omega_y, omega_x, 0;delim: "["
  ) $
  Allora è evidente verificare, svolgendo il prodotto $A vb(r)$, che equivalente
  al prodotto vettoriale $vb(omega) cprod vb(r)$.
   
  Si definisce $vb(omega)(t)$ come il vettore associato alla matrice
  antisimmetrica $dot(B)(t)B^TT (t)$,
  $ ==> vb(dot(r)) = vb(omega)(t) cprod vb(r)(t). $
]
 
- *$S'$ non traslato rispetto a $S$ e punto mobile in $S'$:*
Si ha che $vb(r_0)=0$. La @general_dot_r si riscrive come 
$ vb(dot(r)) = dot(B) vb(R) + B vb(dot(R)) = vb(omega) cprod vb(r) + vb(v'). $
$vb(omega)$ è detta _velocità angolare di trascinamento_, e $vb(v')$ è la _velocità relativa_.

- *Caso generale:*

Dato che $vb(r) = B vb(R) + vb(r_0)$,
$ vb(dot(r)) = dot(B) vb(R) + B vb(dot(R)) + vb(dot(r)_0) = dot(B)B^TT (vb(r)-vb(r_0)) + B vb(dot(R)) + vb(dot(r)_0) = vb(omega) cprod (vb(r)-vb(r_0)) + vb(v')+ vb(v_0). $
$vb(omega)$ è sempre la velocità angolare di trascinamento, $vb(v')$ la velocità
relativa, e $vb(v_0)$ è detta _velocità traslazionale di trascinamento_. $vb(v) = vb(dot(r))$ è
detta _velocità assoluta_.

Vale il _teorema di Mozzi_, che è un corollario alla formula appena scritta.
#theorem(
  "di Mozzi",
)[
  il moto istantaneo ("atto di moto") più generale per un sistema mobile $S'$,
  rispetto a $S$, è un moto elicoidale, cioè una rotazione attorno a un asse
  (detto _asse di Mozzi_) composto con una traslazione attorno a quell'asse.
]
#dim[
  studiare il moto di $S'$ (rispetto a $S$) equivale a studiare il moto di almeno
  tre punti non allineati fermi in $S'$. Si considera quindi un punto generico $vb(R)$ con $vb(dot(R)) = 0$.
  Vista da $S$, la velocità di quel punto è
  $ vb(v) = vb(v_0) + vb(omega) cprod (vb(r)-vb(r_0)). $
  Si scompone $vb(v_0)$ in una componente parallela e in una ortogonale rispetto a $vb(omega)$:
  $ vb(v_0) = vb(v_parallel) + vb(v_perp). $
  Si può esprimere $vb(v_perp)$ come $vb(omega) cprod vb(r_1)$ (imponendo che $vb(r_1) perp vb(omega)$,
  allora $vb(r_1)$ è univocamente determinato), e $vb(r_1)$ deve avere le
  dimensioni fisiche di una lunghezza. Si riscrive $vb(v)$ come
  $ vb(v) = vb(v_parallel) + vb(omega) cprod (vb(r) - (vb(r_0) - vb(r_1))). $
]

== Formulazione newtoniana della dinamica relativa

Si assumerà sempre che $S$ sia inerziale. Per un punto materiale di massa $m$ e
posizione $vb(r)$,
$ m vb(diaer(r)) = vb(f)(vb(r), vb(dot(r)), t). $
Si indica con $vb(Omega) = B^TT vb(omega)$ la velocità angolare vista da $S'$.

#theorem[
  l'equazione del moto nel sistema $S'$ è
  $ m vb(diaer(R)) = vb(F) + vb(F_I) + vb(F_"ir") + vb(F_"ce") + vb(F_"co") $
  dove 
  $ vb(F)(vb(R), vb(dot(R)), t) = B^TT vb(f)(vb(r), vb(dot(r)), t) = B^TT vb(f)(B vb(R), dot(B) vb(R) + B vb(dot(R)) + vb(dot(r)_0), t), $
  $ vb(F_I) = -m B vb(diaer(r)_0) $
  che è detta _forza di inerzia_,
  $ vb(F_"ir") = -m vb(dot(Omega)) cprod vb(R) $
  che è detta _forza inerziale di rotazione_,
  $ vb(F_"ce") = -m vb(Omega) cprod (vb(Omega) cprod vb(R)) $
  che è detta _forza centrifuga_,
  $ vb(F_"co") = -2 m vb(Omega) cprod vb(dot(R)) $
  che è detta _forza di Coriolis_.
]

$vb(F_I), vb(F_"ir"), vb(F_"ce")$ sono anche dette forze di _trascinamento_,
dato che un punto fermo rispetto a $S'$ è sottoposto ad esse.

Si noti che la forza centrifuga è sempre diretta nella direzione di massimo
allontanamento dall'"asse istantaneo" di rotazione, a distanza $rho$, e il suo
modulo è $norm(vb(Omega))^2 rho$.

Si antepone alla dimostrazione del teorema il seguente lemma.

#lemma[
  per ogni grandezza vettoriale espressa da $vb(X)$ in $S'$, vale
  $ dot(B) vb(X) = B(vb(Omega) cprod vb(X)). $
]
#dim[
  sia $vb(x)$ l'espressione in $S$ della grandezza vettoriale in questione, quindi $vb(x) = B vb(X)$. 
  $ ==> dot(B) vb(X) = dot(B) B^TT vb(x) = vb(omega) cprod vb(x) = B vb(Omega) cprod B vb(X) = B(vb(Omega cprod vb(X))). $
  Vale infatti la proprietà associativa per il prototto vettoriale per $B$,
  essendo una matrice di rotazione.
]

Si noti che una posizone non è una grandezza fisica vettoriale, dato che non
solo covaria con le rotazioni, ma viene anche traslata. Solo l'origine è una
grandezza vettoriale. Le differenze tra posizioni, così come lo spostamento
rispetto ad un punto dato, sono invece grandezze vettoriali. Questo lemma non
vale quindi, in generale, per le posizioni. Applicandolo ad $vb(R)$, allora il
suo corrispondente in $S$ non è $vb(r)$ ma $vb(r)-vb(r_0)$.

#dim(
  "del teorema",
)[
  si applica il lemma appena enunciato:
  $ vb(dot(r)) = dot(B) vb(R) + B vb(dot(R)) + vb(dot(r)_0) = B(vb(Omega) cprod vb(R) + vb(R) ) + vb(dot(r)_0) $
  $ ==> vb(diaer(r)) &= vb(diaer(r)_0) + dot(B)(vb(dot(R)) + vb(Omega) cprod vb(R)) + B(vb(diaer(R)) + vb(dot(Omega)) cprod vb(R) + vb(Omega) cprod vb(dot(R))) \
                   &= vb(diaer(r)_0) + B(vb(Omega) cprod vb(dot(R)) + vb(Omega) cprod (vb(Omega) cprod vb(R))) + vb(diaer(R)) + vb(dot(Omega)) cprod vb(R) + vb(Omega) cprod vb(dot(R)) \
                   &= vb(diaer(r)_0) + B(vb(diaer(R)) + vb(dot(Omega)) cprod vb(R) + vb(Omega) cprod (vb(Omega) cprod vb(R)) + 2 vb(Omega) cprod vb(dot(R))). $
   
  Moltiplicando per $m B^TT$,
  $ m B^TT vb(diaer(r)) = m B^TT vb(diaer(r)_0) + m vb(diaer(R)) + m vb(Omega) cprod vb(R) + m vb(Omega) cprod (vb(Omega) cprod vb(R)) + 2 m vb(Omega) cprod vb(dot(R)) $
  $ ==> m vb(diaer(R)) = vb(F) + vb(F_I) + vb(F_"ir") + vb(F_"ce") + vb(F_"co"). $
]

== Formulazione lagrangiana della dinamica relativa

#lemma[
  se $L,L'$ sono due lagrangiane nelle stesse variabili $(vb(q), vb(dot(q)), t)$ tali
  che, se calcolate su una qualsiasi legge oraria $vb(q)(t)$ danno 
  $ L(vb(q)(t), vb(dot(q))(t),t) = L'(vb(q)(t), vb(dot(q))(t), t) + dv(, t) f(vb(q)(t),t) $
  per una certa funzione $f(vb(q),t)$, allora le equazioni di Eulero-Lagrange per $L$ e $L'$ sono
  equivalenti.
]

Si è già dimostrato questo lemma in passato.

#theorem[
  una $L(vb(r), vb(dot(r)),t) = m/2 norm(vb(dot(r)))^2 - U(vb(r), vb(dot(r)),t)$ nel
  sistema $S$ si riscrive come 
  $ L = scriptL + dv(, t)(m vb(dot(r)_0) dprod B vb(R)) $
  nel sistema $S'$, dove
  $ scriptL(vb(R), vb(dot(R)), t) = m/2 norm(vb(dot(R)))^2 - scriptU(vb(R), vb(dot(R)), t) - scriptU_"tr" (vb(R), vb(dot(R)),t) - scriptU_"co" (vb(R), vb(dot(R)),t) $
  dove 
  $ scriptU(vb(R), vb(dot(R)), t) = U(B vb(R) + vb(r_0), dot(B) vb(R) + B vb(dot(R)) + vb(dot(r)_0), t), $
  $ scriptU_"tr" (vb(R), vb(dot(R)),t) = + m vb(diaer(r)_0) dprod B vb(R) - m/2 norm(vb(dot(r)_0))^2 - m/2 norm(dot(B) vb(R))^2, $
  $ scriptU_"co" (vb(R), vb(dot(R)),t) = -m B vb(dot(R)) dprod dot(B) vb(R). $
]

Gli ultimi due potenziali sono detti di _trascinamento_ e di _Coriolis_.

Si noti che, volendo, si potrebbe riscrivere $dot(B) vb(R) = vb(omega) cprod B vb(R)$.

#dim[
  dalle espressioni di $L$ e $scriptL$, si deve dimostrare che
  $ m/2 norm(vb(dot(r)))^2 = m/2 (norm(vb(dot(R)))^2 - 2 vb(diaer(r)_0) dprod B vb(R) + norm(vb(dot(r)_0))^2 + norm(dot(B) vb(R))^2 + 2 B vb(dot(R)) dprod dot(B) vb(R) + 2 dv(, t) (vb(dot(r)_0) dprod B vb(R))). $
   
  Quest'equazione è equivalente a, svolgendo la derivata, 
  $ norm(vb(dot(r)))^2 = norm(vb(dot(R)))^2 + norm(vb(dot(r)_0))^2 + norm(dot(B) vb(R))^2 + 2 B vb(dot(R)) dprod dot(B) vb(R) + 2 vb(dot(r)_0) dprod (dot(B) vb(R) + B vb(dot(R))). $
   
  Ma, dalle espressioni di $vb(r)$ e $vb(dot(r))$, elevando tutto al quadrato si
  ottiene
  $ norm(vb(dot(r)))^2 = norm(dot(B) vb(R))^2 + norm(B vb(dot(R)))^2 + norm(vb(dot(r)_0))^2 + 2 dot(B) vb(R) dprod B vb(dot(R)) + 2 dot(B) vb(R) dprod vb(dot(r)_0) + 2 B vb(dot(R)) dprod vb(dot(r)_0) $
  dove $norm(B vb(dot(R)))^2 = norm(vb(dot(R)))^2$, essendo $B$ una rotazione.
]

#exercise[
  ricavare la formulazione newtoniana delle equazioni del moto in $S'$ a partire
  dalla formulazione lagrangiana; ovviamente nel caso di forze date da
  $ vb(f) = dv(, t) grad_vb(dot(r)) U - grad_vb(r) U. $
]