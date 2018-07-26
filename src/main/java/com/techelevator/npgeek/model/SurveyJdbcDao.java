package com.techelevator.npgeek.model;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class SurveyJdbcDao implements SurveyDao {
	
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public SurveyJdbcDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	@Override
	public void save(Survey survey) {
		String sqlInsertSurvey = "INSERT INTO survey_result(parkcode, emailaddress, state, activitylevel) VALUES (?,?,?,?) RETURNING surveyid";
		long id = jdbcTemplate.queryForObject(sqlInsertSurvey, Long.class, survey.getParkCode(), survey.getEmail(), survey.getState(), survey.getActivityLevel());
		survey.setSurveyId(id);
	}
	@Override
	public List<Park> getSurveyResultParkName() {
		List<Park> surveyResultNames = new ArrayList<>();
		String sqlResultNames = "SELECT park.parkname, park.parkcode, COUNT(survey_result.parkcode) AS ranking "
								+ "FROM park JOIN survey_result ON park.parkcode = survey_result.parkcode "
								+ "GROUP BY survey_result.parkcode, park.parkname, park.parkcode "
								+ "ORDER BY COUNT(survey_result.parkcode) DESC, park.parkname ASC";	
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlResultNames);
		while (results.next()) {
			Park park = new Park();
			park.setRanking(results.getInt("ranking"));
			park.setParkName(results.getString("parkname"));
			park.setParkCode(results.getString("parkcode"));
			surveyResultNames.add(park);
		}
		return surveyResultNames;
	}
	


}
