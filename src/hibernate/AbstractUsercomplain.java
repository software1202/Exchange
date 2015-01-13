package hibernate;

/**
 * AbstractUsercomplain entity provides the base persistence definition of the
 * Usercomplain entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractUsercomplain implements java.io.Serializable {

	// Fields

	private UsercomplainId id;
	private Admini admini;
	private String comReason;
	private String status;

	// Constructors

	/** default constructor */
	public AbstractUsercomplain() {
	}

	/** full constructor */
	public AbstractUsercomplain(UsercomplainId id, Admini admini,
			String comReason, String status) {
		this.id = id;
		this.admini = admini;
		this.comReason = comReason;
		this.status = status;
	}

	// Property accessors

	public UsercomplainId getId() {
		return this.id;
	}

	public void setId(UsercomplainId id) {
		this.id = id;
	}

	public Admini getAdmini() {
		return this.admini;
	}

	public void setAdmini(Admini admini) {
		this.admini = admini;
	}

	public String getComReason() {
		return this.comReason;
	}

	public void setComReason(String comReason) {
		this.comReason = comReason;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}