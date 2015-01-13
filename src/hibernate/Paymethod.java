package hibernate;

/**
 * Paymethod entity. @author MyEclipse Persistence Tools
 */
public class Paymethod extends AbstractPaymethod implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public Paymethod() {
	}

	/** full constructor */
	public Paymethod(String paMeid, String methods) {
		super(paMeid, methods);
	}

}
