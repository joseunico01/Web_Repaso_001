package eliminar.Bean;

public class EmpleadoBean {

	int codigo;
	String nombre;
	String apellido;
	String DNI;

	public EmpleadoBean(int codigo, String nombre, String apellido, String DNI) {
		this.codigo = codigo;
		this.nombre = nombre;
		this.apellido = apellido;
		this.DNI = DNI;
	}

	//getter
	public int getCodigo() {
		return codigo;
	}

	public String getNombre() {
		return nombre;
	}

	public String getApellido() {
		return apellido;
	}

	public String getDNI() {
		return DNI;
	}

	
	
}
