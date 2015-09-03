RSpec.describe 'Count characters' do
  let (:count_characters) { IO.popen('runhaskell count_characters.hs', 'r+') }

  it 'asks for the the text' do
    expect(count_characters.readline).to include("What is the input text?")
  end

  it 'responds with the result' do
    count_characters.readline
    count_characters.puts('::text::')
    expect(count_characters.readline).to include("::text:: has 8 characters.")
  end
end
