RSpec.describe Kovacs do
  it "has a version number" do
    expect(Kovacs::VERSION).not_to be nil
  end

  it "does something useful" do
    person = Kovacs.config do |a|
      a.surname = 'Doe'
    end.generate
    expect(person.surname).to eq('Doe')
  end
  
  it 'generates forename from resources randomly'
  it 'generates forename from specified string if string argument is given and forename equals to argument'
  it 'generates forename from specified nationality if symbol argument is given'
  it 'generates male forename if nationality and sex are specified'
  it 'generates forename chosen randomly one from the array of strings'
  it 'generates forename chosen randomly one of the nationalities from array of symbols'
  it 'generates female forename based on nationality chosen randomly from array of symbols'
end
