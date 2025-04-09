package entidad;

public class Provincias {

	private int idProvincias;
	private String nombreProvincia;
	
	public Provincias() {}

	public Provincias(int idProvincias, String nombreProvincia) {
		super();
		this.idProvincias = idProvincias;
		this.nombreProvincia = nombreProvincia;
	}

	public int getIdProvincias() {
		return idProvincias;
	}

	public void setIdProvincias(int idProvincias) {
		this.idProvincias = idProvincias;
	}

	public String getNombreProvincia() {
		return nombreProvincia;
	}

	public void setNombreProvincia(String nombreProvincia) {
		this.nombreProvincia = nombreProvincia;
	}

	@Override
	public String toString() {
		return "Provincias [idProvincias=" + idProvincias + ", nombreProvincia=" + nombreProvincia + "]";
	}
	
	
}
