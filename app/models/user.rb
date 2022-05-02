class User < ApplicationRecord
  validates_presence_of :email, :name
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: 'invalid' },
                    uniqueness: { case_sensitive: false },
                    length: { minimum: 4, maximum: 254 }

  def self.search(q)
    User.where("LOWER(name) like '%#{q.downcase}%' OR LOWER(email) like '%#{q.downcase}%'")
  end
end
