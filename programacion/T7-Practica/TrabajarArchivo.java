import java.io.FileNotFoundException;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Scanner;
import java.util.StringTokenizer;

/**
 * La clase TrabajarArchivo nos ofrece una capa de abstracción para leer/escribir y procesar archivos
 * */
public class TrabajarArchivo {
    /** El método stático countLines() nos devuelve el número líneas del archivo
     * @param file File que queremos contar el número de líneas
     * @return lineas. Entero con el número de líneas del archivo pasado (incluye el encabezado)
     * */
    static int countLines(File file) { ... }

    /** El método estático leerParametros nos parsea un archivo CSV y nos lo devuelve como un objeto de la clase Parametros
     *
     * @param CSV archivo CSV con los campos String nombre, email, saldo y oferta
     * @param i lee la fila i del archvivo
     * @return Parametros. Objeto con 4 atributos String (nombre, email, saldo y oferta)
     * */
    static Parametros leerParametros(File CSV, int i){ ... }

    /**
     * El método estático leerModulos nos parsea un archivo CSV y nos lo devuelve un array con el nombre de los módulos (primer campo vacío)
     *
     * @param CSV archivo CSV con un campo vacío (o con "nombre") y un número indefinido de columnas con el nombre de cada módulo <String>
     * @return String[].
     */
    static String[] leerModulos(File CSV){ ... }

    /**
     * El método estático leerAlumno nos parsea un archivo CSV y nos lo devuelve un objeto de la clase Alumno
     *
     * @param CSV archivo CSV con los campos String nombre y un número indefinido de columnas con las notas de cada módulo <float>
     * @param i   lee la fila i del archvivo
     * @return Alumno. Objeto con 2 atributos nombre <String> y array notas <float>
     */
    static Alumno leerAlumno(File CSV, int i){ ...  }

    /** Método estático leerArchivo devuelve un String con el archivo completo
     *
     * @param file - File a leer
     * @return String con el contenido
     * */
    static String leerArchivo(File file){ ... }

    /** método stático escribeArchivo
     *
     * @param texto - String con el texto a escribir
     * @param nombreArchivo - String con el nombre del archivo
     * @return boolean si todo ok o no
     */
    static boolean escribeArchivo(String texto, String nombreArchivo){ ... }
}
