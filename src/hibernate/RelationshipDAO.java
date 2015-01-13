package hibernate;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;

/**
 * A data access object (DAO) providing persistence and search support for
 * Relationship entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see hibernate.Relationship
 * @author MyEclipse Persistence Tools
 */
public class RelationshipDAO extends BaseHibernateDAO {
	private static final Log log = LogFactory.getLog(RelationshipDAO.class);
	// property constants
	public static final String RELA_TYPE = "relaType";

	public void save(Relationship transientInstance) {
		log.debug("saving Relationship instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Relationship persistentInstance) {
		log.debug("deleting Relationship instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Relationship findById(hibernate.RelationshipId id) {
		log.debug("getting Relationship instance with id: " + id);
		try {
			Relationship instance = (Relationship) getSession().get(
					"hibernate.Relationship", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Relationship instance) {
		log.debug("finding Relationship instance by example");
		try {
			List results = getSession()
					.createCriteria("hibernate.Relationship")
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
		log.debug("finding Relationship instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from Relationship as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByRelaType(Object relaType) {
		return findByProperty(RELA_TYPE, relaType);
	}

	public List findAll() {
		log.debug("finding all Relationship instances");
		try {
			String queryString = "from Relationship";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Relationship merge(Relationship detachedInstance) {
		log.debug("merging Relationship instance");
		try {
			Relationship result = (Relationship) getSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Relationship instance) {
		log.debug("attaching dirty Relationship instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Relationship instance) {
		log.debug("attaching clean Relationship instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}