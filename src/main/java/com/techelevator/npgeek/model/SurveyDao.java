package com.techelevator.npgeek.model;

import java.util.List;

public interface SurveyDao {

	public void save(Survey survey);
	public List<Park> getSurveyResultParkName();
	
}
