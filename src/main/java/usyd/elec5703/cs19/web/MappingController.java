package usyd.elec5703.cs19.web;

import java.util.ArrayList;
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
import com.mongodb.MongoClient;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;

import usyd.elec5703.cs19.algorithm.MappingClustering;
import usyd.elec5703.cs19.algorithm.MappingMDS;
import usyd.elec5703.cs19.algorithm.MappingProjection;
import usyd.elec5703.cs19.domain.Data;
import usyd.elec5703.cs19.domain.Questionnaire;
import usyd.elec5703.cs19.domain.QuestionnaireList;
import usyd.elec5703.cs19.utils.Tools;

@Controller("mapping")
public class MappingController {
	
	MongoClient mongoClient = new MongoClient( "localhost" , 27017 );
	
	@RequestMapping(value = "mapping/guide", method = RequestMethod.GET)
	public String mappingGuide() {
		return "pageguide";
	}

	@RequestMapping(value = "mapping/upload", method = RequestMethod.GET)
	public String mappingUpload() {
		return "pageupload";
	}

	@RequestMapping(value = "mapping/collectdata/{id}", method = RequestMethod.GET)
	public ModelAndView userCollectData(@PathVariable("id") String id) {
		Map<String, Object> map = new HashMap<String, Object>();

		String theme = "";
		String minvalue = "";
		String maxvalue = "";
		String descriptionnumber = "";
		String description = "";
		Questionnaire questionnaire = new Questionnaire();
		try {
//			com.mongodb.client.MongoClient mongoClient = MongoClients.create(
//					"mongodb+srv://hao:c1SkRR0inlNhjqWF@cluster0.ap9gn.mongodb.net/myFirstDatabase?retryWrites=true&w=majority");
//			MongoClient mongoClient = new MongoClient( "localhost" , 27017 );
			MongoDatabase mongoDatabase = mongoClient.getDatabase("mycol");

			BasicDBObject queryObject = new BasicDBObject("_id", new ObjectId(id));
			MongoCollection<Document> collection = mongoDatabase.getCollection("questionnaire");
			FindIterable<Document> findIterable = collection.find(queryObject);
			MongoCursor<Document> mongoCursor = findIterable.iterator();
			while (mongoCursor.hasNext()) {
				Document document = mongoCursor.next();
				theme = document.getString("theme").toString();
				minvalue = document.get("minValue").toString();
				maxvalue = document.get("maxValue").toString();
				descriptionnumber = document.get("descriptionnumber").toString();
				description = document.get("descriptions").toString();
				questionnaire = new Questionnaire(id, theme, minvalue, maxvalue, descriptionnumber, description);
			}
		} catch (Exception e) {
			System.err.println(e.getClass().getName() + ": " + e.getMessage());
		}
		map.put("questionnaire", questionnaire);
		return new ModelAndView("pagecollectdata", "map", map);
	}
	
	
	@RequestMapping(value = "mapping/collectdata/submit", method = RequestMethod.POST)
	public ModelAndView userCollectDataSubmit(HttpServletRequest request) {
		
		String[] arr_description = request.getParameterValues("arr_description[]");
		String questionnaireid = request.getParameter("questionnaireid");
		String[] arr_number = request.getParameterValues("arr_number[]");
		Tools tools =  new Tools();
		
		String descriptions = tools.arrayToString(arr_description);
		String values = tools.arrayToString(arr_number);

		
		
		
		try {
//			com.mongodb.client.MongoClient mongoClient = MongoClients.create(
//					"mongodb+srv://hao:c1SkRR0inlNhjqWF@cluster0.ap9gn.mongodb.net/myFirstDatabase?retryWrites=true&w=majority");

			MongoDatabase mongoDatabase = mongoClient.getDatabase("mycol");
			MongoCollection<Document> collection = mongoDatabase.getCollection("questionnairelist");
			Document document = new Document("questionnaireid", questionnaireid).append("descriptions", descriptions)
					.append("values", values);
			collection.insertOne(document);
		} catch (Exception e) {
			System.err.println(e.getClass().getName() + ": " + e.getMessage());
		}
		
		
		
		return null;
		
	}
	
	@RequestMapping(value = "mapping/collectdata/list", method = RequestMethod.GET)
	public ModelAndView userCollectDataList() {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Questionnaire> list = new ArrayList<Questionnaire>();

		try {

//			com.mongodb.client.MongoClient mongoClient = MongoClients.create(
//					"mongodb+srv://hao:c1SkRR0inlNhjqWF@cluster0.ap9gn.mongodb.net/myFirstDatabase?retryWrites=true&w=majority");

			MongoDatabase mongoDatabase = mongoClient.getDatabase("mycol");
			MongoCollection<Document> collection = mongoDatabase.getCollection("questionnaire");
			FindIterable<Document> findIterable = collection.find();
			MongoCursor<Document> mongoCursor = findIterable.iterator();
			while (mongoCursor.hasNext()) {
				Document document = mongoCursor.next();
				String id = document.get("_id").toString();
				String theme = document.getString("theme").toString();
				String minvalue = document.get("minValue").toString();
				String maxvalue = document.get("maxValue").toString();
				String descriptionnumber = document.get("descriptionnumber").toString();
				String description = document.get("descriptions").toString();
				Questionnaire questionnaire = new Questionnaire(id, theme, minvalue, maxvalue, descriptionnumber,
						description);
				list.add(questionnaire);

			}
		} catch (Exception e) {
			System.err.println(e.getClass().getName() + ": " + e.getMessage());
		}
		map.put("documentData", list);
		return new ModelAndView("pagecollectdatalist", "map", map);
		
	}

	@RequestMapping(value = "mapping/questionnaire", method = RequestMethod.GET)
	public ModelAndView mappingQueryList() {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Questionnaire> list = new ArrayList<Questionnaire>();

		try {

//			com.mongodb.client.MongoClient mongoClient = MongoClients.create(
//					"mongodb+srv://hao:c1SkRR0inlNhjqWF@cluster0.ap9gn.mongodb.net/myFirstDatabase?retryWrites=true&w=majority");

			MongoDatabase mongoDatabase = mongoClient.getDatabase("mycol");
			MongoCollection<Document> collection = mongoDatabase.getCollection("questionnaire");
			FindIterable<Document> findIterable = collection.find();
			MongoCursor<Document> mongoCursor = findIterable.iterator();
			while (mongoCursor.hasNext()) {
				Document document = mongoCursor.next();
				String id = document.get("_id").toString();
				String theme = document.getString("theme").toString();
				String minvalue = document.get("minValue").toString();
				String maxvalue = document.get("maxValue").toString();
				String descriptionnumber = document.get("descriptionnumber").toString();
				String description = document.get("descriptions").toString();
				Questionnaire questionnaire = new Questionnaire(id, theme, minvalue, maxvalue, descriptionnumber,
						description);
				list.add(questionnaire);

			}
		} catch (Exception e) {
			System.err.println(e.getClass().getName() + ": " + e.getMessage());
		}
		map.put("documentData", list);
		return new ModelAndView("pagequestionnaire", "map", map);
	}
	
	
	
	
	@RequestMapping(value = "mapping/questionnaire/data/{id}", method = RequestMethod.GET)
	public ModelAndView mappingQueryData(@PathVariable("id") String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<QuestionnaireList> list = new ArrayList<QuestionnaireList>();

		try {

//			com.mongodb.client.MongoClient mongoClient = MongoClients.create(
//					"mongodb+srv://hao:c1SkRR0inlNhjqWF@cluster0.ap9gn.mongodb.net/myFirstDatabase?retryWrites=true&w=majority");

			MongoDatabase mongoDatabase = mongoClient.getDatabase("mycol");

//			BasicDBObject queryObject = new BasicDBObject("questionnaireid", new ObjectId(id));
			MongoCollection<Document> collection = mongoDatabase.getCollection("questionnairelist");
			FindIterable<Document> findIterable = collection.find(new Document("questionnaireid",id));
			MongoCursor<Document> mongoCursor = findIterable.iterator();
			while (mongoCursor.hasNext()) {
				Document document = mongoCursor.next();
				String idid = document.get("_id").toString();
				String questionnaireid = document.get("questionnaireid").toString();
				String descriptions = document.get("descriptions").toString();
				String values = document.get("values").toString();
				QuestionnaireList questionnaireList =  new QuestionnaireList(idid, questionnaireid, descriptions, values);
				System.out.println(questionnaireList.toString());
				list.add(questionnaireList);
			}

			
		} catch (Exception e) {
			System.err.println(e.getClass().getName() + ": " + e.getMessage());
		}
		map.put("documentData", list);
		return new ModelAndView("pagequestionnairelistdetail", "map", map);
	}
	
	

	@RequestMapping(value = "mapping/questionnairecreate", method = RequestMethod.GET)
	public String mappingQueryCreate() {
		return "pagequestionnairecreate";
	}

	@RequestMapping(value = "mapping/questionnairecreate/create", method = RequestMethod.POST)
	public String mappingQueryListCreate(HttpServletRequest request) {
		String[] psyArr = request.getParameterValues("psyArr[]");
		String theme = request.getParameter("theme");
		String minValue = request.getParameter("minvalue");
		String maxValue = request.getParameter("maxvalue");
		String descriptionnumber = request.getParameter("descriptionnumber");
		Tools tools = new Tools();
		String description = tools.arrayToString(psyArr);

		try {
//			com.mongodb.client.MongoClient mongoClient = MongoClients.create(
//					"mongodb+srv://hao:c1SkRR0inlNhjqWF@cluster0.ap9gn.mongodb.net/myFirstDatabase?retryWrites=true&w=majority");

			MongoDatabase mongoDatabase = mongoClient.getDatabase("mycol");
			MongoCollection<Document> collection = mongoDatabase.getCollection("questionnaire");
			Document document = new Document("theme", theme).append("minValue", minValue).append("maxValue", maxValue)
					.append("descriptionnumber", descriptionnumber).append("descriptions", description);
			collection.insertOne(document);
		} catch (Exception e) {
			System.err.println(e.getClass().getName() + ": " + e.getMessage());
		}

		return "pagequestionnaire";
	}

	@RequestMapping(value = "mapping/data", method = RequestMethod.GET)
	public ModelAndView mappingData() {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Data> list = new ArrayList<Data>();

		try {

//			com.mongodb.client.MongoClient mongoClient = MongoClients.create(
//					"mongodb+srv://hao:c1SkRR0inlNhjqWF@cluster0.ap9gn.mongodb.net/myFirstDatabase?retryWrites=true&w=majority");

			MongoDatabase mongoDatabase = mongoClient.getDatabase("mycol");
			MongoCollection<Document> collection = mongoDatabase.getCollection("Mapping");
			FindIterable<Document> findIterable = collection.find();
			MongoCursor<Document> mongoCursor = findIterable.iterator();
			while (mongoCursor.hasNext()) {
				Document document = mongoCursor.next();
				String idString = document.get("_id").toString();
				String psychometricSpace = document.get("psychometricSpace").toString();
				String numericSpace = document.get("numberSpace").toString();
				String algorithm = document.get("algorithm").toString();
				Data data = new Data(idString, psychometricSpace, numericSpace, algorithm);
				list.add(data);

			}
		} catch (Exception e) {
			System.err.println(e.getClass().getName() + ": " + e.getMessage());
		}
		map.put("documentData", list);

		return new ModelAndView("pagedata", "map", map);
	}

	@RequestMapping(value = "mapping/data/{id}", method = RequestMethod.GET)
	public ModelAndView mappingDataPredict(@PathVariable("id") String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		String idString = "";
		String algorithmtype = "";
		String psychometricSpace = "";
		String numericSpace = "";
		Data data = new Data();
		try {

//			com.mongodb.client.MongoClient mongoClient = MongoClients.create(
//					"mongodb+srv://hao:c1SkRR0inlNhjqWF@cluster0.ap9gn.mongodb.net/myFirstDatabase?retryWrites=true&w=majority");

			MongoDatabase mongoDatabase = mongoClient.getDatabase("mycol");

			BasicDBObject queryObject = new BasicDBObject("_id", new ObjectId(id));
			MongoCollection<Document> collection = mongoDatabase.getCollection("Mapping");
			FindIterable<Document> findIterable = collection.find(queryObject);
			MongoCursor<Document> mongoCursor = findIterable.iterator();
			while (mongoCursor.hasNext()) {
				Document document = mongoCursor.next();
				idString = document.get("_id").toString();
				psychometricSpace = document.get("psychometricSpace").toString();
				numericSpace = document.get("numberSpace").toString();
				algorithmtype = document.get("algorithm").toString();
				data = new Data(idString, psychometricSpace, numericSpace, algorithmtype);
				System.out.println(idString);
			}
		} catch (Exception e) {
			System.err.println(e.getClass().getName() + ": " + e.getMessage());
		}
		map.put("data", data);
		return new ModelAndView("pagepredict", "map", map);
	}

	@RequestMapping(value = "mapping/uploadsubmit", method = RequestMethod.POST)
	public String mappingUploadSubmit(HttpServletRequest request) {

		String csv = request.getParameter("csv").replace("\r", "");
		String algorithm = request.getParameter("algorithm");

		String[] rows = csv.split("\n");
		String[] cols = rows[0].split(",");

		double[][] arr = new double[rows.length - 1][cols.length - 1];
		for (int i = 1; i < rows.length; i++) {
			String[] colData = rows[i].split(",");

			for (int j = 1; j < colData.length; j++) {
				try {
					arr[i - 1][j - 1] = Double.parseDouble(colData[j]);
				} catch (NumberFormatException e) {
					e.printStackTrace();
				}
			}
		}

		double sumA = 0;
		double sumB = 0;
		for (int i = 0; i < rows.length - 1; i++) {
			sumA += arr[i][0];
			sumB += arr[i][cols.length - 2];
		}

		double a = sumA / (rows.length - 1);
		double b = sumB / (rows.length - 1);

//		for (double[] ds : arr) {
//			System.out.println(Arrays.toString(ds));
//		}
		double[] result = null;
		MappingClustering mappingClustering = new MappingClustering();
		MappingMDS mappingMDS = new MappingMDS();
		MappingProjection projection = new MappingProjection();
		if (algorithm.equals("kmeans")) {
			result = mappingClustering.clusterKmeans(arr, 2);
		} else if (algorithm.equals("xmeans")) {
			result = mappingClustering.clusterXmeans(arr);
		} else if (algorithm.equals("gmeans")) {
			result = mappingClustering.clusterGmeans(arr);
		} else if (algorithm.equals("mds")) {
			result = mappingMDS.MDSmds(arr);
		} else if (algorithm.equals("isomds")) {
			result = mappingMDS.MDSisomds(arr);
		} else if (algorithm.equals("sammon")) {
			result = mappingMDS.MDSsammon(arr);
		} else if (algorithm.equals("pca")) {
			result = projection.projectionPCA(arr);
		} else {
			return null;
		}
		Tools tools = new Tools();
		if (result[0] > result[result.length - 1]) {
			result = tools.reverseArray(result);
		}
		result = tools.minMaxNormalization(result, a, b);

		String[] head = rows[0].split(",", 2);
		String numberSpace = tools.doublrToString(result);
		String psychometricSpace = head[1];
//		System.out.println(numberSpace);
//		System.out.println(psychometricSpace);

		try {
//			com.mongodb.client.MongoClient mongoClient = MongoClients.create(
//					"mongodb+srv://hao:c1SkRR0inlNhjqWF@cluster0.ap9gn.mongodb.net/myFirstDatabase?retryWrites=true&w=majority");

			MongoDatabase mongoDatabase = mongoClient.getDatabase("mycol");
			MongoCollection<Document> collection = mongoDatabase.getCollection("Mapping");
			Document document = new Document("numberSpace", numberSpace).append("psychometricSpace", psychometricSpace)
					.append("algorithm", algorithm);
			collection.insertOne(document);
		} catch (Exception e) {
			System.err.println(e.getClass().getName() + ": " + e.getMessage());
		}
		return "pagedata";
	}

}
