package org.cloudfoundry.services;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.dao.DataAccessException;
import org.springframework.data.mongodb.MongoDbFactory;
import org.springframework.data.mongodb.core.CollectionCallback;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mongodb.DBCollection;
import com.mongodb.MongoException;

@Controller
//@RequestMapping(value="/incident")
public class IncidentController {

	@Autowired(required = false)
	MongoDbFactory mongoDbFactory;

	@Autowired(required = false)
	MongoTemplate mongoTemplate;

	@Autowired(required = false)
	@Qualifier(value = "serviceProperties")
	Properties serviceProperties;
	
	List<Incident> myincidents;
	//private Map<Long, Incident> incidents = new ConcurrentHashMap<Long, Incident>();
	
	@RequestMapping(value="/incident/form", method=RequestMethod.GET)
	public String getCreateForm(Model model) {
		
		myincidents = mongoTemplate.find(new Query(), Incident.class);
		model.addAttribute("incidents", myincidents);

		ArrayList<Cause> cause = new ArrayList<Cause>();
		cause.add(new Cause(1,"Homeless"));
		cause.add(new Cause(2,"Drunk"));
		cause.add(new Cause(3,"Animal"));
		cause.add(new Cause(4,"Other"));
		model.addAttribute("cause", cause);
		
		model.addAttribute(new Incident());
		return "incident/createForm";
	}
	
	/*@ModelAttribute
	public String waa(Model model){
		myincidents = mongoTemplate.find(new Query(where("id").gte(0)), Incident.class);
		
		model.addAttribute("incidents", myincidents);
		
		return "incident/all";
	}*/
	
	//@RequestMapping(method=RequestMethod.POST)
	@RequestMapping(value="/incident/done", method=RequestMethod.POST)
	public String create(@Validated Incident incident, BindingResult result) {
		if (result.hasErrors()) {
			return "incident/createForm"; 
		}
		//this.incidents.put((long) 4323, incident);
		
		List<String> services = new ArrayList<String>();
		if (mongoDbFactory != null) {
			services.add("MongoDB: " + mongoDbFactory.getDb().getMongo().getAddress());
		}
		//incident.setId("4222");
		mongoTemplate.save(incident);
		
		
		//EmailNotificationMgr a = new EmailNotificationMgr();
		EmailNotificationMgr.initEmailNotificationMgr();
		EmailNotificationMgr.sendMail(incident.getCause(), incident.getLatitude(), incident.getLongitude());
		
		
		//myincidents = mongoTemplate.find(new Query(where("id").gte(0)), Incident.class);
		//model.addAttribute("incidents", myincidents);
			
		//return "home";
		//return "incident/";
		//return "redirect:/incident/" + incident.getId();
		//return "redirect:/incident/form";//goes to controller method
		return "incident/done";
	}
	

	@RequestMapping("/incident/deleteAll")
	public void deleteAll(HttpServletResponse response) throws IOException {
		response.setContentType("text/plain");
		PrintWriter out = response.getWriter();
		long count = mongoTemplate.execute(Incident.class,
				new CollectionCallback<Long>() {
					@Override
					public Long doInCollection(DBCollection collection)
							throws MongoException, DataAccessException {
						return collection.count();
					}
				});
		out.println("Deleted " + count + " entries");
		mongoTemplate.dropCollection(Incident.class);
	}

}