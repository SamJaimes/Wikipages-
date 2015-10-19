require 'rails_helper'

describe Phone do
  it "has a contact" do
    aContact = Contact.new
    aPhone = Phone.new(:number => "234")
    aPhone.contact = aContact
    aPhone.save
    expect(aPhone.contact).to eq aContact
  end
end
