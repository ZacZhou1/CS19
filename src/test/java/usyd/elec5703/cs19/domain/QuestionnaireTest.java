package usyd.elec5703.cs19.domain;

import static org.junit.Assert.*;

import org.junit.Test;

public class QuestionnaireTest {

	@Test
	public void testGetandSetID() {
		Questionnaire questionnaire = new Questionnaire();
		assertNull(questionnaire.getId());
		questionnaire.setId("1");
		assertEquals("1", questionnaire.getId());
	}
	
	
	@Test
	public void testGetandSetTheme() {
		Questionnaire questionnaire = new Questionnaire();
		assertNull(questionnaire.getTheme());
		questionnaire.setTheme("color");
		assertEquals("color", questionnaire.getTheme());
	}
	
	
	@Test
	public void testGetandSetMinValue() {
		Questionnaire questionnaire = new Questionnaire();
		assertNull(questionnaire.getMinvalue());
		questionnaire.setMinvalue("0");
		assertEquals("0", questionnaire.getMinvalue());
	}
	
	
	@Test
	public void testGetandSetMaxValue() {
		Questionnaire questionnaire = new Questionnaire();
		assertNull(questionnaire.getMaxvalue());
		questionnaire.setMaxvalue("10");
		assertEquals("10", questionnaire.getMaxvalue());
	}
	
	@Test
	public void testGetandSetDescriptionNumber() {
		Questionnaire questionnaire = new Questionnaire();
		assertNull(questionnaire.getDescriptionnumber());
		questionnaire.setDescriptionnumber("5");
		assertEquals("5", questionnaire.getDescriptionnumber());
	}
	
	
	@Test
	public void testGetandSetDescriptions() {
		Questionnaire questionnaire = new Questionnaire();
		assertNull(questionnaire.getDescriptions());
		questionnaire.setDescriptions("not happy");
		assertEquals("not happy", questionnaire.getDescriptions());
	}
	
	@Test
	public void testGetandSetToString() {
		Questionnaire questionnaire = new Questionnaire("1","color","0","10","5","happy");
		assertEquals("Questionnaire [id=1, theme=color, minvalue=0, maxvalue=10, descriptionnumber=5, descriptions=happy]", questionnaire.toString());
	}

}
