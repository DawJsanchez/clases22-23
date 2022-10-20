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

## Práctica
-Pdte-

---
Fin de tema.
