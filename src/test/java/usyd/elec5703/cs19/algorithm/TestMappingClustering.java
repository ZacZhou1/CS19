package usyd.elec5703.cs19.algorithm;

import java.util.Arrays;

import junit.framework.TestCase;

public class TestMappingClustering extends TestCase{
	private MappingClustering mappingClustering;
	
	
	double[][] arrTest =  {{1,2,3,4,5}};
	
	double[][] arrTest2 =  {{1,2,3,4,9},{1,4,5,8,9},{1,5,6,8,9}};
	
	protected void setUp() throws Exception {
		mappingClustering = new MappingClustering();
	}
	
	public void testclusterKmeans1() {
		double[][] arr = null;
		assertNull(mappingClustering.clusterKmeans(arr, 2));
	}
	
	public void testclusterKmeans2() {
		double[] result=mappingClustering.clusterKmeans(arrTest, 2);
		assertEquals(Arrays.toString(result), "[1.0, 2.0, 3.0, 4.0, 5.0]");
	}
	
	public void testclusterKmeans3() {
		double[] result=mappingClustering.clusterKmeans(arrTest2, 2);
		assertEquals(Arrays.toString(result), "[1.0, 3.25, 4.25, 6.0, 9.0]");
	}
	
	
	public void testclusterXmeans1() {
		double[][] arr = null;
		assertNull(mappingClustering.clusterXmeans(arr));
	}
	
	public void testclusterXmeans2() {
		double[] result=mappingClustering.clusterXmeans(arrTest);
		assertEquals(Arrays.toString(result), "[1.0, 2.0, 3.0, 4.0, 5.0]");
	}
	
	
	public void testclusterXmeans3() {
		double[] result=mappingClustering.clusterXmeans(arrTest2);
		assertEquals(Arrays.toString(result), "[1.0, 3.67, 4.67, 6.67, 9.0]");
	}
	
	
	public void testclusterGmeans1() {
		double[][] arr = null;
		assertNull(mappingClustering.clusterGmeans(arr));
	}
	
	public void testclusterGmeans2() {
		double[] result=mappingClustering.clusterGmeans(arrTest);
		assertEquals(Arrays.toString(result), "[1.0, 2.0, 3.0, 4.0, 5.0]");
	}
	public void testclusterGmeans3() {
		double[] result=mappingClustering.clusterGmeans(arrTest2);
		assertEquals(Arrays.toString(result), "[1.0, 3.67, 4.67, 6.67, 9.0]");
	}

}
