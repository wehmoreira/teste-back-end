require 'rails_helper'

describe TrackerDecorator do
  let(:tracker) { TrackerDecorator.new(build_stubbed(:tracker)) }
  it 'formata o datetime em `dd/mm/AAAA HH:MM:SS`' do
    expect(tracker.format_datetime).to match(/\d\d\/\d\d\/20\d\d - \d\d:\d\d:\d\d/)
  end
end
