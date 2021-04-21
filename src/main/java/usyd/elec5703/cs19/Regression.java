package usyd.elec5703.cs19;

import java.util.ArrayList;

import smile.interpolation.CubicSplineInterpolation1D;
import smile.interpolation.LinearInterpolation;
import smile.interpolation.ShepardInterpolation1D;

public class Regression {
	DoubleScale doubleScale = new DoubleScale();
	
	public ArrayList<Double> cubicSpline(double[] inputDataX, double[] inputDataY){
		CubicSplineInterpolation1D cubic = new CubicSplineInterpolation1D(inputDataX, inputDataY);
		ArrayList<Double> arrayList = new ArrayList<Double>();
		for (double i = 0; i < inputDataX[inputDataX.length - 1 ] + 1; i = i+0.1) {
			Double num = cubic.interpolate(i);
			Double numDouble  = doubleScale.doubleScale(num);		
			arrayList.add(numDouble);
		}
		return arrayList;
		
	}
	
	public ArrayList<Double> linearInterpolation(double[] inputDataX, double[] inputDataY){
		LinearInterpolation linear = new LinearInterpolation(inputDataX, inputDataY);
		ArrayList<Double> arrayList = new ArrayList<Double>();
		for (double i = 0; i < inputDataX[inputDataX.length - 1 ] + 1; i = i+0.1) {
			Double num = linear.interpolate(i);
			Double numDouble  = doubleScale.doubleScale(num);		
			arrayList.add(numDouble);
		}
		return arrayList;
	}
	
	public ArrayList<Double> shepardInterpolation(double[] inputDataX, double[] inputDataY){
		ShepardInterpolation1D shepard = new ShepardInterpolation1D(inputDataX, inputDataY,3);
		ArrayList<Double> arrayList = new ArrayList<Double>();
		for (double i = 0; i < inputDataX[inputDataX.length - 1 ] + 1; i = i+0.1) {
			Double num = shepard.interpolate(i);
			Double numDouble  = doubleScale.doubleScale(num);		
			arrayList.add(numDouble);
		}
		return arrayList;
	}

}
