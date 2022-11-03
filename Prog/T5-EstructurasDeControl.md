---
 Programación
---

# T5 ESTRUCTURAS DE CONTOL

Duración: 18 horas.

## Condicionales
+ IF Simple:
```
if (*condicion*) {
	*sentencias si verdadero*
	...
}
```
+ IF-ELSE:
```
if (*condicion*) {
	*sentencias si verdadero*
	...
} else {
	*sentencias si falso*
	...
}
```
+ Anidación de condicionales con IF-ELSE IF:
```
if (*condicion*) {
	*sentencias si verdadero*
	...
} else if (*condicion2*) {
	*sentencias si condicion2*
	...
} else {
	*sentencias si falso*
	...
}
```

+ Condicionales múltiples con SWITCH-CASE:
```
switch (*expresion*) {
	case *valor1*:
		*sentencias si valor1*
		...
		break;
	case *valor2*:
		*sentencias si valor2*
		...
		break;
	[default:
		*sentencias en otro caso*
		...
		break;]
}
```
*Nota: si omitimos los `break` se ejecutarán las siguientes sentencias.*
*Nota 2: realmente los `case` son con `expresiones` pero se ha simplificado por motivos púramente didácticos.*

### Ejercicios
1.  Realiza un programa que reciba dos números por teclado e indique cuál es mayor o si son iguales.
2.  Realiza un programa que pida un número por teclado y nos indique si es par o impar.
3.  Crea un programa que pida al usuario dos números y muestre el resultado de su división. Si el segundo número es 0, debe mostrar un mensaje de error.
4.  Realiza un programa que lea una cadena por teclado y compruebe si es una letra mayúscula.
5.  Realiza un programa que calcule la potencia de un número, dado este y su exponente. Pueden ocurrir tres casos:
    + El exponente sea positivo: imprime resultado en pantalla.
    + El exponente sea 0, el resultado es 1.
    + El exponente sea negativo, el resultado es 1/potencia con el exponente positivo.
6. Realiza un programa que calcule la aceptación de una solicitud en base a los siguientes parámetros: edad, nota y sexo.
    + Mínimo: Nota (5), edad (18), sexo M -> POSIBLE
    + Mínimo: Nota (5), edad (18), sexo F -> ACEPTADA
    + Otros casos -> NO ACEPTADA
7. Realiza un programa que pida los puntos centrales de dos circunferencias (x1, y1), (x2, y2) y los radios de las mismas (r1, r2). El programa debe clasificar según corresponda como: exteriores, tangentes exteriores, secantes, tangentes interiores, interiores o concéntricas.
8. Realiza un programa que clasifique un triángulo tras recibir el tamaño de sus lados. Se debe clasificar como triángulo rectángulo, isósceles, equilátero o escaleno.
9. Escribe un programa que reciba un año y nos diga si es bisiesto o no.
10. La asociación de vinicultores tiene como política fijar un precio inicial al kilo de uva, la cual se clasifica en tipos (A y B), y además en tamaños (1 y 2). Cuando se realiza la venta del producto, ésta es de un sólo tipo y tamaño, se requiere determinar cuanto recibirá un productor por la uva que entrega en un embarque considerando lo siguiente:
    + Si es de tipo A, se le cargan 20 céntimos al precio inicial cuando es de tamaño 1 y 30 céntimos si es de tamaño 2.
    + Si es de tipo B, se rebajan 30 céntimos cuando es de tamaño 1, y 50 céntimos cuando es de tamaño 2.
11. El director de una escuela está organizando un viaje de estudios y requiere determinar cuánto debe cobrar a cada alumno y cuánto debe pagar a la compañía de viajes por el servicio. La forma de cobrar es la siguiente:
    + Si son 100 alumnos o más, el costo por cada alumno es de 65 euros.
    + De 50 a 99 alumnos, el costo es de 70 euros.
    + De 30 a 49 alumnos, el costo es de 95 euros.
    + Menos de 30 alumnos, el costo de la renta del autobús es de 4000 euros, sin importar el número de alumnos.
12. Realiza un algoritmo que permita determinar el pago a la compañía de autobuses y lo que debe pagar cada alumno por el viaje.
13. La política de cobro de una compañía telefónica es: \
    Cuando se realiza una llamada, el cobro es por el tiempo que esta dura, de tal forma que los primeros cinco minutos cuestan 1 euro, los siguientes tres, 80 céntimos, los siguientes dos minutos a 70 céntimos y a partir del décimo minuto, 50 céntimos. \
    Además, se carga un impuesto de 3% cuando es domingo, y si es otro día, en turno de mañana 15% y en turno de tarde 10%. \
    Realiza un algoritmo para determinar cuánto debe pagar por cada concepto una persona que realiza una llamada.
14. Realiza un programa que pida por teclado el resultado (dato entero) obtenido al lanzar un dado de seis caras y muestre por pantalla el número en letras (dato cadena) de la cara opuesta al resultado obtenido. \
    Nota 1: En las caras opuestas de un dado de seis caras están los números: 1-6, 2-5 y 3-4. \
    Nota 2: Si el número del dado introducido es menor que 1 o mayor que 6, se mostrará el mensaje: “ERROR: número incorrecto”. \
15. Realiza un programa que pida el día de la semana (del 1 al 7) y escriba el día correspondiente. Si introducimos otro número nos da un error.
16. Realiza un programa que pida un número entero entre uno y doce e imprima el número de días que tiene el mes correspondiente.

## BUCLES
+ Bucles WHILE (repetimos mientras):
```
while (*condicion*) {
	*sentencias a ejecutar mientras que se cumpla la condición*
	...
}
```
+ Salidas anticipadas:
	+ `break`: interrumpe completamente el bucle.
    +  `continue`: interrumpe sólo la iteración actual, pasando verificar la condición de la siguiente.
+ Bucles DO-WHILE (hacer al menos una vez):
```
do {
	*sentencias a ejecutar mientras que se cumpla la condición*
	...
} while (*condicion*)
```
+ Bucles FOR:
```
for (*înicialización*; *condición*;*incremento*){
	*sentencias a ejecutar mientras que se cumpla la condición*
	...
}
```
+ Bucles anidados:
Ejemplo de tablas de multiplicar:
```
int multiplicando, multiplicador;
for (multiplicando=0;multiplicando<10;multiplicando++){
			System.out.println("Tabla del "+multiplicando);
	for(multipliador=0;multiplicador<10;multiplicador++){
		System.out.println("\t"+multiplicando+" x "+multiplicador+" = "+multiplicando*multiplicador);
	}
}
```

## ACEPTA EL RETO
+ [Cuanta los minutos - 148](https://www.aceptaelreto.com/problem/statement.php?id=148&cat=5)
+ [¿Qué lado de la calle?](https://www.aceptaelreto.com/problem/statement.php?id=217&cat=5)

## Práctica
-Pdte-

---
Fin de tema.
