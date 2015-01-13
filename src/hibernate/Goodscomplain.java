package hibernate;

/**
 * Goodscomplain entity. @author MyEclipse Persistence Tools
 */
public class Goodscomplain extends AbstractGoodscomplain implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public Goodscomplain() {
	}

	/** minimal constructor */
	public Goodscomplain(GoodscomplainId id) {
		super(id);
	}

	/** full constructor */
	public Goodscomplain(GoodscomplainId id, Admini admini, String comReason,
			String status) {
		super(id, admini, comReason, status);
	}

}
