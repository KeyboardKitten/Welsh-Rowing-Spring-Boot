package nsa.group7.welshrowing.server;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.web.servlet.MockMvc;


import static org.hamcrest.Matchers.containsString;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@AutoConfigureMockMvc
@SpringBootTest
public class ApplicantListTests {

    @Autowired
    private MockMvc mockMvc;


    @Test
    public void shouldGetApplicantList() throws Exception {

        this.mockMvc
                .perform(get("/applicants"))
                .andDo(print())
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("Applicant List")))
                .andExpect(content().string(containsString("Application Status")));
    }
}
