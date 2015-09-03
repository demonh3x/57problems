RSpec.describe 'Saying hello' do
  let (:saying_hello) { IO.popen('runhaskell saying_hello.hs', 'r+') }

  it 'asks for the name' do
    expect(saying_hello.readline).to include("Hi there! What's your name?")
  end

  it 'responds greeting with the name' do
    saying_hello.readline
    saying_hello.puts('John')
    expect(saying_hello.readline).to include('Nice to meet you John!')
  end
end
