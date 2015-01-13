package hibernate;

/**
 * RelationshipId entity. @author MyEclipse Persistence Tools
 */
public class RelationshipId extends AbstractRelationshipId implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public RelationshipId() {
	}

	/** full constructor */
	public RelationshipId(User user, User user_1) {
		super(user, user_1);
	}

}
