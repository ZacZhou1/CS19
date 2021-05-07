package usyd.elec5703.cs19.algorithm;

import java.util.Arrays;

import junit.framework.TestCase;

public class TestMappingProjection extends TestCase{
	
	private MappingProjection mappingProjection ;
	
	
	double[][] arrTest =  {{1,2,3,4,5}};
	
	double[][] arrTest2 =  {{1,2,3,4,9},{1,4,5,8,9},{1,5,6,8,9}};
	
	protected void setUp() throws Exception {
		mappingProjection = new MappingProjection();
	}
	
	public void testProjectionPCA1() {
		double[][] arr = null;
		assertNull(mappingProjection.projectionPCA(arr));
		
	}
	
	public void testProjectionPCA2() {
		double[] result = mappingProjection.projectionPCA(arrTest);
		
		assertEquals(Arrays.toString(result), "[-2.0, -1.0, 0.0, 1.0, 2.0]");
		
	}
	
	public void testProjectionPCA3() {
		double[] result = mappingProjection.projectionPCA(arrTest2);
		assertEquals(Arrays.toString(result), "[-6.97, -2.3, -0.56, 2.95, 6.88]");
	}

}
