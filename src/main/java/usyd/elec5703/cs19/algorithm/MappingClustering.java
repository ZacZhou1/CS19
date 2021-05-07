package usyd.elec5703.cs19.algorithm;

import smile.clustering.GMeans;
import smile.clustering.KMeans;
import smile.clustering.XMeans;
import usyd.elec5703.cs19.utils.Tools;

public class MappingClustering {
	
	Tools tools= new Tools();
	
	public double[] clusterKmeans(double[][] arr, int k) {
		if (arr == null) {
			return null;
		}
		double[] result = new double[arr[0].length];
		if (arr.length == 1) {
			for (int i = 0; i < result.length; i++) {
				result[i] = arr[0][i];
			}
			return tools.doubleScaleArr(result);
		}
		KMeans kMeans = KMeans.fit(arr, k);
		double[][] centroids = kMeans.centroids;
		
		for (int i = 0; i < result.length; i++) {
			double sum = 0;
			for (int j = 0; j < centroids.length; j++) {
				sum += centroids[j][i];
			}
			result[i] = sum/k;
		}
		return tools.doubleScaleArr(result);
	}
	
	public double[] clusterXmeans(double[][] arr) {
		if (arr == null) {
			return null;
		}
		XMeans xMeans = XMeans.fit(arr, 50);
		double[][] centroids = xMeans.centroids;
		int k = xMeans.k;
		double[] result = new double[arr[0].length];
		if (k == 1) {
			for (int i = 0; i < result.length; i++) {
				result[i] = centroids[0][i];
			}
		}else if (k >=2) {
			for (int i = 0; i < result.length; i++) {
				double sum = 0;
				for (int j = 0; j < centroids.length; j++) {
					sum += centroids[j][i];
				}
				result[i] = sum/k;
			}
		}
		return tools.doubleScaleArr(result);
	}
	
	public double[] clusterGmeans(double[][] arr) {
		if (arr == null) {
			return null;
		}
		GMeans gMeans = GMeans.fit(arr, 50);
		double[][] centroids = gMeans.centroids;
		int k = gMeans.k;
		double[] result = new double[arr[0].length];
		if (k == 1) {
			for (int i = 0; i < result.length; i++) {
				result[i] = centroids[0][i];
			}
		}else if (k >=2) {
			for (int i = 0; i < result.length; i++) {
				double sum = 0;
				for (int j = 0; j < centroids.length; j++) {
					sum += centroids[j][i];
				}
				result[i] = sum/k;
			}
		}
		return tools.doubleScaleArr(result);
	}
}
