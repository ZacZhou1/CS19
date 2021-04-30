package usyd.elec5703.cs19.utils;

import java.math.BigDecimal;

public class Tools {
	
	
	public String arrayToString(String[] arr ) {
		String s = "";
		for (int i = 0; i < arr.length-1; i++) {
			s = s+arr[i] +",";
		}
		s = s+arr[arr.length-1];
		return s;
	}
	
	public String doublrToString(double[] arr) {
		String s = "";
		for (int i = 0; i < arr.length-1; i++) {
			s = s+arr[i] +",";
		}
		s = s+arr[arr.length-1];
		return s;
	}
	
	public double differenceValue(double[] ns, double[] ns2) {
		int sum = 0;
		for (int i = 0; i < ns2.length; i++) {
			sum += Math.abs(ns[i]-ns2[i]);
		}
		return sum;
		
	}
	
	public Double doubleScale(Double num) {
		BigDecimal b = new BigDecimal(num);
		Double numDouble  = b.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
		return numDouble;
	}
	
	
	public double[] doubleScaleArr(double[] arr) {
		for (int i = 0; i < arr.length; i++) {
			arr[i] = doubleScale(arr[i]);
		}
		return arr;
		
	}


	
//	public static void main(String[] args) {
//		Tools tools =  new Tools();
//		System.out.println(tools.arrayToString(new String[]{"a","b","v"}));
//	}

}
