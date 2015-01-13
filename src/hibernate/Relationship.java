package hibernate;

/**
 * Relationship entity. @author MyEclipse Persistence Tools
 */
public class Relationship extends AbstractRelationship implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public Relationship() {
	}

	/** full constructor */
	public Relationship(RelationshipId id, String relaType) {
		super(id, relaType);
	}

}
