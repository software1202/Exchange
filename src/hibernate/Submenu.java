package hibernate;

import java.util.Set;

/**
 * Submenu entity. @author MyEclipse Persistence Tools
 */
public class Submenu extends AbstractSubmenu implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Submenu() {
	}

	/** minimal constructor */
	public Submenu(String subMenuId, Menu menu, String subMenuName) {
		super(subMenuId, menu, subMenuName);
	}

	/** full constructor */
	public Submenu(String subMenuId, Menu menu, String subMenuName, Set goodses) {
		super(subMenuId, menu, subMenuName, goodses);
	}

}
