package com.techelevator.npgeek;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.techelevator.npgeek.model.Park;
import com.techelevator.npgeek.model.ParkDao;
import com.techelevator.npgeek.model.Survey;
import com.techelevator.npgeek.model.SurveyDao;
import com.techelevator.npgeek.model.Weather;
import com.techelevator.npgeek.model.WeatherDao;

@Controller
public class ParkController {
	
	@Autowired
	private ParkDao parkDao;
	
	@Autowired
	private SurveyDao surveyDao;
	
	@Autowired
	private WeatherDao weatherDao;
	
	@RequestMapping(path="/", method=RequestMethod.GET)
	public String showParks(ModelMap modelHolder) {
		modelHolder.put("parks", parkDao.getAllParks());
		
		return "/home";
	}
	
	@RequestMapping(path="/detail", method=RequestMethod.GET)
	public String showParkDetail(ModelMap modelHolder, @RequestParam String parkCode) {
		for(Park p : parkDao.getAllParkDetails()) {
			if(p.getParkCode().equals(parkCode)) {
				modelHolder.put("park", p);
			}
		}
		List<Weather> matchingWeather = new ArrayList<>();
		for(Weather w : weatherDao.getWeather()) {
			if(w.getParkCode().equals(parkCode)) {
				if(w.getFiveDayForecastValue() == 1) {
					matchingWeather.add(w);
				}
				else if(w.getFiveDayForecastValue() == 2) {
					matchingWeather.add(w);
				}
				else if(w.getFiveDayForecastValue() == 3) {
					matchingWeather.add(w);
				}
				else if(w.getFiveDayForecastValue() == 4) {
					matchingWeather.add(w);
				}
				else if(w.getFiveDayForecastValue() == 5) {
					matchingWeather.add(w);
				}
			}
			modelHolder.put("weather", matchingWeather);
		}
		
		return "/detail";
	}
	
	@RequestMapping(path="/survey", method=RequestMethod.GET)
	public String showSurveyForm() {
		
		return "/survey";
	}
	
	@RequestMapping(path="/detail", method=RequestMethod.POST)
	public String temperatureFormat(HttpSession session, @RequestParam Boolean isCelsius, @RequestParam String parkCode) {
		session.setAttribute("isCelsius", isCelsius);

		return "redirect:/detail?parkCode=" + parkCode;
	}
	
	@RequestMapping(path="/survey", method=RequestMethod.POST)
	public String submitSurvey(@RequestParam String parkname,
							  @RequestParam String email, 
							  @RequestParam String state, 
							  @RequestParam String activitylevel,
							  @RequestParam String submit,
							  HttpSession session,
							  RedirectAttributes flashScope
							  ) {
		Survey survey = new Survey();
		survey.setParkCode(parkname);
		survey.setEmail(email);
		survey.setState(state);
		survey.setActivityLevel(activitylevel);
		session.setAttribute("submit", submit);
		
		surveyDao.save(survey);
		flashScope.addFlashAttribute("message", "Thank you for taking the survey!");
		
		return "redirect:/surveyResult";
	}
	
	@RequestMapping(path="/surveyResult", method=RequestMethod.GET)
	public String surveyResults(ModelMap modelHolder) {
		modelHolder.put("rankednames", surveyDao.getSurveyResultParkName());
		
		return "/surveyResult";
	}

}
