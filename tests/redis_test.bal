import ballerina/test;
import ballerina/io;
import laf/redis;

documentation {
   Before Suite Function can be used to start the service
}
@test:BeforeSuite
function beforeSuiteFunc () {
    io:println("Start Redis Test!");
}

documentation {
   Test function
}
@test:Config
function testFunction () {
    endpoint redis:Client conn {
        host: "localhost",
        password: "",
        options: { connectionPooling: true, isClusterConnection: false, ssl: false,
            startTls: false, verifyPeer: false, connectionTimeout: 500 }
    };
    _ = conn->echo("X");
    _ = conn->close();
    io:println(conn);
}

documentation {
   After Suite Function is used to stop the service
}
@test:AfterSuite
function afterSuiteFunc () {
    io:println("Stop Redis Test!");
}