package usyd.elec5703.cs19.algorithm;

import smile.projection.PCA;
import usyd.elec5703.cs19.utils.Tools;

public class MappingProjection {
	
	Tools tools = new Tools();
	
	public double[] projectionPCA(double[][] arr) {
		if (arr == null) {
			return null;
		}
		double[][] reverse = reverseArr(arr);
		PCA pca = PCA.fit(reverse);
		pca.setProjection(1);
		double[][] coordinates = pca.project(reverse);
		int col =  arr[0].length;
		double[] result = new double[col];
		for (int i = 0; i < col; i++) {
			result[i] = coordinates[i][0];
		}
		return tools.doubleScaleArr(result);
	}
	public double[][] reverseArr(double[][] arr) {
		int row = arr.length;
		int col = arr[0].length;
		double[][] reverse = new double[col][row];
		for (int i = 0; i < col; i++) {
			for (int j = 0; j < row; j++) {
				reverse[i][j] = arr[j][i];
			}
		}
		return reverse;
	}

}
