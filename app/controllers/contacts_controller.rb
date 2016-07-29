class ContactsController < ApplicationController
	def index
		@contacts = Contact.order(name: :asc)
	end
end
