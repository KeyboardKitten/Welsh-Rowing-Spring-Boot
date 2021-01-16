package nsa.group7.welshrowing;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.TestPropertySource;

@TestPropertySource(locations = "classpath:application-prod.properties")
@SpringBootTest
class WelshRowingProjectApplicationTests {

    @Test
    void contextLoads() {
    }

}
