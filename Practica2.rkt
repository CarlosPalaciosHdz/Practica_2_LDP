#lang plai
;; Ejercicio 1
;; Función que recibe n, r y devuelve el conjunto con los primeros r múltiplos de n.
;; multiplos: number number -> (listof number)
(define (multiplos n r)
(for/list ((i r)) (* n (+ i 1)))
)

;; Ejercicio 2
;; Predicado que nos dice si un número m es divisor de otro número n.
;; Si el parámetro recibido es cero, se devuelve un error.
;; divisor?: number number -> number
(define (divisor? m n)
      (if (= m 0)
      (error "el cero no es divisor de nadie")
          (if (= (modulo r m) 0)
             #t
             #f)
        )
     )

;; Ejercicio 3
;; Función que nos da el una lista de divisores de un número pasado como parámetro
;; divisores: number -> (listof number)
(define (divisores n)
    (if (= n 0)
    (error "El cero no tiene divisores")
    (filter (lambda (x) (divisor? x n)) (for/list ((i n)) (+ i 1)))
    )

   )

;; Ejercicio 4
;; Función que recibe un elemento e, una lista l y decide si a pertenece a l.
;; pertenece: e (listof e) -> boolean
 (define (pertenece? e l)
      (if (equal? l empty)
      #f
            (if (= (car l) e)
            #t
            (pertenece? e (cdr l))
            )
      )
 )
     

;; Ejercicio 5
;; Función que recibe una lista l con elementos. Devuelve una lista sin repeticiones con los elementos de l.
;; eliminaRep: (listof a) -> (listof a)
;;(define (eliminaRepetidos lista)...)

;; Estructura que nos permite modelar puntos en el plano.
;; Sirve para modelar figuras geométricas.
(struct Punto (x y) #:inspector #f)

;; Ejercicio 6
;; Funcion que nos permite calcular el punto equidistante entre dos puntos.
;; Si alguno de los dos parámetros recibidos no es un punto, lanza un error
;; punto-medio: Punto Punto -> Punto
(define (punto-medio p q) 
      (if (and (Punto? p) (Punto? q))
            (let ([x1 (Punto-x p)]
                  [x2 (Punto-x q)]
                  [y1 (Punto-y p)]
                  [y2 (Punto-y q)])
               (Punto (/ (+ x1 x2) 2) (/ (+ y1 y2) 2))   
            )
         (error "Uno de los parametros no es de tipo punto")
      )
)

;; Ejercicio 7
;; Funcion que nos permite calcular la distancia entre dos puntos.
;; Si alguno de los dos parámetros recibidos no es un punto, lanza un error
;; distancia: Punto Punto -> number
(define (distancia p q)
      (if (and (Punto? p) (Punto? q))
            (let ([x1 (Punto-x p)]
                  [x2 (Punto-x q)]
                  [y1 (Punto-y p)]
                  [y2 (Punto-y q)])
               (sqrt (+ (expt (- x2 x1) 2) (expt (- y2 y1) 2)))   
            )
         (error "Uno de los parametros no es de tipo punto")
      )
)

;; Ejercicio 8
;; Definición del tipo abstracto de datos Figura
(define-type Figura
  [Circulo (centro Punto?) (radios number?)]
  [Triangulo (lado1 Punto?) (lado2 Punto?) (lado3 Punto?)]
  [Cuadrado (esquinaSizq Punto?) (largo number?)]
  [Rectangulo (esquinaSizq Punto?) (longBase number?) (longAltura number?)]
  )

;; Ejercicio 9
;; Función que recibe una figura y calcula su perímetro.
;; perimetro: Figura -> number
(define (perimetro d)
  (if (Figura? d)
  (type-case Figura d
    [Circulo (c r) (* 2 pi r)]
    [Triangulo (l1 l2 l3) (+ (distancia l1 l3) (distancia l3 l2) (distancia l2 l1) )]
  [Cuadrado (e lar)(* 4 lar)]
  [Rectangulo (e b a) (+ b a)]


      )
(error "El parametro no es de tipo Figura"))
 )


;; Ejercicio 10
;; Función que recibe una figura y calcula su área.
;; area: Figura -> number
;;(define (area fig) ...)

;; Punto extra
;; Función que nos da el elemento más repetido en una lista. 
;; Si hay dos o más elementos repetidos el mismo número de veces, devuelve el primero en aparecer de izquierda a derecha.
;; masRepetido (listof a) -> number
;(define (masRepetido lista)


