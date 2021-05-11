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
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;

import usyd.elec5703.cs19.algorithm.MappingClustering;
import usyd.elec5703.cs19.algorithm.MappingMDS;
import usyd.elec5703.cs19.algorithm.MappingProjection;
import usyd.elec5703.cs19.domain.Data;
import usyd.elec5703.cs19.domain.DocumentData;
import usyd.elec5703.cs19.utils.Tools;

@Controller("mapping")
public class MappingController {
	@RequestMapping(value = "mapping/guide", method = RequestMethod.GET)
	public String mappingGuide() {
		return "pageguide";
	}
	
	
	@RequestMapping(value = "mapping/upload", method = RequestMethod.GET)
	public String mappingUpload() {
		return "pageupload";
	}
	
	@RequestMapping(value = "mapping/data", method = RequestMethod.GET)
	public ModelAndView mappingData() {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Data> list = new ArrayList<Data>();

		try {

			MongoClient mongoClient = new MongoClient("localhost", 27017);
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
				Data data = new Data(idString, psychometricSpace, numericSpace,algorithm);				
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
		String idString ="";
		String algorithmtype ="";
		String psychometricSpace = "";
		String numericSpace = "";
		Data data = new Data();
		try {

			MongoClient mongoClient = new MongoClient("localhost", 27017);
			MongoDatabase mongoDatabase = mongoClient.getDatabase("mycol");

			BasicDBObject queryObject = new BasicDBObject("_id",new ObjectId(id));
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
		
		double[][] arr = new double[rows.length-1][cols.length-1];
		for (int i = 1; i < rows.length; i++) {
			String[] colData = rows[i].split(",");
			
			for (int j = 1; j < colData.length; j++) {
				try {
					arr[i-1][j-1]= Double.parseDouble(colData[j]);
				} catch (NumberFormatException e) {
					e.printStackTrace();
				}
			}
		}
		
		double sumA = 0;
		double sumB = 0;
		for (int i = 0; i < rows.length-1; i++) {
			sumA += arr[i][0];
			sumB += arr[i][cols.length-2];
		}
		
		double a= sumA/(rows.length-1);
		double b= sumB/(rows.length-1);
		
//		for (double[] ds : arr) {
//			System.out.println(Arrays.toString(ds));
//		}
		double[] result = null;
		MappingClustering mappingClustering = new MappingClustering();
		MappingMDS mappingMDS =  new MappingMDS();
		MappingProjection projection =  new MappingProjection();
		if (algorithm.equals("kmeans")) {
			result = mappingClustering.clusterKmeans(arr, 2);
		}else if(algorithm.equals("xmeans")){
			result = mappingClustering.clusterXmeans(arr);
		}else if(algorithm.equals("gmeans")){
			result = mappingClustering.clusterGmeans(arr);
		}else if(algorithm.equals("mds")){
			result =mappingMDS.MDSmds(arr);
		}else if(algorithm.equals("isomds")){
			result = mappingMDS.MDSisomds(arr);
		}else if(algorithm.equals("sammon")){
			result = mappingMDS.MDSsammon(arr);
		}else if(algorithm.equals("pca")){
			result = projection.projectionPCA(arr);
		}else {
			return null;
		}
		Tools tools = new Tools();
		if (result[0]>result[result.length-1]) {
			result = tools.reverseArray(result);
		}
		result =  tools.minMaxNormalization(result, a, b);
		
		String[] head = rows[0].split(",", 2);
		String numberSpace= tools.doublrToString(result);
		String psychometricSpace = head[1];
//		System.out.println(numberSpace);
//		System.out.println(psychometricSpace);
		
		try {
			MongoClient mongoClient = new MongoClient("localhost", 27017);
			MongoDatabase mongoDatabase = mongoClient.getDatabase("mycol");
			MongoCollection<Document> collection = mongoDatabase.getCollection("Mapping");
			Document document = new Document("numberSpace", numberSpace).append("psychometricSpace", psychometricSpace).append("algorithm", algorithm);
			collection.insertOne(document);
		} catch (Exception e) {
			System.err.println(e.getClass().getName() + ": " + e.getMessage());
		}
		return "pagedata";
	}

}
