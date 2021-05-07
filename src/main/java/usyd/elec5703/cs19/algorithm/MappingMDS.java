package usyd.elec5703.cs19.algorithm;

import smile.mds.IsotonicMDS;
import smile.mds.MDS;
import smile.mds.SammonMapping;
import usyd.elec5703.cs19.utils.Tools;

public class MappingMDS {
	Tools tools =  new Tools();
	
	
	public double[] MDSmds(double[][] arr) {
		if (arr == null) {
			return null;
		}
		double[][] proxi = arrayToProximity(arr);
		int col =  proxi.length;
		double[][] coordinates  =MDS.of(proxi, 1).coordinates;
		double[] result = new double[col];
		for (int i = 0; i < result.length; i++) {
			result[i] = coordinates[i][0];
		}
		return tools.doubleScaleArr(result);
	}
	
	public double[] MDSisomds(double[][] arr) {
		if (arr == null) {
			return null;
		}
		double[][] proxi = arrayToProximity(arr);
		int col =  proxi.length;
		double[][] coordinates  =IsotonicMDS.of(proxi, 1).coordinates;
		double[] result = new double[col];
		for (int i = 0; i < result.length; i++) {
			result[i] = coordinates[i][0];
		}
		return tools.doubleScaleArr(result);
	}
	
	
	public double[] MDSsammon(double[][] arr) {
		if (arr == null) {
			return null;
		}
		double[][] proxi = arrayToProximity(arr);
		int col =  proxi.length;
		double[][] coordinates  =SammonMapping.of(proxi, 1).coordinates;
		double[] result = new double[col];
		for (int i = 0; i < result.length; i++) {
			result[i] = coordinates[i][0];
		}
		return tools.doubleScaleArr(result);
	}

	public double[][] arrayToProximity(double[][] arr) {
		int col =  arr[0].length;
		double[] arrOne = new double[col];
		for (int i = 0; i < col; i++) {
			int sum = 0;
			for (int j = 0; j < arr.length; j++) {
				sum += arr[j][i];
			}
			arrOne[i] = sum;
		}
		
		double[][] proximity =  new double[col][col];
		for (int i = 0; i < proximity.length; i++) {
			for (int j = 0; j < proximity.length; j++) {
				proximity[i][j] = Math.abs( arrOne[i] - arrOne[j]);
			}
		}
		return proximity;
	}

}
