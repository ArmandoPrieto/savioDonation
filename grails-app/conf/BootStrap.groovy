import com.security.Role
import com.security.User
import com.security.UserRole

class BootStrap {

    def init = { servletContext ->
    
		
		if(!(Role.list() && Grade.list())){
			println "-----------------------------------------------------------------"
			println "-----------------------------------------------------------------"
			Role r1 = new Role(authority: "ROLE_ADMINISTRATOR")
			r1.save()
			Role r2 = new Role(authority: "ROLE_SUPER_USER")
			r2.save()
			
			
			User user1 = new User()
			user1.setUsername("superuser")
			user1.password="0000"
			user1.save()
			
			UserRole.create(user1, r2)
		}
		
		
		
		}
    def destroy = {
		
		
		
    }
}
