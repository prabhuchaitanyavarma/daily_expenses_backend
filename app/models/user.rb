class User < ActiveRecord::Base
	has_secure_password validations: false
	has_many :transactions
	after_create :set_authentication_token

	def set_authentication_token
		begin
		    self.authentication_token = SecureRandom.hex
		end while self.class.exists? authentication_token: authentication_token
		self.save(validate: false)
	end
end
