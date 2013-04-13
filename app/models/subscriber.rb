Sequel::Model.plugin :validation_helpers

class Subscriber < Sequel::Model

  def validate
    validates_presence(:name)
    validates_presence(:email)
    validates_unique(:email) unless email.empty?
    validates_format(/^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :email) unless email.empty?
  end

  def self.find_by_email(email)
    first(email: email)
  end

end
