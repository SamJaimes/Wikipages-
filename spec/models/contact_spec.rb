require 'rails_helper'

describe Contact do
  it 'should validate the presense of a name' do
    contact_name = Contact.new({:name => 'John'})
    contact_name.save
    expect(contact_name.name).to eq "John"
  end

  it "should have phones (maybe)" do
    aContact = Contact.create(:name => "J", :email => "s12e")
    aPhone = Phone.create(:number => "619")
    aContact.phones << aPhone
    aPhone2 = Phone.create(:number => "617")
    aContact.phones << aPhone2
    expect(aContact.phones.length).to eq 2
    #expect(aContact.phones[0]).to eq aPhone2
  end
end
