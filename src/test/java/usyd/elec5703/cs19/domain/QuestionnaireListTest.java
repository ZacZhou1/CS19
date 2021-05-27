package usyd.elec5703.cs19.domain;

import static org.junit.Assert.*;

import org.junit.Test;

public class QuestionnaireListTest {

	@Test
	public void testGetandSetId() {
		QuestionnaireList questionnaireList = new QuestionnaireList();
		String idString =questionnaireList.getId();
		assertEquals(null, idString);
		questionnaireList.setId("1");
		assertEquals("1", questionnaireList.getId());
	}
	
	
	@Test
	public void testGetandSetquestionnaireid() {
		QuestionnaireList questionnaireList = new QuestionnaireList();
		String idString =questionnaireList.getQuestionnaireid();
		assertEquals(null, idString);
		questionnaireList.setQuestionnaireid("1");
		assertEquals("1", questionnaireList.getQuestionnaireid());
	}
	
	
	@Test
	public void testGetandSetdescriptions() {
		QuestionnaireList questionnaireList = new QuestionnaireList();
		String description =questionnaireList.getDescriptions();
		assertEquals(null, description);
		questionnaireList.setDescriptions("des");
		assertEquals("des", questionnaireList.getDescriptions());
	}
	
	@Test
	public void testGetandSetvalues() {
		QuestionnaireList questionnaireList = new QuestionnaireList();
		String values =questionnaireList.getValues();
		assertEquals(null, values);
		questionnaireList.setValues("values");
		assertEquals("values", questionnaireList.getValues());
	}
	
	
	@Test
	public void testGetandSettostring() {
		QuestionnaireList qList  = new QuestionnaireList("1", "1", "des", "value");
		assertEquals("QuestionnaireList [id=1, questionnaireid=1, descriptions=des, values=value]", qList.toString());
		
	}




}
