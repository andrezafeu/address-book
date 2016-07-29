class ContactsController < ApplicationController
	def index
		@contacts = Contact.order(name: :asc)
	end
	def new
	end
	def create
		contact = Contact.new(
			:name => params[:contact][:name],
			:address => params[:contact][:address],
			:phone => params[:contact][:phone],
			:email => params[:contact][:email]
			)
		contact.save
		redirect_to("/contacts")
	end
	def show
		contact_id = params[:id]
		@contact = Contact.find(contact_id)
	end
	def destroy
		@my_contact = Contact.find params[:id]
		if @my_contact.destroy
			flash[:notice] = "Your contact was deleted."
			redirect_to contacts_path
		else
			flash.now[:alert] = "There was an error deleting the contact. Please try again."
		end
	end	
end
