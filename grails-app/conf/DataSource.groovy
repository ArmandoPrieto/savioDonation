dataSource {
    pooled = true
    jmxExport = true
    driverClassName = "org.h2.Driver"
    username = "sa"
    password = ""
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
//    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory' // Hibernate 3
    cache.region.factory_class = 'org.hibernate.cache.ehcache.EhCacheRegionFactory' // Hibernate 4
    singleSession = true // configure OSIV singleSession mode
    flush.mode = 'manual' // OSIV session flush mode outside of transactional context
}

// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "create-drop" // one of 'create', 'create-drop', 'update', 'validate', ''
            url = "jdbc:h2:mem:devDb;MVCC=TRUE;LOCK_TIMEOUT=10000;DB_CLOSE_ON_EXIT=FALSE"
        }
    }
    test {
        dataSource {
            dbCreate = "update"
            url = "jdbc:h2:mem:testDb;MVCC=TRUE;LOCK_TIMEOUT=10000;DB_CLOSE_ON_EXIT=FALSE"
        }
    }
   /* production {
		
		
        dataSource {
			dbCreate = "update" // one of 'create', 'create-drop', 'update', 'validate', ''
			//url = "jdbc:h2:mem:devDb;MVCC=TRUE;LOCK_TIMEOUT=10000;DB_CLOSE_ON_EXIT=FALSE"
			
				pooled = true
				
				url = "jdbc:mysql://127.10.3.2:3306/donations"
				
				driverClassName = "com.mysql.jdbc.Driver"
				username = "admini2X4x8h"
				password = "qAL_FDKlFFsW"
			
				properties{
               // See http://grails.org/doc/latest/guide/conf.html#dataSource for documentation
               jmxEnabled = true
               initialSize = 5
               maxActive = 50
               minIdle = 5
               maxIdle = 25
               maxWait = 10000
               maxAge = 10 * 60000
               timeBetweenEvictionRunsMillis = 1800000
               minEvictableIdleTimeMillis = 1800000
               validationQuery = "SELECT 1"
               validationQueryTimeout = 3
               validationInterval = 15000
               testOnBorrow = true
               testWhileIdle = true
               testOnReturn = false
               jdbcInterceptors = "ConnectionState"
               defaultTransactionIsolation = java.sql.Connection.TRANSACTION_READ_COMMITTED
            }
        }
    }*/
	production {
		dataSource {
			dialect = savioWebPage.ImprovedH2Dialect //Solve hibernate4 - mysql problem
			dbCreate = "update" // one of 'create', 'create-drop', 'update', 'validate', ''
			//url = "jdbc:h2:mem:devDb;MVCC=TRUE;LOCK_TIMEOUT=10000;DB_CLOSE_ON_EXIT=FALSE"
			
				pooled = true
				
				url = "jdbc:mysql://127.10.3.2:3306/donations"
				
				driverClassName = "com.mysql.jdbc.Driver"
				username = "admini2X4x8h"
				password = "qAL_FDKlFFsW"
			
				properties {
					maxActive = 50
					maxIdle = 25
					minIdle = 5
					initialSize = 5
					minEvictableIdleTimeMillis = 1800000
					timeBetweenEvictionRunsMillis = 1800000
					maxWait = 10000
					numTestsPerEvictionRun=3
					//test the connection while its idle, before borrow and return it
					testOnBorrow=true
					testWhileIdle=true
					testOnReturn=true
					validationQuery="SELECT 1"
				 }
				
			}
	}
	
}
