class Source
    def initialize()
        # Constructor for Source base class.
    end
    def authenticate()
        # Authenticate to whatever service this object is connected to. Should set api_token class variable.
    end
    def pull_list()
        # Pull a list of job listings and store them in the RawPost table.
    end
end