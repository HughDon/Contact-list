require 'csv'

class ContactDatabase
  def self.read_contacts
    CSV.foreach('contacts.csv') do |row|
      Contact.create(row[0], row[1], row[2])
    end
  end

  def self.write_contacts
    CSV.open('contacts.csv', 'w') do |csv_object|
      Contact.all.each do |contact|
        csv_object << [contact.name, contact.email, contact.phone_number]
      end
    end
  end
end