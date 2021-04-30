package usyd.elec5703.cs19.algorithm;

import java.util.Arrays;

public class MappingTest {

	public static void main(String[] args) {

		double[][] ns = { 
				{ 0, 2, 4, 6 }, 
				{ 0.2, 1, 3.5, 5 }, 
				{ 0.2, 1.2, 3, 4.6 } };
		double[] result = null;
		MappingClustering mappingClustering = new MappingClustering();
		MappingMDS mappingMDS =  new MappingMDS();
		MappingProjection projection =  new MappingProjection();
		

		result = mappingClustering.clusterKmeans(ns, 2);
		System.out.println("------------------------------");
		System.out.println("Cluster");
		System.out.println("The result of Kmeans");
		System.out.println(Arrays.toString(result));
		System.out.println();
		
		result =  mappingClustering.clusterXmeans(ns);
		System.out.println("The result of Xmeans");
		System.out.println(Arrays.toString(result));
		System.out.println();
		
		result = mappingClustering.clusterGmeans(ns);
		System.out.println("The result of Gmeans");
		System.out.println(Arrays.toString(result));
		System.out.println();
		
		
		System.out.println("------------------------------");
		System.out.println("MDS");
		double[][] proxi = mappingMDS.arrayToProximity(ns);
		System.out.println("The proximity matrix");
		for (double[] ds : proxi) {
			System.out.println(Arrays.toString(ds));
		}
		System.out.println();
		
		result = mappingMDS.MDSmds(ns);
		System.out.println("The result of MDS");
		System.out.println(Arrays.toString(result));
		System.out.println();
		
		result = mappingMDS.MDSisomds(ns);
		System.out.println("The result of isomds");
		System.out.println(Arrays.toString(result));
		System.out.println();
		
		result = mappingMDS.MDSsammon(ns);
		System.out.println("The result of sammon's mapping");
		System.out.println(Arrays.toString(result));
		System.out.println();
		
		
		
		System.out.println("------------------------------");
		System.out.println("Projection");
		result = projection.projectionPCA(ns);
		System.out.println("The result of PCA");
		System.out.println(Arrays.toString(result));
		System.out.println();
	}

}
