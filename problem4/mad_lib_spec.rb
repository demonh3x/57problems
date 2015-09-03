RSpec.describe 'Mad lib' do
  let (:mad_lib) { IO.popen('runhaskell mad_lib.hs', 'r+') }

  it 'asks for a noun' do
    expect(mad_lib.readline).to include("Enter a noun:")
  end

  it 'asks for a verb' do
    mad_lib_puts('::noun::')
    expect(mad_lib.readline).to include("Enter a verb:")
  end

  it 'asks for an adjective' do
    mad_lib_puts('::noun::', '::verb::')
    expect(mad_lib.readline).to include("Enter an adjective:")
  end

  it 'asks for an adverb' do
    mad_lib_puts('::noun::', '::verb::', '::adjective::')
    expect(mad_lib.readline).to include("Enter an adverb:")
  end

  it 'Responds with the story' do
    mad_lib_puts('::noun::', '::verb::', '::adjective::', '::adverb::')
    expect(mad_lib.readline).to include("Do you ::verb:: your ::adjective:: ::noun:: ::adverb::? That's hilarious!")
  end

  def mad_lib_puts(*lines)
    lines.each do |line|
      mad_lib.readline
      mad_lib.puts(line)
    end
  end
end
