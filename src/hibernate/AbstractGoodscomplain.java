package hibernate;

/**
 * AbstractGoodscomplain entity provides the base persistence definition of the
 * Goodscomplain entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractGoodscomplain implements java.io.Serializable {

	// Fields

	private GoodscomplainId id;
	private Admini admini;
	private String comReason;
	private String status;

	// Constructors

	/** default constructor */
	public AbstractGoodscomplain() {
	}

	/** minimal constructor */
	public AbstractGoodscomplain(GoodscomplainId id) {
		this.id = id;
	}

	/** full constructor */
	public AbstractGoodscomplain(GoodscomplainId id, Admini admini,
			String comReason, String status) {
		this.id = id;
		this.admini = admini;
		this.comReason = comReason;
		this.status = status;
	}

	// Property accessors

	public GoodscomplainId getId() {
		return this.id;
	}

	public void setId(GoodscomplainId id) {
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