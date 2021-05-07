package usyd.elec5703.cs19.domain;

import junit.framework.TestCase;

public class DataTest extends TestCase {
	private Data data;

	protected void setUp() throws Exception {
		data = new Data();
	}

	public void testSetandGetIdString() {
		assertNull(data.getIdString());
		String idString = "abc123";
		data.setIdString(idString);
		assertEquals(data.getIdString(), idString);
	}

	public void testSetandGetpsychometricSpace() {
		assertNull(data.getPsychometricSpace());
		String psychometricSpace = "happy";
		data.setPsychometricSpace(psychometricSpace);
		assertEquals(data.getPsychometricSpace(), psychometricSpace);
	}

	public void testSetandGetNumericSpace() {
		assertNull(data.getNumericSpace());
		String numericSpace = "123";
		data.setNumericSpace(numericSpace);
		assertEquals(data.getNumericSpace(), numericSpace);
	}

	public void testSetandGetAlgorithm() {
		assertNull(data.getAlgorithm());
		String algorithm = "pca";
		data.setAlgorithm(algorithm);
		assertEquals(data.getAlgorithm(), algorithm);
	}

}
