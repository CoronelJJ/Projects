package entidad;
import java.math.BigDecimal;
import java.time.LocalDate;

public class Cuenta {
	
	private int idcuenta;
	private int idcliente;
	private String tipoCuenta;
	private LocalDate fechaCreacion;
	private int CBUCuenta;
	private BigDecimal saldoCuenta;
	private char CuentaActiva;
	
	public Cuenta() {}
	

	public Cuenta(int idcuenta, int idcliente, String tipoCuenta, LocalDate fechaCreacion, int cBUCuenta,
			BigDecimal saldoCuenta, char cuentaActiva) {
		super();
		this.idcuenta = idcuenta;
		this.idcliente = idcliente;
		this.tipoCuenta = tipoCuenta;
		this.fechaCreacion = fechaCreacion;
		CBUCuenta = cBUCuenta;
		this.saldoCuenta = saldoCuenta;
		CuentaActiva = cuentaActiva;
	}



	public int getIdcuenta() {
		return idcuenta;
	}

	public void setIdcuenta(int idcuenta) {
		this.idcuenta = idcuenta;
	}

	public int getIdcliente() {
		return idcliente;
	}

	public void setIdcliente(int idcliente) {
		this.idcliente = idcliente;
	}

	public String getTipoCuenta() {
		return tipoCuenta;
	}

	public void setTipoCuenta(String tipoCuenta) {
		this.tipoCuenta = tipoCuenta;
	}

	public LocalDate getFechaCreacion() {
		return fechaCreacion;
	}

	public void setFechaCreacion(LocalDate fechaCreacion) {
		this.fechaCreacion = fechaCreacion;
	}

	public int getCBUCuenta() {
		return CBUCuenta;
	}

	public void setCBUCuenta(int cBUCuenta) {
		CBUCuenta = cBUCuenta;
	}

	public BigDecimal getSaldoCuenta() {
		return saldoCuenta;
	}

	public void setSaldoCuenta(BigDecimal saldoCuenta) {
		this.saldoCuenta = saldoCuenta;
	}

	
	
	public char getCuentaActiva() {
		return CuentaActiva;
	}


	public void setCuentaActiva(char cuentaActiva) {
		CuentaActiva = cuentaActiva;
	}


	@Override
	public String toString() {
		return "Cuenta [idcuenta=" + idcuenta + ", idcliente=" + idcliente + ", tipoCuenta=" + tipoCuenta
				+ ", fechaCreacion=" + fechaCreacion + ", CBUCuenta=" + CBUCuenta + ", saldoCuenta=" + saldoCuenta
				+ "]";
	}
	
	
	
	
	
}
