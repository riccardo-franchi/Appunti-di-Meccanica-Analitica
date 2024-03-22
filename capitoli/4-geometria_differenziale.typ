#import "../setup.typ": *

#show: thmrules

= Cenni di geometria differenziale

Si considera $M subset.eq RR^N$ (che può essere ad esempio di dimensione
inferiore).

#def[
  dato $A subset.eq M$ si dice aperto/chiuso in $M$ (tecnicamente si dice "nella
  topologia di $M$") se si può scrivere come
  $ A = B sect M $
  con $B$ aperto/chiuso di $RR^N$.
]

Si immagina ora che $M$ abbia dimensione $d <= N$ (si noti che non si è ancora
data una definizione formale di dimensione).

#def[
  una _carta_ per $M$ è un omeomorfismo (funzione continua invertibile con inversa
  continua) $phi: U -> V$ fra un aperto di $RR^d$ e un aperto nella topologia di $M$.

  L'argomento di $phi$ è detto _coordinata locale_ per $M$.
]

// "Più passa il tempo più scrivo le mie note lunghe, anche se continuo a dire che le farò più brevi. Ho usato una pletora di verbi"

Una carta spesso si indica $(U,phi)$, mettendo in evidenza anche il suo dominio.

#def[
  due carte $phi_i: U_i -> V_i$, con $U_i$ e $V_i$ rispettivamente aperti di $RR^d$ e $M$,
  sono dette _compatibili_ se
  + $ V = V_1 sect V_2 != emptyset $
  + $ phi^(-1)_2 compose phi_(1 | phi_1^(-1)(V)) : phi^(-1)_1 (V) -> phi_2^(-1)(V) $ è
    un diffeomorfismo (funzione differenziabile invertibile con inversa
    differenziabile).
]

Una funzione del tipo $phi^(-1)_2 compose phi_(1 | phi_1^(-1)(V))$ è un cambio
di coordinate. Se due carte sono compatibili, si deve necessariamente avere che $U_1$ e $U_2$ sono
sottoinsiemi dello stesso spazio $RR^d$, dato che il cambio di coordinate è una
funzione invertibile.

#def[
  un _atlante_ per $M$ è una collezione di carte ${(U_alpha, phi_alpha)}$, che
  devono essere a due a due compatibili se $V_alpha sect V_beta != emptyset$, tali
  che
  $ union.big_alpha phi(U_alpha) = union.big_alpha V_alpha = M. $
]

Similmente a un atlante geografico, un atlante in geometria è un insieme di
carte che mappa completamente $M$.

#def[
  una _varietà differenziabile_ (immersa in $RR^n$) è un $M subset.eq RR^N$ che
  possiede un atlante.
]

Data una circonferenza, non è possibile trovare un unica carta (un insieme
aperto e un omeomorfismo) che mappino l'intera sfera: si potrebbe parametrizzare
una circonferenza unitaria $S'$ con
$ vb(r) : [0,2 pi) -> S' $
$ phi |-> (cos phi, sin phi) $
Questa $vb(r)$ non è però un omeomorfismo, in quanto l'inversa non è continua in $(1,0)$,
oltre al fatto che il dominio non è un aperto di $RR$.

Analogamente, anche una sfera non può essere mappata con un'unica carta,
nonostante potrebbe sembrare che lo si possa fare mediante i due angoli delle
coordinate sferiche. Prendendo
$ vb(r)(phi, theta) = (sin theta cos phi, sin theta sin phi, cos theta) $
con $(phi, theta) in (0,2pi) times (0,pi)$, si riesce a mappare quasi tutta la
sfera, escludendo il meridiano corrispondente a $phi = 0$. Tuttavia, è possibile
utilizzare due carte per mappare interamente una sfera, come si può vedere
tramite due proiezioni stereografiche: un piano $pi_1$ è tangente al polo nord
della sfera. Si può far vedere che esso può mappare tutti i punti eccetto il
polo sud. Considerando allora un piano $pi_2$, esso mappa ogni punto eccetto il
polo nord.

Si noti che non si è mai usato, nelle precedenti definizioni, che $M$ è
sottoinsieme di $RR^N$. La geometria differenziale infatti ha valenza molto
astratta, purché le definizioni valgano su un sottoinsieme dotato di una
topologia (abbia definizioni di aperti e chiusi).

Si considera un rettangolo in $RR^2$ in cui si impone che i punti sul lato
superiore coincidono con quelli sul lato inferiore, e analogamente i punti sul
lato sinistro coincidono con i punti sul lato destro. Questo insieme può essere
visualizzato in $RR^3$ come un toro. Si vuole sapere se si tratta di una varietà
differenziale. Si deve quindi trovare un atlante, ossia una collezione di carte
che mappano tutta la superficie del rettangolo.

== Vettori e spazi tangenti

Senza definire formalmente il significato di vettore tangente ad una varietà
differenziale $M$, si utilizzerà l'idea intuitiva di vettore tangente.

#def[
  lo _spazio tangente_ a $M subset.eq RR^N$ in $vb(r)$ è definito come
  $ T_vb(r) M = {vb(v) in RR^N : vb(v) "è tangente a" M "in" vb(r)} $
]

Si suppone, per adesso, che ogni carta $phi: U subset.eq RR^d ->V subset.eq M subset.eq RR^N$ sia
differenziabile. Inoltre, si suppone che il differenziale $D phi_vb(q)$, che è
un'applicazione lineare da $RR^d$ a $RR^N$, abbia rango massimo, uguale a $d$ (perché $d<=N$).
Quindi $D phi_vb(q)$ è biettiva. Intuitivamente, si può dire che l'immagine del
differenziale della carta è lo spazio tangente. Allora i vettori dello spazio
tangente $T_phi(vb(q)) M$ sono tutti e soli i vettori del tipo $D phi_vb(q) (vb(u))$,
con $vb(u) in RR^d$, dato che il differenziale è un'applicazione lineare
biettiva. Quindi il differenziale indicizza tutti gli elementi di $T_vb(r) M$.
Questa relazione, in fisica si scrive spesso come
$ dd(vb(r)) = [pdv(vb(r), vb(q))(vb(q))] dd(vb(q)). $

Se si usa un'altra carta $phi': U'->V'$, con $vb(r) in V'$, la mappatura data
sopra cambia e diventa
$ D phi'_vb(q') (vb(u')) = vb(v) $
con $vb(q') = (phi')^(-1)(vb(r))$.

Nota: se $vb(u)$, $vb(u')$ sono due maniere diverse di indicizzare lo stesso
vettore $vb(v) in T_vb(r) M$ (date rispettivamente dalle carte $phi$ e $phi'$)
allora valgono
$ vb(q') = (phi')^(-1)(vb(r)) = ((phi')^(-1) compose phi)(vb(q)) $
$ vb(u') = D((phi')^(-1) compose phi)_vb(q) (vb(u)). $

#def[
  si definisce _fibrato tangente_
  $ T M = {(vb(r), vb(v)) in RR^N times RR^N : vb(r) in M, vb(v) in T_vb(r) M} $
]

// "Fa molto figo dire fibrato, alle feste se lo dite avete due reazioni, o pensano di voi qualcosa che finisce in ...ato, oppure fate colpo (se chi avete davanti è un matematico)"

#prop[
  il fibrato tangente di una varietà differenziale $M$ con atlante ${(U_alpha, phi_alpha)}$ di
  dimensione $d$ è una varietà differenziale con atlante ${(tilde(U)_alpha, tilde(phi)_alpha)}$,
  dove
  - $tilde(U)_alpha = U_alpha times RR^d$
  - $ tilde(phi)_alpha : tilde(U)_alpha &-> tilde(V)_alpha = {(vb(r), vb(v)) in RR^N times RR^N : vb(r) in V_alpha, vb(v) in T_vb(r) M} \ (vb(q), vb(u)) &|-> (phi_alpha (vb(q)), (D phi_alpha) (vb(u))) $
]

Evidentemente, al variare di $vb(q)$ e $vb(u)$, $tilde(phi)_alpha (vb(q), vb(u)) = (phi_alpha (vb(q)), (D phi_alpha)_vb(q) (vb(u)))$ indicizza
tutte le coppie date da un punto $vb(r)$ su $M$ e il vettore tangente a $M$ in $vb(r)$,
per $vb(r) in V_alpha$.

== Differenziale di una funzione fra varietà

Si considerano due varietà differenziabili $M subset.eq RR^m$, $N subset.eq RR^n$ di
dimensioni rispettivamente $d$ ed $e$. Si definisce una mappa $f: M->N$. Come si
può definire la differenziabilità di $f$? Si vuole cioè definire un'applicazione
lineare
$ D f_vb(r) : T_vb(r) M -> T_f(vb(r)) M. $

Più generalmente, $D f: T M -> T N$.

#def[
  $f$ come sopra, si dice differenziabile se, per ogni carta $(U_alpha, phi_alpha)$ di $M$, $f compose phi_alpha$ è
  una funzione differenziabile da $U_alpha subset.eq RR^d$ a $RR^n$.
]

#def[
  il differenziale di $f$ come sopra è la funzione
  $ D f : T M &-> T N \ (vb(r), vb(v)) &|-> (f(vb(r)), D(f compose phi_alpha)_(phi_alpha^(-1) (vb(r))) (vb(u))) $
  dove $vb(u)$ è l'unico vettore ($phi_alpha$ è biettiva) di $RR^d$ tale che $D(f compose phi_alpha)_(phi_alpha^(-1) (vb(r))) (vb(u)) = vb(v)$.
]

