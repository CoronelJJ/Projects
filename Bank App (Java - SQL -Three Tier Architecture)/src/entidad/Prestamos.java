package entidad;

import java.math.BigDecimal;
import java.time.LocalDate;

public class Prestamos {

	private int idPrestamo;
	private int idcuenta;
	private int idcliente;
	private LocalDate fechaPrestamo;
	private BigDecimal importeAPagar;
	private BigDecimal importeSolicitado;
	private int PlazoEnCuotas;
	private BigDecimal montoPorCuota;
	private char autorizado;
	
	public Prestamos() {}

	public Prestamos(int idPrestamo, int idcuenta, int idcliente, LocalDate fechaPrestamo, BigDecimal importeAPagar,
			BigDecimal importeSolicitado, int plazoEnCuotas, BigDecimal montoPorCuota, char autorizado) {
		super();
		this.idPrestamo = idPrestamo;
		this.idcuenta = idcuenta;
		this.idcliente = idcliente;
		this.fechaPrestamo = fechaPrestamo;
		this.importeAPagar = importeAPagar;
		this.importeSolicitado = importeSolicitado;
		PlazoEnCuotas = plazoEnCuotas;
		this.montoPorCuota = montoPorCuota;
		this.autorizado = autorizado;
	}

	public int getIdPrestamo() {
		return idPrestamo;
	}

	public void setIdPrestamo(int idPrestamo) {
		this.idPrestamo = idPrestamo;
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

	public LocalDate getFechaPrestamo() {
		return fechaPrestamo;
	}

	public void setFechaPrestamo(LocalDate fechaPrestamo) {
		this.fechaPrestamo = fechaPrestamo;
	}

	public BigDecimal getImporteAPagar() {
		return importeAPagar;
	}

	public void setImporteAPagar(BigDecimal importeAPagar) {
		this.importeAPagar = importeAPagar;
	}

	public BigDecimal getImporteSolicitado() {
		return importeSolicitado;
	}

	public void setImporteSolicitado(BigDecimal importeSolicitado) {
		this.importeSolicitado = importeSolicitado;
	}

	public int getPlazoEnCuotas() {
		return PlazoEnCuotas;
	}

	public void setPlazoEnCuotas(int plazoEnCuotas) {
		PlazoEnCuotas = plazoEnCuotas;
	}

	public BigDecimal getMontoPorCuota() {
		return montoPorCuota;
	}

	public void setMontoPorCuota(BigDecimal montoPorCuota) {
		this.montoPorCuota = montoPorCuota;
	}

	public char getAutorizado() {
		return autorizado;
	}

	public void setAutorizado(char autorizado) {
		this.autorizado = autorizado;
	}

	@Override
	public String toString() {
		return "Prestamos [idPrestamo=" + idPrestamo + ", idcuenta=" + idcuenta + ", idcliente=" + idcliente
				+ ", fechaPrestamo=" + fechaPrestamo + ", importeAPagar=" + importeAPagar + ", importeSolicitado="
				+ importeSolicitado + ", PlazoEnCuotas=" + PlazoEnCuotas + ", montoPorCuota=" + montoPorCuota
				+ ", autorizado=" + autorizado + "]";
	}
	
	
}
