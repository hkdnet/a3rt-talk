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

  let(:raw_failure_response) do
    {
      'status' => 1001,
      'message' => 'apikey not found',
    }
  end

  describe '#least_perplex' do
    let(:response) { A3rt::Talk::Response.new(raw_success_response) }
    subject { response.least_perplex }

    it 'returns the result with least perplex' do
      expect(subject).to have_attributes(reply: 'test2', perplexity: 0.2)
    end
  end

  describe '#success?' do
    subject { response.success? }

    context 'when the response status is 0' do
      let(:response) { A3rt::Talk::Response.new(raw_success_response) }
      it { is_expected.to be_truthy }
    end

    context 'when the response status is not 0' do
      let(:response) { A3rt::Talk::Response.new(raw_failure_response) }
      it { is_expected.to be_falsy }
    end
  end
end
