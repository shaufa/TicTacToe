class Player
    attr_accessor :name, :token, :score
    @@player_count = 0
    @@first_token = ""

    def self.count 
        @@player_count
    end

    def self.reset
        @@player_count = 0
    end

    def initialize (_name)
        if @@player_count < 2
            self.name = _name
            self.token = @@first_token == "" ? ["x", "o"].sample : ["x", "o"].difference([@@first_token])[0]
            self.score = 0
            @@first_token = self.token
            @@player_count += 1
        else
            puts "There are already two players, can't create more"
        end
    end
end
