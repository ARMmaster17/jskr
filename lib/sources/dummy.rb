require "../source.rb"

class Dummy < Source
    def initialize()
        # Constructor for Source base class.
    end
    def authenticate()
        # No authentication is needed.
    end
    def pull_list()
        # Generate some fake models and push them to the RawPost table.
        p1 = RawPost.new do |p|
            p.title = "SQL Developer"
            p.company = "ABC Inc"
            p.source = "monster.com"
            p.description = "Reqs: SQL, C#, VB.NET and Python."
            p.url = "http://127.0.0.1/monster"
            p.save
        end
    end
end