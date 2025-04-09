package entidad;

import java.math.BigDecimal;
import java.time.LocalDate;

public class Movimiento {

	private int idMovimiento;
	private int idcuenta;
	private String tipoMovimiento;
	private LocalDate fechaMovimiento;
	private String detalleMovimiento;
	private BigDecimal importeMovimiento;
	private int destinatario;
	
	public Movimiento() {}

	public Movimiento(int idMovimiento, int idcuenta, String tipoMovimiento, LocalDate fechaMovimiento,
			String detalleMovimiento, BigDecimal importeMovimiento, int destinatario) {
		super();
		this.idMovimiento = idMovimiento;
		this.idcuenta = idcuenta;
		this.tipoMovimiento = tipoMovimiento;
		this.fechaMovimiento = fechaMovimiento;
		this.detalleMovimiento = detalleMovimiento;
		this.importeMovimiento = importeMovimiento;
		this.destinatario = destinatario;
	}

	public int getIdMovimiento() {
		return idMovimiento;
	}

	public void setIdMovimiento(int idMovimiento) {
		this.idMovimiento = idMovimiento;
	}

	public int getIdcuenta() {
		return idcuenta;
	}

	public void setIdcuenta(int idcuenta) {
		this.idcuenta = idcuenta;
	}

	public String getTipoMovimiento() {
		return tipoMovimiento;
	}

	public void setTipoMovimiento(String tipoMovimiento) {
		this.tipoMovimiento = tipoMovimiento;
	}

	public LocalDate getFechaMovimiento() {
		return fechaMovimiento;
	}

	public void setFechaMovimiento(LocalDate fechaMovimiento) {
		this.fechaMovimiento = fechaMovimiento;
	}

	public String getDetalleMovimiento() {
		return detalleMovimiento;
	}

	public void setDetalleMovimiento(String detalleMovimiento) {
		this.detalleMovimiento = detalleMovimiento;
	}

	public BigDecimal getImporteMovimiento() {
		return importeMovimiento;
	}

	public void setImporteMovimiento(BigDecimal importeMovimiento) {
		this.importeMovimiento = importeMovimiento;
	}

	public int getDestinatario() {
		return destinatario;
	}

	public void setDestinatario(int destinatario) {
		this.destinatario = destinatario;
	}

	@Override
	public String toString() {
		return "Movimiento [idMovimiento=" + idMovimiento + ", idcuenta=" + idcuenta + ", tipoMovimiento="
				+ tipoMovimiento + ", fechaMovimiento=" + fechaMovimiento + ", detalleMovimiento=" + detalleMovimiento
				+ ", importeMovimiento=" + importeMovimiento + ", destinatario=" + destinatario + "]";
	}
	
	
	
}
