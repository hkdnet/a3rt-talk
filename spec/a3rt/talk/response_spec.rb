describe A3rt::Talk::Response do
  let(:raw_success_response) do
    {
      'status' => 0,
      'message' => 'ok',
      'results' => [
        { 'reply' => 'test1', 'perplexity' => 1.2 },
        { 'reply' => 'test2', 'perplexity' => 0.2 },
      ],
    }
  end

  describe '#least_perplex' do
    let(:response) { A3rt::Talk::Response.new(raw_success_response) }
    subject { response.least_perplex }

    it 'returns the result with least perplex' do
      expect(subject).to have_attributes(reply: 'test2', perplexity: 0.2)
    end
  end
end
