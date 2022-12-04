public class Parametros {
    private String nombre, email, saldo, oferta;

	// Setters
    public void setNombre(String nombre) {
		// Capitaliza el nombre
        this.nombre = nombre.substring(0,1).toUpperCase()+nombre.substring(1);
    }
    public void setEmail(String email) { this.email = email; }
    public void setOferta(String oferta) { this.oferta = oferta; }
    public void setSaldo(String saldo) { this.saldo = saldo; }

	// Getters
    public String getNombre(){ return this.nombre; }
    public String getEmail(){ return this.email; }
    public String getSaldo(){ return this.saldo; }
    public String getOferta(){ return this.oferta; }
	
    @Override
    public String toString(){ return nombre + " - " + email + " - " + saldo + " - " + oferta; }
}
