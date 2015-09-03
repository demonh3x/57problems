RSpec.describe 'Printing quotes' do
  let (:printing_quotes) { IO.popen('runhaskell printing_quotes.hs', 'r+') }

  it 'asks for the quote' do
    expect(printing_quotes.readline).to include("What is the quote?")
  end

  it 'asks for the author' do
    printing_quotes.readline
    printing_quotes.puts('::quote::')
    expect(printing_quotes.readline).to include("Who said it?")
  end

  it 'responds with the full quote' do
    printing_quotes.readline
    printing_quotes.puts('::quote::')
    printing_quotes.readline
    printing_quotes.puts('::author::')
    expect(printing_quotes.readline).to include('::author:: says, "::quote::"')
  end
end
