

class Contact                                                           # Creates class contact

  attr_accessor :name, :email, :phone_number                                           # Assigning to attributes to be accessed

  def initialize(name, email, phone_number)                                           # Initializing instance variables variables
    @name = name
    @email = email
    @phone_number = phone_number[]
  end

  def to_s
    "#{@name} <#{@email} :#{@phone_number}>"                                              # Changing name and email to string
  end

  ## Class Methods
  class << self                                                         # Class methods 'self' inside class.Contact to interperate userInput 
    @@contacts = []

    def create(name, email, phone_number)
      new_contact = Contact.new(name, email, phone_number)
      @@contacts << new_contact
      @@contacts.length
    end

    def find(term)
      @@contacts.select do |contact|
        contact.name.include?(term) || contact.email.include?(term) || contact.phone_number.include?(term)
      end
    end

    def all
      @@contacts
    end

    def show(id)
      @@contacts[id]
    end

  end

end