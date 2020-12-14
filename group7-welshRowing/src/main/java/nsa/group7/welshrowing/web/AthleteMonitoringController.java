package nsa.group7.welshrowing.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
/**
 * Provides a set of methods for serving and handling Athlete data.
 */
@Controller
public class AthleteMonitoringController {

    @GetMapping("/coachdashboard/athletemonitoring")
    public String athleteMonitoring(){

        return "athleteMorningMonitoring";

    }



}
