#import "../setup.typ": *

#show: thmrules

= Piccole oscillazioni

#lemma[
  l'equazione differenziale $diaer(x) + lambda x = 0$, per $x in RR$, ha come
  soluzione, se $lambda < 0$,
  $ x(t) = c_1 cos(omega t)+c_2 sin (omega t) $
  dove $omega = sqrt(-lambda)>0$.
]
#dim[
  è sufficiente mostrare che la soluzione al problema di Cauchy
  $ cases(diaer(x) = -omega^2 x, x(t_0) = x_0, dot(x)(t_0) = v_0) $
  è $x(t) = x_0 cos(omega(t-t_0))+v_0/omega sin(omega(t-t_0))$, cosa che può
  essere verificata manualmente. Usando poi le formule di addizione e sottrazione
  di seno e coseno e rinonimando i coefficienti numerici si arriva all'espressione
  cercata. L'unicità della solzione del problema di Cauchy dimostra che tutte le
  soluzioni sono in quella forma.
]

Si assume di limitarsi a sistemi lagrangiani con $T = 1/2 dot(vb(q)) dprod A(vb(q)) dot(vb(q))$ e $U=U(vb(q))$ in $C^2$,
e con $A(vb(q))$ continua (in fisica, basterebbe dire di essere in condizioni "sufficientemente
regolari").

#def[
  $vb(q_e)$ è un punto di equilibrio per un sistema lagrangiano come sopra se
  $ grad_vb(q) U(vb(q_e)) = 0. $
]

Infatti in questo caso si verifica immediatamente che $vb(q)(t) = vb(q_e)$ è una
soluzione delle equazioni di Eulero-Lagrange.

#def[
  $vb(q_e)$ si dice _stabile_ se $forall V$ intorno (aperto) di $vb(q_e)$, $exists V'$ intorno
  (aperto) di $vb(q_e)$ e $exists epsilon>0$ tale che, presa una condizione
  iniziale $vb(q_0) in V'$, $norm(dot(vb(q_0)))<epsilon$, allora l'orbita
  corrispondente $vb(q)(t) in V, forall t in RR$.
]

È evidente da considerazioni di meccanica che se $vb(q_e)$ è un punto di minimo
locale di $U$, esso è un punto di equilibrio stabile. Si tratta comunque di una
conseguenza della costanza dell'hamiltoniana lungo le orbite.

In questi casi (in cui si hanno piccole perturbazioni di condizioni iniziali di
quiete), in un qualche senso che non viene mostrato,
$ T approx 1/2 dot(vb(q)) dprod A dot(vb(q)) $
con $A = A(vb(q_e))$,
$ U approx U(vb(q_e)) + 1/2 (vb(q)-vb(q_e)) dprod H U(vb(q_e))(vb(q)-vb(q_e)) $
dato che il gradiente del potenziale in $vb(q_e)$ è nullo. Nei calcoli si
assumerà, senza perdita di generalità, che la costante additiva $U(vb(q_e))$ sia
nulla.

Si fanno due assunzioni matematiche:
+ $A$ è simmetrica e definita positiva (assunzione praticamente sempre vera per
  sistemi fisici);
+ $B := H U(vb(q_e))$ è simmetrica e definita positiva.

Ha sempre senso assumere che la matrice associata $A$ a una forma quadratica sia
simmetrica. Se infatti non la fosse, si mostra facilmente che è equivalente a
prendere come matrice associata la parte simmetrica di $A$:
$ A_s = (A + A^TT)/2 $
in quanto la parte antisimmetrica si annulla nel calcolo della forma quadratica
per un generico vettore.

Invece di $L$, si studia il sistema con
$ L_"quadratica" (vb(Q), vb(dot(Q))) = 1/2 dot(vb(Q)) dprod A dot(vb(Q)) - 1/2 vb(Q) dprod B vb(Q) $
con $vb(Q) = vb(q) - vb(q_e)$ ($=> dot(vb(Q)) = dot(vb(q))$).

Si scrivono le equazioni di Eulero-Lagrange per $L=L_"quadratica"$:
$ grad_dot(vb(Q)) L = A dot(vb(Q)) ==> dv(, t) grad_dot(vb(Q)) = A diaer(vb(Q)) $
$ grad_vb(Q) L = -B vb(Q) $

#set math.equation(numbering: "(1)")

$ ==> A diaer(vb(Q)) + B vb(Q) = 0. $ <small_oscillations>

#set math.equation(numbering: none)

#theorem[
  la soluzione generale di @small_oscillations, con le ipotesi date su $A$ e $B$,
  è
  $ vb(Q)(t) = sum_(i=1)^d vb(m_i) s_lambda_i (t) := sum_(i=1)^d vb(m_i) (c_(i 1) cos(sqrt(lambda) t) + c_(i 2) sin(sqrt(lambda) t)) $
  dove $lambda_i>0$ e $vb(m_i) in RR^d$, per $i in {1,...,d}$, sono gli autovalori
  con corrisondenti autovettori di $B$ rispetto ad $A$, ossia
  $ B vb(m_i) = lambda_i A vb(m_i), space.quad vb(m_i) != 0. $
]

Tali autovettori sono le soluzioni dell'equazione caratteristica (in $lambda$)
$ det(B-lambda A) = 0 $
e sono $d$ (contando la molteplicità algebrica). Gli autovettori $vb(m_i)$ sono
linearmente indipendenti: si è quindi nel caso di molteplicità geometrica sempre
uguale alla molteplicità algebrica. Inoltre:
+ se $A = II$, allora gli $vb(m_i)$ sono ortogonali fra loro;
+ se la molteplicità di $lambda_i$ è $1$ allora $vb(m_i)$ è univocamente
  determinato a meno di un fattore moltiplicativo.

Si utilizza la seguente terminologia: i vettori $vb(m_i)$ (e talvolta anche le
funzioni vettoriali $vb(m_i) s_lambda_i (t)$) sono detti _modi normali_ delle
piccole oscillazioni intorno a $vb(q_e)$. Lo scalare $omega_i = sqrt(lambda_i)$ è
detta _frequenza_ (o talvolta _pulsazione_) del corrispondente modo normale.

Il fatto che gli autovettori di $B$ rispetto ad $A$ siano dati dall'equazione
caratteristica è immediato dalla definizione di autovettore:
$ exists vb(v) !=0 : (B-lambda A)vb(v) = 0 <=> B-lambda A "non invertibile" <=> det(B-lambda A)=0. $
Anche il punto 2 è immediato, una volta che è noto che la molteplicità algebrica
e geometrica di $lambda_i$ è $1$. Ciò significa per definizione che lo spazio
lineare dei suoi autovettori è $1$-dimensionale, e quindi tutti gli autovettori
di uno stesso autovalore sono multipli a due a due.

== Funzioni di matrici diagonalizzabili

se $g(x) = c_0+c_1 x +...+c_m x^m$ e $A$ è una matrice $n times n$, è sensato
definire $g(A)$ come la seguente matrice $n times n$:
$ g(A) = c_0 II_n + c_1 A +...+c_m A^m. $
Si vorrebbe dare una definizione di $g(A)$ anche per funzioni $g(x)$ più
complicate di un polinomio. Si potrebbe pensare di usare lo sviluppo in serie di
Taylor, ma questo è in generale definito solo nell'intorno di un certo $x_0$.
Inoltre, se si definisce una matrice come serie infinita di matrici, bisogna
specificare che cosa significa quel limite. Tuttavia, se $A$ è una matrice
diagonalizzabile (di gran lunga la maggioranza nello spazio $RR^(d times d)$ di
tutte le matrici $d times d$), esiste una definizione allo stesso tempo semplice
ed efficace.

Sia data $g : D subset.eq RR -> RR$. Si specifica, innanzitutto, che cosa
significa $g(Lambda)$ quando $Lambda$ è una matrice diagonale.

#def[
  se $Lambda$ è una matrice diagonale con elementi diagonali (ovvero autovalori) $lambda_i in D, forall i in {1,...,d}$,
  allora si definisce 
  $ g(Lambda) = dmat(g(lambda_i), g(lambda_2), dots.down, g(lambda_d), delim: "["). $
]

#def[
  se $A$ è una matrice diagonalizzabile con $Lambda = C^(-1) A C$ la sua
  diagonalizzata (e quindi $A = C Lambda C^(-1)$), e se tutti gli autovalori $lambda_i$ di $A$ (ovvero
  tutti gli elementi diagonali di $Lambda$) appartengono a $D$, allora si
  definisce
  $ g(A) = C g(Lambda) C^(-1). $
]

Si noti che se la relazione fra $A$ e $Lambda$ è $Lambda = C^(-1) A C$, allora $C$ è
quella che si chiama matrice _cambio di base_, definita come
$ C = mat(vec(vb(v_1)), ..., vec(vb(v_n));delim: "[") $
con $A vb(v_i) = lambda_i vb(v_i), vb(v_i != 0)$, ovvero, l'$i$-esima colonna di $C$ è
un autovettore di $A$ relativo a $lambda_i$. Lo si può verificare velocemente:
infatti,$forall i$, indicando con $vu(e_i)$ l'$i$-esimo vettore della base
canonica di $RR^d$,
$ C vu(e_i) = vb(v_i) $
$ ==> A C vu(e_i) = A vb(v_i) = lambda_i vb(v_i) $
$ ==> C^(-1) A C vu(e_i) = lambda_i C^(-1) vb(v_i) = lambda_i vu(e_i) $
da cui discende che $C^(-1) A C$ è la matrice diagonale con elemsenti diagonali $lambda_i$,
nell'ordine.

La funzione $g$ definita sulle matrici diagonalizzabili ha proprietà algebriche
simili alla $g$ definita sui reali.

#example[
  se $alpha, beta in RR$ e $A$ ha solo autovalori positivi,
  $ A^alpha A^beta = C Lambda^alpha C^(-1) C Lambda^beta C^(-1) = C Lambda^alpha Lambda^beta C^(-1) = C Lambda^(alpha+beta) C^(-1) = A^(alpha + beta). $
]

#example[
  Per ogni $A$ diagonalizzabile,
  $ cos^2 A + sin^2 A = C cos^2 (Lambda) C^(-1) + C sin^2 (Lambda) C^(-1) = C II C^(-1) = II. $
]


#dim(
  "del teorema precedente",
)[
  si considera una matrice $A >0$ diagonalizzabile. Dato che $A$ è definita
  positiva, tutti i suoi autovalori sono positivi, dunque
  $ exists A^(1/2) : A^(1/2)A^(1/2)=A. $
  Nota: siccome $A$ è simmetrica, si può applicare il teorema spettrale, e dunque $exists R_A$ matrice
  ortogonale (in fisica le matrici ortogonali sono spesso chiamate semplicemente
  rotazioni) tale che
  $ Lambda_A = R_A^(-1) A R_A = R_A^TT A R_A. $
  Allora, si riscrive la @small_oscillations:
  $ A diaer(vb(Q)) = - B vb(Q) <==> A^(1/2) diaer(vb(Q)) = -A^(-1/2) B A^(-1/2) A^(1/2) vb(Q). $
  Adoperando il cambio di variabile
  $ vb(x) = A^(1/2) vb(Q) $
  (la funzione lineare che lega $vb(x)$ a $vb(Q)$ è biettiva perché $det A^1/2 >0$)
  e chiamando $M = A^(-1/2) B A^(-1/2)$,
  $ A diaer(vb(Q)) = - B vb(Q) <==> diaer(vb(x)) = M vb(x). $
   
  Si afferma che $M$ è definita positiva. Infatti:
  + è simmetrica perché $M^TT = (A^(-1/2))^TT B^TT (A^(-1/2))^TT$, ma $(A^(-1/2))^TT = (R_A Lambda_A^(-1/2) R_A^TT)^TT = R_A (Lambda_A^(-1/2))^TT R_A^TT = A^(-1/2)$.
    Quindi $M^TT = A^(-1/2)B A^(-1/2)=M$.
  + $forall vb(v) != 0, vb(v) dprod M vb(v) = vb(v) dprod A^(-1/2) B A^(-1/2) vb(v) = (A^(-1/2))^TT vb(v) dprod B(A^(-1/2) vb(v)) = vb(w) dprod B vb(w)$.
    $vb(w) != 0$ perché $A^(-1/2)$ è non singolare.
   
  Quindi, $exists R$ matrice ortogonale tale che
  $ M = R Lambda R^TT, $
  con tutti autovalori strettamente positivi.
   
  Si fa un altro cambio di variabile:
  $ vb(y) = R^TT vb(x) = R^(-1) vb(x) $
  Allora il punto 2 si riscrive come
  $ R^(-1) diaer(vb(x)) = -Lambda R^(-1) vb(x) <==> diaer(vb(y)) = -Lambda vb(y). $
  $ <==> diaer(y_i) = - lambda_i y_i space.quad forall i in {1,...,d} $
  La cui soluzione generale è $y_i (t) = s_lambda_i (t)$. 
   
  In termini vettoriali, la soluzione generale è 
  $ vb(y)(t) = sum_(i=1)^d vu(e_i) s_lambda_i (t). $
  In $vb(x)$ è 
  $ vb(x) (t) = R vb(y) (t) = sum_(i=1)^d R vu(e_i) s_lambda_i (t), $
  e dunque nelle $vb(Q)$ è 
  $ vb(Q) (t) = A^(-1/2) vb(x)(t) = sum_(i=1)^d A^(-1/2) R vu(e_i) s_lambda_i (t) = sum_(i=1)^d vb(m_i) s_lambda_i (t). $
  Infine,
  $ B vb(m_i) = B A^(-1/2) R vu(e_i) = - A^(1/2) A^(-1/2) B A^(-1/2) R vu(e_i) = A^(1/2) M R vu(e_i). $
   
  Si osserva che $Lambda vu(e_i) = lambda_i vu(e_i)$
  $ ==> M(R vu(e_i)) = R Lambda R^TT R vu(e_i) = lambda_i R vu(e_i). $
   
  Dunque
  $ B vb(m_i) = A^(1/2) lambda_i R vu(e_i) = lambda_i A A^(-1/2) R vu(e_i) = lambda_i A 
  vb(m_i) $
   
  Gli ${vu(e_i)}$ sono una base ortonormale, per cui anche gli ${R vu(e_i)}$ lo
  sono. Dato che $A^(-1/2)$ è una matrice non singolare, anche i ${vb(m_i) = A^(-1/2) R vu(e_i)}$ sono
  una base.
]

#example(
  "Pendoli accoppiati",
)[
  si considerano due pendoli di massa uguale, attaccati nello stesso punto,
  accoppiati l'uno all'altro tramite una molla di costante $k$.
   
  Si chiamano $q_1$ e $q_2$ rispettivamente gli angoli che il primo e il secondo
  pendolo formano con la verticale ($q_i in (- pi, pi]$), e si pongono le masse e
  la lunghezza del pendolo uguali a $1$.
   
  Fissato un sistema di riferimento con l'asse $y$ verso il basso,
  $ U= U_g (vb(r_1), vb(r_2)) + U_k (vb(r_1), vb(r_2)) = -g y_1 - g y_2 + k/2 norm(vb(r_1)-vb(r_2))^2 $
   
  Scrivendo $vb(r_1)$ e $vb(r_2)$ in funzione delle coordinate $q_1, q_2$,
  $ vb(r_i) = (sin q_i, cos q_i) $
  $ ==> U(q_1,q_2) = -g cos q_1 - g cos q_2 + k/2((sin q_1 - sin q_2)^2 + (cos q_1 - cos q_2)^2) $
  $ ==> U(q_1, q_2) = -g(cos q_1 +cos q_2) + k(1-cos(q_1-q_2)) $
   
  Per quanto riguarda l'energia cinetica,
  $ T(dot(vb(r))_1, dot(vb(r))_2) = 1/2 (norm(vb(dot(q)_2))^2 + norm(vb(dot(q)_2))^2) $
  $ vb(dot(r)_i) = (cos q_i, -sin q_i) dot(q_i) ==> norm(vb(dot(r)_i))^2 = dot(q_i)^2 $
  $ ==> T(dot(q)_1, dot(q)_2) = 1/2 (dot(q)_1 + dot(q)_2). $
   
  Si vogliono trovare tutti i punti di equilibrio, determinare se sono stabili, e
  per i punti di equilibrio stabile, studiare le piccole oscillazioni.
   
  $ grad U(vb(q)) = 0 <==> pdv(U(vb(q)), q_1) + pdv(U(vb(q)), q_2) =0 $
  $ pdv(U(vb(q)), q_1) = g sin q_1 + k sin(q_1-q_2) $
  $ pdv(U(vb(q)), q_2) = g sin q_2 - k sin(q_1-q_2). $
   
   
  Punti di equilibrio immediati:
  + $q_1=q_2 = 0$
  + $q_1 = q_2 = pi$
  + $q_1 = 0, q_2= pi$ e viceversa
   
  Supponendo momentaneamente $sin q_i != 0$ e omettendo i calcoli,
  $ 1 = -pdv(U_g, q_i)/pdv(U_k, q_i) $
  $ ==> tan q_2 = tan q_2 <==> q_1 = q_2 plus.minus pi. $
   
  Si trova poi, assumendo di avere una simmetria del tipo $q_2 = -q_1$,
  $ cot q_1 = -g/(2 k sin q_1) <==> cos q_1 = -g/(2k) <==> q_1 plus.minus arccos(-g/(2k)) $
   
  Si può giustificare fisicamente che non ci sono altri punti di equilibrio,
  considerando le forze che agiscono sui due punti.
   
  Il primo punto di equilibrio è l'unico punto stabile, dato che corrisponde ad un
  punto di minimo globale del potenziale, come si può notare osservando la sua
  espressione. Allora, si trovano le piccole oscillazioni per $vb(q) = (0,0)$:
  $ T = 1/2 (dot(q)_1^2 + dot(q)_2^2) ==> A(vb(q)) = II. $
  $ U(vb(q)) &= -g (1-q_1^2/2 - q_2^2/2 + o(q_1^2)+o(q_2^2)) \ 
           &+ k/2((q_1-q_2 + o(q_1^2)+o(q_2^2))^2 + (q_1^2/2 - q_2^2/2 + o(q_1)+ o(q_2))^2) \
           &tilde.eq -g/2 (q_1^2 + q_2^2) + k/2 (q_1-q_2)^2 = U_"quadratica" (vb(q)). $
  $ ==> U_"quadratica" (vb(q)) = (q_1^2+ q_2^2)/2 (g+k) + q_1 q_2 k $
  E, se $U_"quadratica" = 1/2 vb(q) dprod B vb(q)$,
  $ B = mat(g+k, -k;-k, g+k;delim: "["). $
  Occorre quindi trovare gli autovalori di $B$ rispetto ad $A$, cioè gli
  autovalori di $B$, essendo $A=II$. Si trovano gli autovalori $lambda_1 = g$, $lambda_2 = g + 2k$
  Considerando $lambda_1$, gli autovettori sono multipli di $vb(m_1) = (1,1)$, e
  dunque gli autovettori relativi a $lambda_2$ sono multipli di $vb(m_2) = (-1, 1)$.
  Si hanno quindi oscillazioni rispettivamente in fase e in antifase, con
  frequenze date da $omega_i = sqrt(lambda_i)$.
]

