package hibernate;

/**
 * AbstractPaymethod entity provides the base persistence definition of the
 * Paymethod entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractPaymethod implements java.io.Serializable {

	// Fields

	private String paMeid;
	private String methods;

	// Constructors

	/** default constructor */
	public AbstractPaymethod() {
	}

	/** full constructor */
	public AbstractPaymethod(String paMeid, String methods) {
		this.paMeid = paMeid;
		this.methods = methods;
	}

	// Property accessors

	public String getPaMeid() {
		return this.paMeid;
	}

	public void setPaMeid(String paMeid) {
		this.paMeid = paMeid;
	}

	public String getMethods() {
		return this.methods;
	}

	public void setMethods(String methods) {
		this.methods = methods;
	}

}