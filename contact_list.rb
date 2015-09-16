require_relative 'contact'                                              # Requiring contact.rb
require_relative 'contact_database'                                     # Requiring contact_database

class ContactList                                                       # Creating class ContactList
  
  def initialize                                                        # Initializing the read to input to write and read files in contact_database
    ContactDatabase.read_contacts
  end

  def run
    command = ARGV[0]                                                   
    case command
    when 'new' then new_command
    when 'list' then list_command
    when 'show' then show_command
    when 'find' then find_command
    else help_command
    end
  end

  def new_command
    print 'What is their email address? '
    email = $stdin.gets.chomp
    print 'What is the contact\'s name? '
    name = $stdin.gets.chomp
    print 'What is the contact\'s phone number? '
    phone_number = $stdin.gets.chomp 
    new_contact = Contact.create(name, email, phone_number)
    puts "Contact #{new_contact} has been created!"
    ContactDatabase.write_contacts
  end

  def list_command
    Contact.all.each_with_index do |contact, index|
      puts "#{index + 1}: #{contact}"
    end
    puts "---\n#{Contact.all.length} records total"
  end

  def show_command
    contact = Contact.show(ARGV[2].to_i - 1)
    if contact
      puts "Name: #{contact.name}"
      puts "Email: #{contact.email}"
      puts "Phone number: #{contact.phone_number}"
    else
      puts 'Not found'
    end
  end

  def find_command
    Contact.find(ARGV[2]).each do |contact|
      puts contact
    end
  end

  def help_command
    puts 'Here is a list of available commands:
      new  - Create a new contact
      list - List all contacts
      show - Show a contact
      find - Find a contact'
  end

end

ContactList.new.run

# .detect
# .inspect
# .select

