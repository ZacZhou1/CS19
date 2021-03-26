package usyd.elec5703.cs19;

import javax.servlet.http.HttpServletRequest;

import org.bson.Document;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;

@Controller("home")
public class HomepageController {

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String homepage() {
		return "home";
	}

	@RequestMapping(value = "/map", method = RequestMethod.POST)
	public String Map(HttpServletRequest Request) {
		String emotionValue = Request.getParameter("emotionValue");
		String algorithmValue = Request.getParameter("algorithmValue");
		String rangeValue = Request.getParameter("rangeValue");

		String range1 = Request.getParameter("range1");
		String range2 = Request.getParameter("range2");
		String range3 = Request.getParameter("range3");
		String range4 = Request.getParameter("range4");
		String range5 = Request.getParameter("range5");
		String range6 = Request.getParameter("range6");
		String range7 = Request.getParameter("range7");
		String range8 = Request.getParameter("range8");
		String range9 = Request.getParameter("range9");
		

		try {
			MongoClient mongoClient = new MongoClient("localhost", 27017);
			MongoDatabase mongoDatabase = mongoClient.getDatabase("mycol");
			MongoCollection<Document> collection = mongoDatabase.getCollection("psychometric");

			Document document = new Document("emotionValue", emotionValue).
					append("algorithmValue", algorithmValue).
					append("rangeValue", rangeValue);
			
			Integer rangeValueInteger = Integer.parseInt(rangeValue);
			if (rangeValueInteger == 3) {
				document.append("coordinator1", "(0,"+range3+")");
				document.append("coordinator2", "(50,"+range5+")");
				document.append("coordinator3", "(100,"+range7+")");
			}else  if (rangeValueInteger == 5) {
				document.append("coordinator1", "(0,"+range2+")");
				document.append("coordinator2", "(25,"+range3+")");
				document.append("coordinator3", "(50,"+range5+")");
				document.append("coordinator4", "(75,"+range7+")");
				document.append("coordinator5", "(100,"+range8+")");
			}else if (rangeValueInteger == 7) {
				document.append("coordinator1", "(0,"+range2+")");
				document.append("coordinator2", "(17,"+range3+")");
				document.append("coordinator3", "(33,"+range4+")");
				document.append("coordinator4", "(50,"+range5+")");
				document.append("coordinator5", "(67,"+range6+")");
				document.append("coordinator6", "(83,"+range7+")");
				document.append("coordinator6", "(100,"+range8+")");
			}else if (rangeValueInteger == 9) {
				document.append("coordinator1", "(0,"+range1+")");
				document.append("coordinator2", "(13,"+range2+")");
				document.append("coordinator3", "(25,"+range3+")");
				document.append("coordinator4", "(38,"+range4+")");
				document.append("coordinator5", "(50,"+range5+")");
				document.append("coordinator6", "(63,"+range6+")");
				document.append("coordinator7", "(75,"+range7+")");
				document.append("coordinator8", "(88,"+range8+")");
				document.append("coordinator9", "(100,"+range9+")");
			}

		
			collection.insertOne(document);
		} catch (Exception e) {
			System.err.println(e.getClass().getName() + ": " + e.getMessage());
		}

		return "redirect:/home";
	}

}
