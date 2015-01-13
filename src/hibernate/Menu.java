package hibernate;

import java.util.Set;

/**
 * Menu entity. @author MyEclipse Persistence Tools
 */
public class Menu extends AbstractMenu implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Menu() {
	}

	/** minimal constructor */
	public Menu(String menuId, String menuName) {
		super(menuId, menuName);
	}

	/** full constructor */
	public Menu(String menuId, String menuName, Set submenus) {
		super(menuId, menuName, submenus);
	}

}
