package usyd.elec5703.cs19.utils;

import java.math.BigDecimal;

public class Tools {
	
	
	public String arrayToString(String[] arr ) {
		if (arr.length == 0) {
			return null;
		}
		String s = "";
		for (int i = 0; i < arr.length-1; i++) {
			s = s+arr[i] +",";
		}
		s = s+arr[arr.length-1];
		return s;
	}
	
	public String doublrToString(double[] arr) {
		if (arr.length == 0) {
			return null;
		}
		String s = "";
		for (int i = 0; i < arr.length-1; i++) {
			s = s+arr[i] +",";
		}
		s = s+arr[arr.length-1];
		return s;
	}
	
	public Double differenceValue(double[] ns, double[] ns2) {
		if (ns ==null ||ns2 == null||ns.length!=ns2.length) {
			return null;
		}
		double sum = 0;
		for (int i = 0; i < ns2.length; i++) {
			sum += Math.abs(ns[i]-ns2[i]);
		}
		return sum;
	}
	
	public Double doubleScale(Double num) {
		if (num == null) {
			return null;
		}
		BigDecimal b = new BigDecimal(num);
		Double numDouble  = b.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
		return numDouble;
	}
	
	
	public double[] doubleScaleArr(double[] arr) {
		if (arr.length == 0) {
			return null;
		}
		for (int i = 0; i < arr.length; i++) {
			arr[i] = doubleScale(arr[i]);
		}
		return arr;
	}
	
	public double[] minMaxNormalization(double[] arr, double a, double b) {
		Double min = Double.MAX_VALUE;
		Double max = Double.MIN_VALUE;
		for (int i = 0; i < arr.length; i++) {
			if (arr[i]<min) {
				min = arr[i];
			}
			if (arr[i]>max) {
				max = arr[i];
			}
		}
		for (int i = 0; i < arr.length; i++) {
			arr[i] = a + (arr[i]-min)*(b-a)/(max - min);
			
		}
		return doubleScaleArr(arr);
	}
	
	public double[] reverseArray(double[] Array) {
		if (Array.length==0) {
			return null;
		}
		double[] new_array = new double[Array.length];
		for (int i = 0; i < Array.length; i++) {
			new_array[i] = Array[Array.length - i - 1];
		}
		return new_array;
	}
	
//
//
//	
//	public static void main(String[] args) {
//		Tools tools =  new Tools();
//		double[] arr =  new double[]{7,-1,-3,-5,-7};
//		
//		arr = tools.minMaxNormalization(arr,0,5);
//		System.out.println(Arrays.toString(arr));
//		
//	}

}
