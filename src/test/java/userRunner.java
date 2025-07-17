import com.intuit.karate.junit5.Karate;

public class userRunner {
    @Karate.Test
    Karate testGetUsers() {
        return Karate.run("classpath:features/getUsers.feature");
    }

    @Karate.Test
    Karate testPostUser() {
        return Karate.run("classpath:features/postUser.feature");
    }

    @Karate.Test
    Karate testGetUserId() {
        return Karate.run("classpath:features/getUserId.feature");
    }

    @Karate.Test
    Karate testPutUserId() {
        return Karate.run("classpath:features/putUserId.feature");
    }


    @Karate.Test
    Karate testDeleteUserId() {
        return Karate.run("classpath:features/deleteUserId.feature");
    }

}
