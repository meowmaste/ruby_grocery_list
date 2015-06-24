require "./contact"

class AddressBook
  attr_reader :contacts


  def initialize
    @contacts = []
  end

  def print_contacts
    puts "Contact List"
    contacts.each do |contact|
      puts contact.to_s('last_first')
    end
  end
end

address_book = AddressBook.new

joslyn = Contact.new
joslyn.first_name = "Joslyn"
joslyn.last_name = "Rosbrook"
joslyn.add_phone_number("cell", "0666")
joslyn.add_phone_number("work", "1234")
joslyn.add_address("home", "123 Main St.", "", "Seattle", "WA", "98101")

address_book.contacts.push(joslyn)
address_book.print_contacts
