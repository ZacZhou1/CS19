package usyd.elec5703.cs19;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.bson.Document;
import org.bson.types.ObjectId;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;

@Controller("home")
public class HomepageController {

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String homepage() {
		return "home";
	}

	@RequestMapping(value = "/storedalgorithm", method = RequestMethod.GET)
	public ModelAndView storedAlgorithm() {
		Map<String, Object> map = new HashMap<String, Object>();
		List<DocumentData> list = new ArrayList<DocumentData>();

		try {

			MongoClient mongoClient = new MongoClient("localhost", 27017);

			// 连接到数据库
			MongoDatabase mongoDatabase = mongoClient.getDatabase("mycol");
			System.out.println("Connect to database successfully");

			MongoCollection<Document> collection = mongoDatabase.getCollection("psychometric");
			FindIterable<Document> findIterable = collection.find();
			MongoCursor<Document> mongoCursor = findIterable.iterator();
			while (mongoCursor.hasNext()) {
				Document document = mongoCursor.next();
				String idString = document.get("_id").toString();
				String userName = document.get("userName").toString();
				String psychometricSpace = document.get("psychometricSpace").toString();
				String numericSpace = document.get("numericSpace").toString();
				String mappingAlgorithm = document.get("mappingAlgorithm").toString();
				DocumentData data = new DocumentData(idString, userName, psychometricSpace, numericSpace,
						mappingAlgorithm);
				list.add(data);

				System.out.println(idString);
			}
		} catch (Exception e) {
			System.err.println(e.getClass().getName() + ": " + e.getMessage());
		}
		map.put("documentData", list);

		return new ModelAndView("storedalgorithm", "map", map);
	}

	@RequestMapping(value = "/guide", method = RequestMethod.GET)
	public String guide() {
		return "guide";
	}

	@RequestMapping(value = "/upload", method = RequestMethod.GET)
	public String upload() {
		return "upload";
	}

	@RequestMapping(value = "/storedalgorithm/{id}", method = RequestMethod.GET)
	public ModelAndView detail(@PathVariable("id") String id) {
		Map<String, Object> visMap = new HashMap<String, Object>();
		List<DocumentData> list = new ArrayList<DocumentData>();
		String algorithmtype ="";
		String psychometricSpace = "";
		String numericSpace = "";
		try {

			MongoClient mongoClient = new MongoClient("localhost", 27017);
			MongoDatabase mongoDatabase = mongoClient.getDatabase("mycol");

			BasicDBObject queryObject = new BasicDBObject("_id",new ObjectId(id));
			MongoCollection<Document> collection = mongoDatabase.getCollection("psychometric");
			FindIterable<Document> findIterable = collection.find(queryObject);
			MongoCursor<Document> mongoCursor = findIterable.iterator();
			while (mongoCursor.hasNext()) {
				Document document = mongoCursor.next();
				String idString = document.get("_id").toString();
				String userName = document.get("userName").toString();
				psychometricSpace = document.get("psychometricSpace").toString();
				numericSpace = document.get("numericSpace").toString();
				String mappingAlgorithm = document.get("mappingAlgorithm").toString();
				algorithmtype = mappingAlgorithm;
				DocumentData data = new DocumentData(idString, userName, psychometricSpace, numericSpace,
						mappingAlgorithm);
				list.add(data);

				System.out.println(idString);
			}
		} catch (Exception e) {
			System.err.println(e.getClass().getName() + ": " + e.getMessage());
		}
		String[] psychometricArr = psychometricSpace.split(",");
		String[] numericArr = numericSpace.split(",");
		int range =psychometricArr.length;
		double[] inputX = new double[range];
		double[] inputY = new double[range];
		for (int i = 0; i < range; i++) {
			inputX[i] = i + 1;
		}
		for (int i = 0; i < range; i++) {
			inputY[i] = Double.parseDouble(numericArr[i]);
		}
		if (algorithmtype.equals("A")) {
			//=++++++++++++++++++++
			//=++++++++++++++++++++
			//=++++++++++++++++++++
			//=++++++++++++++++++++
			//=++++++++++++++++++++
			CurveFit curveFit = new CurveFit();
			double[] par = new double[4];
			par = curveFit.curveFit(inputX, inputY);
			double a = par[3];
			double b = par[2];
			double c = par[1];
			double d = par[0];
			visMap.put("a", a);
			visMap.put("b", b);
			visMap.put("c", c);
			visMap.put("d", d);
			
		}
		Regression regression = new Regression();
		if (algorithmtype.equals("B")) {
			ArrayList<Double> linerArrayList = regression.linearInterpolation(inputX, inputY);
			visMap.put("linerArrayList", linerArrayList);
			visMap.put("a", 0);
			visMap.put("b", 0);
			visMap.put("c", 0);
			visMap.put("d", 0);
		}
		if (algorithmtype.equals("C")) {
			ArrayList<Double> cubicArrayList = regression.cubicSpline(inputX, inputY);
			visMap.put("cubicArrayList", cubicArrayList);
			visMap.put("a", 0);
			visMap.put("b", 0);
			visMap.put("c", 0);
			visMap.put("d", 0);

		}
		if (algorithmtype.equals("D")) {
			ArrayList<Double> shepardArrayList = regression.shepardInterpolation(inputX, inputY);
			visMap.put("shepardArrayList", shepardArrayList);
			visMap.put("a", 0);
			visMap.put("b", 0);
			visMap.put("c", 0);
			visMap.put("d", 0);
		}
		visMap.put("rangeX", range);
		visMap.put("documentData", list);
		
		List<String> psylist = Arrays.asList(psychometricArr);
		List<String> numlist = Arrays.asList(numericArr);
		
		
		visMap.put("psylist", psylist);
		visMap.put("numlist", numlist);
		
		visMap.put("algorithmtype", algorithmtype);
		
		return new ModelAndView("detail", "visMap", visMap);
	}

	@RequestMapping(value = "/uploadsubmit", method = RequestMethod.POST)
	public String uploadsubmit(HttpServletRequest request) {
		String csv = request.getParameter("csv");
		String[] rows = csv.split("\n");
		String[] head = rows[0].split(",", 2);
//		System.out.println(head[0]);
//		System.out.println(head[1]);
		for (int i = 1; i < rows.length; i++) {
			String[] numbers = rows[i].split(",", 2);
			String username = numbers[0];
			String num = numbers[1];
//			System.out.println(username);
//			System.out.println(num);

			try {
				MongoClient mongoClient = new MongoClient("localhost", 27017);
				MongoDatabase mongoDatabase = mongoClient.getDatabase("mycol");
				MongoCollection<Document> collection = mongoDatabase.getCollection("psychometric");

				Document document = new Document("userName", username).append("psychometricSpace", head[1].replace("\r", ""))
						.append("numericSpace", num.replace("\r", "")).append("mappingAlgorithm", "A");
				collection.insertOne(document);
			} catch (Exception e) {
				System.err.println(e.getClass().getName() + ": " + e.getMessage());
			}

		}

		return "upload";
	}

	@RequestMapping(value = "/usersubmit", method = RequestMethod.POST)
	public String usersubmit(HttpServletRequest request) {
		String[] psyArr = request.getParameterValues("psyArr[]");
		String[] numArr = request.getParameterValues("numArr[]");
		String chooseAlgorithm = request.getParameter("chooseAlgorithm");

		Tools tools = new Tools();

		try {
			MongoClient mongoClient = new MongoClient("localhost", 27017);
			MongoDatabase mongoDatabase = mongoClient.getDatabase("mycol");
			MongoCollection<Document> collection = mongoDatabase.getCollection("psychometric");

			Document document = new Document("userName", "userName")
					.append("psychometricSpace", tools.arrayToString(psyArr))
					.append("numericSpace", tools.arrayToString(numArr)).append("mappingAlgorithm", chooseAlgorithm);
			collection.insertOne(document);
		} catch (Exception e) {
			System.err.println(e.getClass().getName() + ": " + e.getMessage());
		}

		return "upload";
	}

	@RequestMapping(value = "/map", method = RequestMethod.POST)
	public ModelAndView Map(HttpServletRequest request) {
		String[] psyArr = request.getParameterValues("psyArr[]");
		String[] numArr = request.getParameterValues("numArr[]");
		List<String> psylist = Arrays.asList(psyArr);
		List<String> numlist = Arrays.asList(numArr);
		CurveFit curveFit = new CurveFit();
		int range = numArr.length;
		double[] inputX = new double[range];
		double[] inputY = new double[range];

		for (int i = 0; i < range; i++) {
			inputY[i] = Double.parseDouble(numArr[i]);
		}
		for (int i = 0; i < range; i++) {
			inputX[i] = i + 1;
		}
		double[] par = new double[4];
		par = curveFit.curveFit(inputX, inputY);
		double a = par[3];
		double b = par[2];
		double c = par[1];
		double d = par[0];
		Map<String, Object> visMap = new HashMap<String, Object>();
		visMap.put("a", a);
		visMap.put("b", b);
		visMap.put("c", c);
		visMap.put("d", d);
		visMap.put("rangeX", range);
		visMap.put("minY", inputY[0]);
		visMap.put("maxY", inputY[range - 1]);

		Regression regression = new Regression();
		ArrayList<Double> cubicArrayList = regression.cubicSpline(inputX, inputY);
		ArrayList<Double> linerArrayList = regression.linearInterpolation(inputX, inputY);
		ArrayList<Double> shepardArrayList = regression.shepardInterpolation(inputX, inputY);

		visMap.put("cubicArrayList", cubicArrayList);
		visMap.put("linerArrayList", linerArrayList);
		visMap.put("shepardArrayList", shepardArrayList);

		visMap.put("psylist", psylist);
		visMap.put("numlist", numlist);

		return new ModelAndView("vis", "visMap", visMap);

//		String emotionValue = Request.getParameter("emotionValue");
//		String algorithmValue = Request.getParameter("algorithmValue");
//		String rangeValue = Request.getParameter("rangeValue");
//
//		String range1 = Request.getParameter("range1");
//		String range2 = Request.getParameter("range2");
//		String range3 = Request.getParameter("range3");
//		String range4 = Request.getParameter("range4");
//		String range5 = Request.getParameter("range5");
//		String range6 = Request.getParameter("range6");
//		String range7 = Request.getParameter("range7");
//		String range8 = Request.getParameter("range8");
//		String range9 = Request.getParameter("range9");
//		
//
//		try {
//			MongoClient mongoClient = new MongoClient("localhost", 27017);
//			MongoDatabase mongoDatabase = mongoClient.getDatabase("mycol");
//			MongoCollection<Document> collection = mongoDatabase.getCollection("psychometric");
//
//			Document document = new Document("emotionValue", emotionValue).
//					append("algorithmValue", algorithmValue).
//					append("rangeValue", rangeValue);
//			
//			Integer rangeValueInteger = Integer.parseInt(rangeValue);
//			if (rangeValueInteger == 3) {
//				document.append("coordinator1", "(0,"+range3+")");
//				document.append("coordinator2", "(50,"+range5+")");
//				document.append("coordinator3", "(100,"+range7+")");
//			}else  if (rangeValueInteger == 5) {
//				document.append("coordinator1", "(0,"+range2+")");
//				document.append("coordinator2", "(25,"+range3+")");
//				document.append("coordinator3", "(50,"+range5+")");
//				document.append("coordinator4", "(75,"+range7+")");
//				document.append("coordinator5", "(100,"+range8+")");
//			}else if (rangeValueInteger == 7) {
//				document.append("coordinator1", "(0,"+range2+")");
//				document.append("coordinator2", "(17,"+range3+")");
//				document.append("coordinator3", "(33,"+range4+")");
//				document.append("coordinator4", "(50,"+range5+")");
//				document.append("coordinator5", "(67,"+range6+")");
//				document.append("coordinator6", "(83,"+range7+")");
//				document.append("coordinator6", "(100,"+range8+")");
//			}else if (rangeValueInteger == 9) {
//				document.append("coordinator1", "(0,"+range1+")");
//				document.append("coordinator2", "(13,"+range2+")");
//				document.append("coordinator3", "(25,"+range3+")");
//				document.append("coordinator4", "(38,"+range4+")");
//				document.append("coordinator5", "(50,"+range5+")");
//				document.append("coordinator6", "(63,"+range6+")");
//				document.append("coordinator7", "(75,"+range7+")");
//				document.append("coordinator8", "(88,"+range8+")");
//				document.append("coordinator9", "(100,"+range9+")");
//			}
//
//		
//			collection.insertOne(document);
//		} catch (Exception e) {
//			System.err.println(e.getClass().getName() + ": " + e.getMessage());
//		}

	}

	@RequestMapping(value = "/vis", method = RequestMethod.GET)
	public String Vis(HttpServletRequest request) {
		return "vis";

	}

	@RequestMapping(value = "/vis", method = RequestMethod.POST)
	public String Vis2(HttpServletRequest request) {
		return "vis";

	}

}
