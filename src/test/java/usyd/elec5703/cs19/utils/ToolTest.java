package usyd.elec5703.cs19.utils;

import java.util.Arrays;

import junit.framework.TestCase;

public class ToolTest extends TestCase {
	private Tools tools;

	protected void setUp() throws Exception {
		tools = new Tools();
	}

	public void testArrayToString1() {
		String[] arr = null;
		assertNull(arr);
		arr = new String[] {};
		String string = tools.arrayToString(arr);
		assertEquals(string, null);
	}

	public void testArrayToString2() {
		String[] arr = null;
		assertNull(arr);
		arr = new String[] { "a" };
		String string = tools.arrayToString(arr);
		assertEquals(string, "a");
	}

	public void testArrayToString3() {
		String[] arr = null;
		assertNull(arr);
		arr = new String[] { "a", "a" };
		String string = tools.arrayToString(arr);
		assertEquals(string, "a,a");
	}

	public void testArrayToString4() {
		String[] arr = null;
		assertNull(arr);
		arr = new String[] { "a", "b", "1", "d" };
		String string = tools.arrayToString(arr);
		assertEquals(string, "a,b,1,d");
	}

	public void testDoublrToString1() {
		double[] arr = null;
		assertNull(arr);
		arr = new double[] {};
		String string = tools.doublrToString(arr);
		assertEquals(string, null);

	}

	public void testDoublrToString2() {
		double[] arr = null;
		assertNull(arr);
		arr = new double[] { 1 };
		String string = tools.doublrToString(arr);
		assertEquals(string, "1.0");
	}

	public void testDoublrToString3() {
		double[] arr = null;
		assertNull(arr);
		arr = new double[] { 1, 2 };
		String string = tools.doublrToString(arr);
		assertEquals(string, "1.0,2.0");
	}

	public void testDoublrToString4() {
		double[] arr = null;
		assertNull(arr);
		arr = new double[] { -1, 2 };
		String string = tools.doublrToString(arr);
		assertEquals(string, "-1.0,2.0");
	}

	public void testDoublrToString5() {
		double[] arr = null;
		assertNull(arr);
		arr = new double[] { 0, 0 };
		String string = tools.doublrToString(arr);
		assertEquals(string, "0.0,0.0");
	}

	public void testDoublrToString6() {
		double[] arr = null;
		assertNull(arr);
		arr = new double[] { 0.11111, 0 };
		String string = tools.doublrToString(arr);
		assertEquals(string, "0.11111,0.0");
	}

	public void testdifferenceValue1() {
		double[] arr1 = null;
		assertNull(arr1);
		double[] arr2 = null;
		assertNull(arr2);
		assertNull(tools.differenceValue(arr1, arr2));
	}

	public void testdifferenceValue2() {
		double[] arr1 = null;
		assertNull(arr1);
		double[] arr2 = null;
		assertNull(arr2);
		arr2 = new double[] { 1 };
		assertNull(tools.differenceValue(arr1, arr2));
	}

	public void testdifferenceValue3() {
		double[] arr1 = null;
		assertNull(arr1);
		double[] arr2 = null;
		assertNull(arr2);
		arr1 = new double[] { 1, 2 };
		arr2 = new double[] { 1 };
		assertNull(tools.differenceValue(arr1, arr2));
	}

	public void testdifferenceValue4() {
		double[] arr1 = null;
		assertNull(arr1);
		double[] arr2 = null;
		assertNull(arr2);
		arr1 = new double[] { 0 };
		arr2 = new double[] { 0 };
		assertEquals(tools.differenceValue(arr1, arr2), 0.0);
	}

	public void testdifferenceValue5() {
		double[] arr1 = null;
		assertNull(arr1);
		double[] arr2 = null;
		assertNull(arr2);
		arr1 = new double[] { -1 };
		arr2 = new double[] { 1 };
		assertEquals(tools.differenceValue(arr1, arr2), 2.0);
	}

	public void testdifferenceValue6() {
		double[] arr1 = null;
		assertNull(arr1);
		double[] arr2 = null;
		assertNull(arr2);
		arr1 = new double[] { 1 };
		arr2 = new double[] { -1 };
		assertEquals(tools.differenceValue(arr1, arr2), 2.0);
	}

	public void testdifferenceValue7() {
		double[] arr1 = null;
		assertNull(arr1);
		double[] arr2 = null;
		assertNull(arr2);
		arr1 = new double[] { 1, 1 };
		arr2 = new double[] { -1, -1 };
		assertEquals(tools.differenceValue(arr1, arr2), 4.0);
	}

	public void testdifferenceValue8() {
		double[] arr1 = null;
		assertNull(arr1);
		double[] arr2 = null;
		assertNull(arr2);
		arr1 = new double[] { 1, -1 };
		arr2 = new double[] { -1, -1 };
		assertEquals(tools.differenceValue(arr1, arr2), 2.0);
	}

	public void testdifferenceValue9() {
		double[] arr1 = null;
		assertNull(arr1);
		double[] arr2 = null;
		assertNull(arr2);
		arr1 = new double[] { 1, 1, 1, 1, 1, 1, 1, 1 };
		arr2 = new double[] { 1, 1, 1, 1, 1, 1, 1, 1 };
		assertEquals(tools.differenceValue(arr1, arr2), 0.0);
	}

	public void testDoubleScale1() {
		Double num = null;
		assertNull(num);
		assertEquals(tools.doubleScale(num), null);
	}

	public void testDoubleScale2() {
		Double num = null;
		assertNull(num);
		num = 0.0;

		assertEquals(tools.doubleScale(num), 0.00);
	}

	public void testDoubleScale3() {
		Double num = null;
		assertNull(num);
		num = -1.0;

		assertEquals(tools.doubleScale(num), -1.00);
	}

	public void testDoubleScale4() {
		Double num = null;
		assertNull(num);
		num = 1.50000;
		assertEquals(tools.doubleScale(num), 1.50);
	}

	public void testDoubleScale5() {
		Double num = null;
		assertNull(num);
		num = 1.50001;
		assertEquals(tools.doubleScale(num), 1.50);
	}

	public void testDoubleScale6() {
		Double num = null;
		assertNull(num);
		num = 1.505;
		assertEquals(tools.doubleScale(num), 1.50);
	}

	public void testDoubleScale7() {
		Double num = null;
		assertNull(num);
		num = 1.555;
		assertEquals(tools.doubleScale(num), 1.55);
	}

	public void testDoubleScaleArr1() {
		double[] num = null;
		assertNull(num);
		num = new double[] {};
		assertNull(tools.doubleScaleArr(num));
	}

	public void testDoubleScaleArr2() {
		double[] num = null;
		assertNull(num);
		num = new double[] { 0 };
		assertEquals(Arrays.toString(tools.doubleScaleArr(num)), "[0.0]");
	}

	public void testDoubleScaleArr3() {
		double[] num = null;
		assertNull(num);
		num = new double[] { 0, -1.1, 1.2, 1.1111, 5.43553, -99 };
		assertEquals(Arrays.toString(tools.doubleScaleArr(num)), "[0.0, -1.1, 1.2, 1.11, 5.44, -99.0]");
	}

	public void testMinMaxNormalization1() {
		double[] num = null;
		assertNull(num);
		num = new double[] { -2, -1, 0, 1, 2 };
		assertEquals(Arrays.toString(tools.minMaxNormalization(num, -2, 2)), "[-2.0, -1.0, 0.0, 1.0, 2.0]");
	}

	public void testMinMaxNormalization2() {
		double[] num = null;
		assertNull(num);
		num = new double[] { -2, -1, 0, 1, 2 };
		assertEquals(Arrays.toString(tools.minMaxNormalization(num, -1, 1)), "[-1.0, -0.5, 0.0, 0.5, 1.0]");
	}

	public void testMinMaxNormalization3() {
		double[] num = null;
		assertNull(num);
		num = new double[] { -2, -1, 0, 1, 2 };
		assertEquals(Arrays.toString(tools.minMaxNormalization(num, -5, 5)), "[-5.0, -2.5, 0.0, 2.5, 5.0]");
	}

	public void testMinMaxNormalization4() {
		double[] num = null;
		assertNull(num);
		num = new double[] { -2, -1, 0, 1, 2 };
		assertEquals(Arrays.toString(tools.minMaxNormalization(num, 0, 5)), "[0.0, 1.25, 2.5, 3.75, 5.0]");
	}

	public void testMinMaxNormalization5() {
		double[] num = null;
		assertNull(num);
		num = new double[] { -2, -1, 0, 1, 2 };
		assertEquals(Arrays.toString(tools.minMaxNormalization(num, -5, 0)), "[-5.0, -3.75, -2.5, -1.25, 0.0]");
	}

	public void testMinMaxNormalization6() {
		double[] num = null;
		assertNull(num);
		num = new double[] { 2, 1, 0, -1, -2 };
		assertEquals(Arrays.toString(tools.minMaxNormalization(num, -5, 0)), "[0.0, -1.25, -2.5, -3.75, -5.0]");
	}

	public void testMinMaxNormalization7() {
		double[] num = null;
		assertNull(num);
		num = new double[] { 2, 1, 0, -1, -2 };
		assertEquals(Arrays.toString(tools.minMaxNormalization(num, 0, 5)), "[5.0, 3.75, 2.5, 1.25, 0.0]");
	}

	public void testMinMaxNormalization8() {
		double[] num = null;
		assertNull(num);
		num = new double[] { 2, 1, 0, -1, -2 };
		assertEquals(Arrays.toString(tools.minMaxNormalization(num, 0, -5)), "[-5.0, -3.75, -2.5, -1.25, 0.0]");
	}

	public void testReverseArray1() {
		double[] num = null;
		assertNull(num);
		num = new double[] {};
		assertNull(tools.reverseArray(num));
	}

	public void testReverseArray2() {
		double[] num = null;
		assertNull(num);
		num = new double[] { 1 };
		assertEquals(Arrays.toString(tools.reverseArray(num)), "[1.0]");
	}

	public void testReverseArray3() {
		double[] num = null;
		assertNull(num);
		num = new double[] { 1, 2, 3 };
		assertEquals(Arrays.toString(tools.reverseArray(num)), "[3.0, 2.0, 1.0]");
	}

}
