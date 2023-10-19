package runner;

import com.intuit.karate.junit5.Karate;

public class TestRunner {

    @Karate.Test
    Karate runTest(){
        return Karate.run("src/test/java/features");

        //.tags("@smoke");


    }

}
