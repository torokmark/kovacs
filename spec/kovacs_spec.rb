RSpec.describe Kovacs do
  it "has a version number" do
    expect(Kovacs::VERSION).not_to be nil
  end

  it "does something useful" do
    name = Kovacs.config do |a|
      a.family =  '' 
    end
    expect(name.generate).to eq('too')
  end

  it 'generates a name out of nationality if it is a string'
  it 'generates a name out of nationality if it is a symbol'
  it 'generates a name out of one of the nationalities if it is an array of strings'
  it 'generates a name out of one of the nationalities if it is an array of symbols'
  it 'takes the value of string for family name if its type is string and generates the rest from nationality'
  it 'generates family name if family name is a symbol identifies a nationality and rest is generated from nationality'
  it 'generates a female forename if gender is set to female'
end
