package usyd.elec5703.cs19.algorithm;

import java.util.Arrays;

import junit.framework.TestCase;

public class TestMappingMDS extends TestCase{
	private MappingMDS mappingMDS;
	
	
	double[][] arrTest =  {{1,2,3,4,5}};
	
	double[][] arrTest2 =  {{1,2,3,4,9},{1,4,5,8,9},{1,5,6,8,9}};
	
	protected void setUp() throws Exception {
		mappingMDS = new MappingMDS();
	}
	
	public void testMDSmds1() {
		double[][] arr = null;
		assertNull(mappingMDS.MDSmds(arr));
	}
	
	public void testMDSmds2() {
		double[] result = mappingMDS.MDSmds(arrTest);
		assertEquals(Arrays.toString(result), "[-2.0, -1.0, 0.0, 1.0, 2.0]");
	}
	
	public void testMDSmds3() {
		double[] result = mappingMDS.MDSmds(arrTest2);
		assertEquals(Arrays.toString(result), "[12.0, 4.0, 1.0, -5.0, -12.0]");
	}
	
	
	public void testMDSisomds1() {
		double[][] arr = null;
		assertNull(mappingMDS.MDSisomds(arr));
	}
	
	
	public void testMDSsammon1() {
		double[][] arr = null;
		assertNull(mappingMDS.MDSsammon(arr));
	}
	
	
	public void testMDSsammon2() {
		double[] result = mappingMDS.MDSisomds(arrTest2);
		assertEquals(Arrays.toString(result), "[12.0, 4.0, 1.0, -5.0, -12.0]");
		
	}
	
	public void testMDSsammon3() {
		double[] result = mappingMDS.MDSsammon(arrTest2);
		assertEquals(Arrays.toString(result), "[12.0, 4.0, 1.0, -5.0, -12.0]");
		
	}

}
