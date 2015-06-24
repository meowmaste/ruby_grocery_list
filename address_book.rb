require "./contact"

class AddressBook
  attr_reader :contacts


  def initialize
    @contacts = []
  end

  def print_results(search, results)
    puts search
    results.each do |contact|
      puts contact.to_s('full_name')
      contact.print_phone_numbers
      contact.print_addresses
      puts "\n"
    end
  end

  def find_by_name(name)
    results = []
    search = name.downcase
    contacts.each do |contact|
      if contact.full_name.downcase.include?(search)
        results.push(contact)
      end
    end
    print_results("Name search results (#{search})", results)
  end

  def find_by_phone_number(number)
    results = []
    search = number.gsub("-", "")
    contacts.each do |contact|
      contact.phone_numbers.each do |phone_number|
        if phone_number.number.gsub("-", "")
          results.push(contact) unless results.include?(contact)
        end
      end
    end
    print_results("Phone Number Search Results (#{search})", results)
  end

  def find_by_address(query)
    results = []
    search = query.downcase
    contacts.each do |contact|
      contact.addresses.each do |address|
        if address.to_s('long').downcase.include?(search)
          results.push(contact) unless results.include?(contact)
        end
      end
    end
    print_results("Address search results (#{search})", results)
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

luna = Contact.new
luna.first_name = "Luna"
luna.last_name = "Rosbrook"
luna.add_phone_number("cell", "123456")
luna.add_address("home", "123 Main St.", "", "Seattle", "WA", "98101")

address_book.contacts.push(joslyn)
address_book.contacts.push(luna)
#address_book.print_contacts

#address_book.find_by_name("l")
#address_book.find_by_phone_number("6")
address_book.find_by_address("Main")
