describe A3rt::Talk::Response do
  subject { A3rt::Talk::Response.new(raw_response) }

  let(:raw_response) do
    {
      'status' => 0,
      'message' => 'ok',
      'results' => [
        { 'reply' => 'test1', 'perplexity' => 1.2 },
        { 'reply' => 'test2', 'perplexity' => 0.2 },
      ],
    }
  end

  it do
    least = subject.least_perplex
    expect(least.reply).to eq 'test2'
  end
end
