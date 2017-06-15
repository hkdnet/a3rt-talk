module A3rt::Talk
  class Result
    attr_reader :perplexity
    attr_reader :reply

    def initialize(data)
      @perplexity = data['perplexity']
      @reply = data['reply']
    end
  end
end
