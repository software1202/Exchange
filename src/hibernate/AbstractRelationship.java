package hibernate;

/**
 * AbstractRelationship entity provides the base persistence definition of the
 * Relationship entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractRelationship implements java.io.Serializable {

	// Fields

	private RelationshipId id;
	private String relaType;

	// Constructors

	/** default constructor */
	public AbstractRelationship() {
	}

	/** full constructor */
	public AbstractRelationship(RelationshipId id, String relaType) {
		this.id = id;
		this.relaType = relaType;
	}

	// Property accessors

	public RelationshipId getId() {
		return this.id;
	}

	public void setId(RelationshipId id) {
		this.id = id;
	}

	public String getRelaType() {
		return this.relaType;
	}

	public void setRelaType(String relaType) {
		this.relaType = relaType;
	}

}