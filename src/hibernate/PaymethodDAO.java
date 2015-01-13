package hibernate;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;

/**
 * A data access object (DAO) providing persistence and search support for
 * Paymethod entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see hibernate.Paymethod
 * @author MyEclipse Persistence Tools
 */
public class PaymethodDAO extends BaseHibernateDAO {
	private static final Log log = LogFactory.getLog(PaymethodDAO.class);
	// property constants
	public static final String METHODS = "methods";

	public void save(Paymethod transientInstance) {
		log.debug("saving Paymethod instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Paymethod persistentInstance) {
		log.debug("deleting Paymethod instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Paymethod findById(java.lang.String id) {
		log.debug("getting Paymethod instance with id: " + id);
		try {
			Paymethod instance = (Paymethod) getSession().get(
					"hibernate.Paymethod", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Paymethod instance) {
		log.debug("finding Paymethod instance by example");
		try {
			List results = getSession().createCriteria("hibernate.Paymethod")
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
		log.debug("finding Paymethod instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Paymethod as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByMethods(Object methods) {
		return findByProperty(METHODS, methods);
	}

	public List findAll() {
		log.debug("finding all Paymethod instances");
		try {
			String queryString = "from Paymethod";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Paymethod merge(Paymethod detachedInstance) {
		log.debug("merging Paymethod instance");
		try {
			Paymethod result = (Paymethod) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Paymethod instance) {
		log.debug("attaching dirty Paymethod instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Paymethod instance) {
		log.debug("attaching clean Paymethod instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}