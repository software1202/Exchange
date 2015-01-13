package hibernate;

/**
 * Indeitem entity. @author MyEclipse Persistence Tools
 */
public class Indeitem extends AbstractIndeitem implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Indeitem() {
	}

	/** minimal constructor */
	public Indeitem(IndeitemId id) {
		super(id);
	}

	/** full constructor */
	public Indeitem(IndeitemId id, Integer indegration, String reasons) {
		super(id, indegration, reasons);
	}

}
