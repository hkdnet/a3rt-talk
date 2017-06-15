module A3rt::Talk
  class Response
    class Result
      attr_reader :perplexity
      attr_reader :reply

      def initialize(data)
        @perplexity = data['perplexity']
        @reply = data['reply']
      end
    end

    attr_reader :status
    attr_reader :message
    attr_reader :results
    def initialize(data)
      @status = data['status']
      @message = data['message']
      @results = data['results'].map { |e| Result.new(e) } if data['results']
    end
  end
end
