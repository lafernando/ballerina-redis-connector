import ballerina/io;

public type RedisChannel object {

    private io:CharacterChannel? channel;
    private io:Socket client;

    new(string host, int port) {
        self.client = new();
        check client.connect(host, port);
        self.channel = new io:CharacterChannel(client.channel, "UTF-8");
    }

    public function getChannel() returns io:CharacterChannel {
        match (self.channel) {
            io:CharacterChannel ch => {
                return ch;
            }
            () => {
                error e;
                throw e;
            }
        }
    }

    public function command(string cmd, string... params) returns string {
        io:println("XXXX");
        any x = getChannel().write("SET A 1\n", 0);
        io:println(x);
        return "OK";
    }

    public function close() {
        check self.channel.close();
        check self.client.close();
        io:println("CLOSE");
    }

};