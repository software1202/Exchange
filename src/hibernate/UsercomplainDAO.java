package hibernate;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;

/**
 * A data access object (DAO) providing persistence and search support for
 * Usercomplain entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see hibernate.Usercomplain
 * @author MyEclipse Persistence Tools
 */
public class UsercomplainDAO extends BaseHibernateDAO {
	private static final Log log = LogFactory.getLog(UsercomplainDAO.class);
	// property constants
	public static final String COM_REASON = "comReason";
	public static final String STATUS = "status";

	public void save(Usercomplain transientInstance) {
		log.debug("saving Usercomplain instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Usercomplain persistentInstance) {
		log.debug("deleting Usercomplain instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Usercomplain findById(hibernate.UsercomplainId id) {
		log.debug("getting Usercomplain instance with id: " + id);
		try {
			Usercomplain instance = (Usercomplain) getSession().get(
					"hibernate.Usercomplain", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Usercomplain instance) {
		log.debug("finding Usercomplain instance by example");
		try {
			List results = getSession()
					.createCriteria("hibernate.Usercomplain")
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
		log.debug("finding Usercomplain instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from Usercomplain as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByComReason(Object comReason) {
		return findByProperty(COM_REASON, comReason);
	}

	public List findByStatus(Object status) {
		return findByProperty(STATUS, status);
	}

	public List findAll() {
		log.debug("finding all Usercomplain instances");
		try {
			String queryString = "from Usercomplain";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Usercomplain merge(Usercomplain detachedInstance) {
		log.debug("merging Usercomplain instance");
		try {
			Usercomplain result = (Usercomplain) getSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Usercomplain instance) {
		log.debug("attaching dirty Usercomplain instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Usercomplain instance) {
		log.debug("attaching clean Usercomplain instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}