package usyd.elec5703.cs19;

import org.apache.commons.math3.fitting.PolynomialCurveFitter;
import org.apache.commons.math3.fitting.WeightedObservedPoints;

public class CurveFit {
	
	DoubleScale doubleScale = new DoubleScale();
	
	public  double[] curveFit(double[] inputDataX, double[] inputDataY){
		WeightedObservedPoints points = new WeightedObservedPoints();
		for (int i = 0; i < inputDataY.length; i++) {
			points.add(inputDataX[i], inputDataY[i]);
		}
		PolynomialCurveFitter fitter = PolynomialCurveFitter.create(3);
		double[] result = fitter.fit(points.toList());
		for (int i = 0; i < result.length; i++) {
			Double f1  = doubleScale.doubleScale(result[i]);
			result[i] = f1;
		}
		return result;
	}

}
