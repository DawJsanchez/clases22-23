/*******************************************************************************
 * Respuesta del examen
 *******************************************************************************
 *
 * @author	Luis Ferreira
 * @version 1.0
 */

import java.util.*;  // para usar Scanner

public class ExamenT3 {

	/*--------------------------------------------------------------------------
	 * Método principal o de entrada
	 *--------------------------------------------------------------------------
	 *
	 * @param args que son de tipo String y que esperamos recibir uno y sólo uno
	 */
	public static void main(String[] args){
		int operando1, operando2, division;
		int mayor, menor;
		Scanner lector;

		// 1. Imprimir el primer argumento recibido
		System.out.println( "Hola, soy " + args[0] );

		// 2. Imprimir el nombre de usuario del sistema
		System.out.println( "Hola, soy " + System.getProperty("user.name") );

		// 3. Capturar 2 enteros solicitados al usuario
		lector = new Scanner(System.in);

		System.out.println( "Introduce un ENTERO:" );
		operando1 = lector.nextInt();

		System.out.println( "Introduce otro ENTERO:" );
		//operando2 = Integer.parseInt(lector.next());
		//System.out.println( "El segundo op:" + operando2 );
		operando2 = Integer.valueOf(lector.next());
		System.out.println( "El segundo op:" + operando2 );

		// 4. Resto de la división
		System.out.println( "Resto: " + operando1 % operando2 );

		// 5. División entera
		// En este caso debemos utilizar el operador condicional
		division = ( operando1 > operando2 )? operando1/operando2 : operando2/operando1 ;
		System.out.println( "La división es:" + division );

		// 5b. Más elegante
		mayor = ( operando1 > operando2 )? operando1 : operando2 ;
		menor = ( operando1 <= operando2 )? operando1 : operando2 ;
		System.out.println( "La división de " + mayor + " entre " + menor + " es = " + mayor/menor );

		// 6. Paso de variables de entorno
		// Se debe invocar la clase desde la CLI con `java -Dturbo=valor ExamenT3 nombre`
		System.out.println( "La variable de entorno turbo vale=" + System.getProperty( "turbo" ) );
	}
}
