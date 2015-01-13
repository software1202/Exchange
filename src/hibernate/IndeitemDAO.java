package hibernate;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;

/**
 * A data access object (DAO) providing persistence and search support for
 * Indeitem entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see hibernate.Indeitem
 * @author MyEclipse Persistence Tools
 */
public class IndeitemDAO extends BaseHibernateDAO {
	private static final Log log = LogFactory.getLog(IndeitemDAO.class);
	// property constants
	public static final String INDEGRATION = "indegration";
	public static final String REASONS = "reasons";

	public void save(Indeitem transientInstance) {
		log.debug("saving Indeitem instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Indeitem persistentInstance) {
		log.debug("deleting Indeitem instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Indeitem findById(hibernate.IndeitemId id) {
		log.debug("getting Indeitem instance with id: " + id);
		try {
			Indeitem instance = (Indeitem) getSession().get(
					"hibernate.Indeitem", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Indeitem instance) {
		log.debug("finding Indeitem instance by example");
		try {
			List results = getSession().createCriteria("hibernate.Indeitem")
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
		log.debug("finding Indeitem instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Indeitem as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByIndegration(Object indegration) {
		return findByProperty(INDEGRATION, indegration);
	}

	public List findByReasons(Object reasons) {
		return findByProperty(REASONS, reasons);
	}

	public List findAll() {
		log.debug("finding all Indeitem instances");
		try {
			String queryString = "from Indeitem";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Indeitem merge(Indeitem detachedInstance) {
		log.debug("merging Indeitem instance");
		try {
			Indeitem result = (Indeitem) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Indeitem instance) {
		log.debug("attaching dirty Indeitem instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Indeitem instance) {
		log.debug("attaching clean Indeitem instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}