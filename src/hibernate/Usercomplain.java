package hibernate;

/**
 * Usercomplain entity. @author MyEclipse Persistence Tools
 */
public class Usercomplain extends AbstractUsercomplain implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public Usercomplain() {
	}

	/** full constructor */
	public Usercomplain(UsercomplainId id, Admini admini, String comReason,
			String status) {
		super(id, admini, comReason, status);
	}

}
