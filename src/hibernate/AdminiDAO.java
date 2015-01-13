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
 * Admini entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see hibernate.Admini
 * @author MyEclipse Persistence Tools
 */
public class AdminiDAO extends BaseHibernateDAO {
	private static final Log log = LogFactory.getLog(AdminiDAO.class);
	// property constants
	public static final String AD_NAME = "adName";
	public static final String AD_PASSWORD = "adPassword";

	public void save(Admini transientInstance) {
		log.debug("saving Admini instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Admini persistentInstance) {
		log.debug("deleting Admini instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Admini findById(java.lang.String id) {
		log.debug("getting Admini instance with id: " + id);
		try {
			Admini instance = (Admini) getSession().get("hibernate.Admini", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Admini instance) {
		log.debug("finding Admini instance by example");
		try {
			List results = getSession().createCriteria("hibernate.Admini")
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
		log.debug("finding Admini instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Admini as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByAdName(Object adName) {
		return findByProperty(AD_NAME, adName);
	}

	public List findByAdPassword(Object adPassword) {
		return findByProperty(AD_PASSWORD, adPassword);
	}

	public List findAll() {
		log.debug("finding all Admini instances");
		try {
			String queryString = "from Admini";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Admini merge(Admini detachedInstance) {
		log.debug("merging Admini instance");
		try {
			Admini result = (Admini) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Admini instance) {
		log.debug("attaching dirty Admini instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Admini instance) {
		log.debug("attaching clean Admini instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}