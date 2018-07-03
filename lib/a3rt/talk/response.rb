module A3rt::Talk
  class Response
    attr_reader :status
    attr_reader :message
    attr_reader :results
    def initialize(data)
      @status = data['status']
      @message = data['message']
      @results = data['results'].map { |e| Result.new(e) } if data['results']
    end

    def least_perplex
      results.min_by(&:perplexity)
    end

    # @see https://a3rt.recruit-tech.co.jp/product/talkAPI/
    def success?
      status == 0
    end
  end
end
