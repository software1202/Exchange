package hibernate;

/**
 * AbstractIndeitem entity provides the base persistence definition of the
 * Indeitem entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractIndeitem implements java.io.Serializable {

	// Fields

	private IndeitemId id;
	private Integer indegration;
	private String reasons;

	// Constructors

	/** default constructor */
	public AbstractIndeitem() {
	}

	/** minimal constructor */
	public AbstractIndeitem(IndeitemId id) {
		this.id = id;
	}

	/** full constructor */
	public AbstractIndeitem(IndeitemId id, Integer indegration, String reasons) {
		this.id = id;
		this.indegration = indegration;
		this.reasons = reasons;
	}

	// Property accessors

	public IndeitemId getId() {
		return this.id;
	}

	public void setId(IndeitemId id) {
		this.id = id;
	}

	public Integer getIndegration() {
		return this.indegration;
	}

	public void setIndegration(Integer indegration) {
		this.indegration = indegration;
	}

	public String getReasons() {
		return this.reasons;
	}

	public void setReasons(String reasons) {
		this.reasons = reasons;
	}

}