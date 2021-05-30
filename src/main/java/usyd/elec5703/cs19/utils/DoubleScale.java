package usyd.elec5703.cs19.utils;

import java.math.BigDecimal;

import org.bson.Document;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;

//public class DoubleScale {
//
//	public Double doubleScale(Double num) {
//		BigDecimal b = new BigDecimal(num);
//		Double numDouble = b.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
//		return numDouble;
//	}
//
//	public static void main(String[] args) {
////		MongoClient mongoClient = MongoClients.create(
////			    "mongodb+srv://hao:<c1SkRR0inlNhjqWF>@cluster0.ap9gn.mongodb.net/myFirstDatabase?retryWrites=true&w=majority");
////			
//
//		MongoClient mongoClient = MongoClients.create(
//				"mongodb+srv://hao:c1SkRR0inlNhjqWF@cluster0.ap9gn.mongodb.net/myFirstDatabase?retryWrites=true&w=majority");
//		MongoDatabase mongoDatabase = mongoClient.getDatabase("mycol");
//
//		MongoCollection<Document> collection = mongoDatabase.getCollection("Mapping");
//
//		Document document = new Document("userName", "hao");
//		collection.insertOne(document);
//	}
//
//}
