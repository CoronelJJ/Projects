package entidad;
import java.time.LocalDate;

public class Cliente {

	private int idCliente;
	private String nombreUsuario;
	private int DNIcliente;
	private int CUILcliente;
	private String NombreCliente;
	private String ApellidoCliente;
	private char SexoCliente;
	private String NacionalidadCliente;
	private LocalDate FechaNacimientoCliente;
	private String DireccionCliente;
	private String LocalidadCliente;
	private int idProvincias;
	private String EmailCliente;
	private int TelefonoCliente;
	private char ClienteActivo;
	
	public Cliente(){}

	

	public Cliente(int idCliente, String nombreUsuario, int dNIcliente, int cUILcliente, String nombreCliente,
			String apellidoCliente, char sexoCliente, String nacionalidadCliente, LocalDate fechaNacimientoCliente,
			String direccionCliente, String localidadCliente, int idProvincias, String emailCliente,
			int telefonoCliente, char clienteActivo) {
		super();
		this.idCliente = idCliente;
		this.nombreUsuario = nombreUsuario;
		DNIcliente = dNIcliente;
		CUILcliente = cUILcliente;
		NombreCliente = nombreCliente;
		ApellidoCliente = apellidoCliente;
		SexoCliente = sexoCliente;
		NacionalidadCliente = nacionalidadCliente;
		FechaNacimientoCliente = fechaNacimientoCliente;
		DireccionCliente = direccionCliente;
		LocalidadCliente = localidadCliente;
		this.idProvincias = idProvincias;
		EmailCliente = emailCliente;
		TelefonoCliente = telefonoCliente;
		ClienteActivo = clienteActivo;
	}



	public int getIdCliente() {
		return idCliente;
	}

	public void setIdCliente(int idCliente) {
		this.idCliente = idCliente;
	}

	public String getNombreUsuario() {
		return nombreUsuario;
	}

	public void setNombreUsuario(String nombreUsuario) {
		this.nombreUsuario = nombreUsuario;
	}

	public int getDNIcliente() {
		return DNIcliente;
	}

	public void setDNIcliente(int dNIcliente) {
		DNIcliente = dNIcliente;
	}

	public int getCUILcliente() {
		return CUILcliente;
	}

	public void setCUILcliente(int cUILcliente) {
		CUILcliente = cUILcliente;
	}

	public String getNombreCliente() {
		return NombreCliente;
	}

	public void setNombreCliente(String nombreCliente) {
		NombreCliente = nombreCliente;
	}

	public String getApellidoCliente() {
		return ApellidoCliente;
	}

	public void setApellidoCliente(String apellidoCliente) {
		ApellidoCliente = apellidoCliente;
	}

	public char getSexoCliente() {
		return SexoCliente;
	}

	public void setSexoCliente(char sexoCliente) {
		SexoCliente = sexoCliente;
	}

	public String getNacionalidadCliente() {
		return NacionalidadCliente;
	}

	public void setNacionalidadCliente(String nacionalidadCliente) {
		NacionalidadCliente = nacionalidadCliente;
	}

	public LocalDate getFechaNacimientoCliente() {
		return FechaNacimientoCliente;
	}

	public void setFechaNacimientoCliente(LocalDate fechaNacimientoCliente) {
		FechaNacimientoCliente = fechaNacimientoCliente;
	}

	public String getDireccionCliente() {
		return DireccionCliente;
	}

	public void setDireccionCliente(String direccionCliente) {
		DireccionCliente = direccionCliente;
	}

	public String getLocalidadCliente() {
		return LocalidadCliente;
	}

	public void setLocalidadCliente(String localidadCliente) {
		LocalidadCliente = localidadCliente;
	}

	public int getIdProvincias() {
		return idProvincias;
	}

	public void setIdProvincias(int idProvincias) {
		this.idProvincias = idProvincias;
	}

	public String getEmailCliente() {
		return EmailCliente;
	}

	public void setEmailCliente(String emailCliente) {
		EmailCliente = emailCliente;
	}

	public int getTelefonoCliente() {
		return TelefonoCliente;
	}

	public void setTelefonoCliente(int telefonoCliente) {
		TelefonoCliente = telefonoCliente;
	}
	

	public char getClienteActivo() {
		return ClienteActivo;
	}



	public void setClienteActivo(char clienteActivo) {
		ClienteActivo = clienteActivo;
	}



	@Override
	public String toString() {
		return "Cliente [idCliente=" + idCliente + ", nombreUsuario=" + nombreUsuario + ", DNIcliente=" + DNIcliente
				+ ", CUILcliente=" + CUILcliente + ", NombreCliente=" + NombreCliente + ", ApellidoCliente="
				+ ApellidoCliente + ", SexoCliente=" + SexoCliente + ", NacionalidadCliente=" + NacionalidadCliente
				+ ", FechaNacimientoCliente=" + FechaNacimientoCliente + ", DireccionCliente=" + DireccionCliente
				+ ", LocalidadCliente=" + LocalidadCliente + ", idProvincias=" + idProvincias + ", EmailCliente="
				+ EmailCliente + ", TelefonoCliente=" + TelefonoCliente + "]";
	}
	
	
	
	
}
