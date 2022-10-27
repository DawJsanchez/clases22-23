---
 Programación
---

# T4 PROGRAMACIÓN ORIENTADA A OBJETOS

## Presentación
En el moodle

## Ejercicios
Debes establecer los criterios más restrictivos posibles de visibilidad.

1. Tenemos una clase `Coche` que tiene las propiedades `velocidad`, `direccion`, `color` y `ruedas`. \
   La clase tiene además una serie de métodos para ver su estado y modificarlo `acelerar(int cantidad) frenar(int cantidad) girar(int angulo) parar() repintar(String color) verVelocidad() verDireccion() verColor() verNumeroDeRuedas()`, siendo ésta última una característica intrínseca de todos los `Coches`. \
   Crea una clase que se encargue de crear un un objeto de la clase `Coche`. \
   Lo acelere 100 (km/h), luego reduzca 30 para girar 30 (grados a la izquierda), luego acelere 40 más, reduzca 70, gire 45 (grados a la derecha). \
   Nos muestre la velodidad, dirección actual, color y número de ruedas y se detenga completamente. \

2. Tenemos una clase `CuentaBanco` con las propiedades `saldo`, `limiteDescubierto`, `titular`, `rentabilidad`. *[Deberás establecer tú los valores por defecto]*\
   La clase tiene los métodos `ingresar(float euros), float sacar(float euros), avisarDescubierto(float saldo), avisarSaldoInsuficiente(float saldo, float seQuiereSacar), float calcularIntereses(float saldo, float rentabilidad)` y por supuesto `verSaldo()`. \
   El método `calcularIntereses`se ejecutará cada mes y llamará al método `ìngresar` con la cantidad calculada. \
   El método `sacar` utilizará el operador ternario para sacar si hay suficiente saldo o llamar al método `avisarSaldoInsuficiente` en caso contrario. \
   Crea una clase que se encargue de:
   + Crear un objeto de la clase `CuentaBanco` con 500 de saldo, un límite de descubierto de 30, a tu nombre y con una rentabilidad del 0'1%. \
   + Crear otra con 250 a nombre de un compañero.
   + Saca 300 de tu cuenta. Ingresa lo que sacaste en la de tu compañero.
   + Fin de mes *[toca debengar intereses]*.
   + Consulta el saldo de ambas cuentas.
   + Saca 300 de tu cuenta. Ingresa lo que sacaste en la de tu compañero.
   + Fin de mes *[toca debengar intereses]*.
   + Consulta el saldo de ambas cuentas.

3. Crea una clase llamada `Libro` que guarde la información de cada uno de los libros de una biblioteca. La clase debe guardar el título del libro, autor, número de ejemplares del libro y número de ejemplares prestados. La clase contendrá los siguientes métodos:
- Constructor por defecto.
- Constructor con parámetros.
- Métodos `setters` y `getters`
- Método `prestamo` que incremente el atributo correspondiente cada vez que se realice un préstamo del libro. No se podrán prestar libros de los que no queden ejemplares disponibles para prestar. Devuelve true si se ha podido realizar la operación y false en caso contrario.
- Método `devolucion` que decremente el atributo correspondiente cuando se produzca la devolución de un libro. No se podrán devolver libros que no se hayan prestado. Devuelve true si se ha podido realizar la operación y false en caso contrario.
- Método `toString` para mostrar los datos de los libros. Este método se heredada de Object y lo debemos modificar (override) para adaptarlo a la clase Libro. \
Escribe un programa para probar el funcionamiento de la clase Libro.


## Práctica
-Pdte-

---
Fin de tema.
