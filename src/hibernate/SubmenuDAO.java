package hibernate;

import java.util.List;
import java.util.Set;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;

/**
 * A data access object (DAO) providing persistence and search support for
 * Submenu entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see hibernate.Submenu
 * @author MyEclipse Persistence Tools
 */
public class SubmenuDAO extends BaseHibernateDAO {
	private static final Log log = LogFactory.getLog(SubmenuDAO.class);
	// property constants
	public static final String SUB_MENU_NAME = "subMenuName";

	public void save(Submenu transientInstance) {
		log.debug("saving Submenu instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Submenu persistentInstance) {
		log.debug("deleting Submenu instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Submenu findById(java.lang.String id) {
		log.debug("getting Submenu instance with id: " + id);
		try {
			Submenu instance = (Submenu) getSession().get("hibernate.Submenu",
					id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Submenu instance) {
		log.debug("finding Submenu instance by example");
		try {
			List results = getSession().createCriteria("hibernate.Submenu")
					.add(Example.create(instance)).list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Submenu instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Submenu as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findBySubMenuName(Object subMenuName) {
		return findByProperty(SUB_MENU_NAME, subMenuName);
	}

	public List findAll() {
		log.debug("finding all Submenu instances");
		try {
			String queryString = "from Submenu";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Submenu merge(Submenu detachedInstance) {
		log.debug("merging Submenu instance");
		try {
			Submenu result = (Submenu) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Submenu instance) {
		log.debug("attaching dirty Submenu instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Submenu instance) {
		log.debug("attaching clean Submenu instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}