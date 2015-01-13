package hibernate;

import java.util.Set;

/**
 * Goods entity. @author MyEclipse Persistence Tools
 */
public class Goods extends AbstractGoods implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Goods() {
	}

	/** minimal constructor */
	public Goods(String goodsId, User user, Submenu submenu, String goodsName) {
		super(goodsId, user, submenu, goodsName);
	}

	/** full constructor */
	public Goods(String goodsId, User user, Submenu submenu, String goodsName,
			String brand, String newDegree, String describe, String image,
			Set goodscomplains, Set bookingsForBgoods, Set bookingsForAgoods) {
		super(goodsId, user, submenu, goodsName, brand, newDegree, describe,
				image, goodscomplains, bookingsForBgoods, bookingsForAgoods);
	}

}
