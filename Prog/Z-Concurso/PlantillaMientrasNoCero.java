import java.util.Scanner;
public class PlantillaMientrasNoCero{
    public static void main(String[] args) {
        // Declaración de variables
        Scanner sc = new Scanner(System.in);
        int numeroDeAlgo;

        do { // repetir hasta leer 0
            // 1- Declaración de variables
            // int puntuacionIzq=0, puntuacionDcha=0;
            // boolean direccionDcha = true;

            // 2 - Leer número de Algos 
            numeroDeAlgo = sc.nextInt();

            if (numeroDeAlgo != 0) {
                // 3 - evaluar los Algos
                for(int i=0; i<numeroDeAlgo; i++){
                    // Iteramos los Algos
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
                    
                    // Si la salida es por cada algo:
                    // System.out.println(salida); para imprimir resultado con salto de línea
                    // System.out.print(salida); para imprimir resultado sin salto de línea. 
                    //      Si la cadena "salida" incluye "\n" imprimirá saltos.
                } // for
                
                // Si la salida es global por repetición:
                // System.out.println(salida); para imprimir resultado con salto de línea
                // System.out.print(salida); para imprimir resultado sin salto de línea. 
                //      Si la cadena "salida" incluye "\n" imprimirá saltos.
            } // if (numeroDeAlgo != 0)

        } while (numeroDeAlgo!= 0);
    } // main()
} // clase
