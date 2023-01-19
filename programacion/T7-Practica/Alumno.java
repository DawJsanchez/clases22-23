public class Alumno {
    private String nombre;
    private float[] notas;

    Alumno(String nombre, float[] notas){
        this.nombre = nombre;
        this.notas = notas;
    }

    public String getNombre(){ return this.nombre; }
    public float[] getNotas(){ return this.notas; }
    public float getNota(int i){ return this.notas[i];}
    @Override
    public String toString(){
        final int LONG_NOMBRE = 10;
        String msg = "";
        String nom = "";

        if (nombre.length() > LONG_NOMBRE) nom = nombre.substring(0,LONG_NOMBRE);
        else {
            int n = LONG_NOMBRE - nombre.length();
            nom = nombre;
            while (n-->0){
                if ( n%2 == 0) nom = " " + nom;
                else nom += " ";
            }
        }

        msg = "| "+ nom + " | ";
        for (float m: notas) {
            msg += m + " | ";
        }
        return msg;
    }
}
