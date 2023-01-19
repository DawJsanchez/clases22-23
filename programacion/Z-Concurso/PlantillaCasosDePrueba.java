import java.util.Scanner;
public class PlantillaCasosDePrueba {
    public static void main(String[] args) {
        // Declaración de variables
        Scanner sc = new Scanner(System.in);
        int casosDePrueba;

        // 1 - Leer número de repeticiones
        casosDePrueba = sc.nextInt();    
        while (casosDePrueba-- > 0){
/* ============================================================================
 *      2 - Bloque principal del programa a desarrollar
 * ============================================================================
 * Éste bloque es el que modificaremos de un caso a otro
 */ 
            // Declaración de variables
            int entero;
            String cadena, linea;

            // 2a - lectura de enteros
            // entero = sc.nextInt();

            // 2b - leer strings (los espacios separan diferentes lecturas)
            // cadena = sc.next();

            // 2c - leer línea (lee líneas completas hasta encontrar un \n)
            // linea = sc.nextLine();

            // 3 - calcular salida
            // Aquí determinamos el algoritmo a utilizar
            // System.out.println(salida); para imprimir resultado con salto de línea
            // System.out.print(salida); para imprimir resultado sin salto de línea. 
            //      Si la cadena "salida" incluye "\n" imprimirá saltos.
        } // while
    } // main()
} // clase
