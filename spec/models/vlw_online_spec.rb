require 'vlw_online'

RSpec.describe VlwOnline, "#youth" do
  isU20_20000101 = VlwOnline.belongs_to_youth(:u20,Date.new(2000,1,1))
  isU20_19981231 = VlwOnline.belongs_to_youth(:u20,Date.new(1998,12,31))
  isU18_20011231 = VlwOnline.belongs_to_youth(:u18,Date.new(2001,12,31))
  isU18_20020417 = VlwOnline.belongs_to_youth(:u18,Date.new(2002,04,17))
  isU16_20041231 = VlwOnline.belongs_to_youth(:u16,Date.new(2004,12,31))
  isU16_20080808 = VlwOnline.belongs_to_youth(:u16,Date.new(2008,8,8))

  it 'checks belonging to youth classes correctly' do
    expect(isU20_20000101).to eq true
    expect(isU20_19981231).to eq false
    expect(isU18_20011231).to eq false
    expect(isU18_20020417).to eq true
    expect(isU16_20041231).to eq true
    expect(isU16_20080808).to eq true
  end

  closingDates2020 = {
    :u12 =>     Date.new(2010,1,1),
    :u13 =>     Date.new(2009,1,1),
    :u14 =>     Date.new(2008,1,1),
    :u15midi => Date.new(2007,1,1),
    :u16 =>     Date.new(2006,1,1),
    :u17midi => Date.new(2005,1,1),
    :u18 =>     Date.new(2004,1,1),
    :u20 =>     Date.new(2001,1,1)
  }

  it 'returns correct closing dates for given year ' do
    expect(VlwOnline.youth_closing_dates(2020)).to eq closingDates2020
  end
end
