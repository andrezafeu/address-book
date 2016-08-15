class ContactsController < ApplicationController
	before_action :set_contact, only: [:show, :edit, :update, :destroy]
	def index
		@contacts = Contact.order(name: :asc)
	end
	def new
		@contact = Contact.new
	end
	def create
		@contact = Contact.new(contact_params)
		if @contact.save
			redirect_to contacts_path
		else
			render "new"
		end
	end
	def edit
	end
	def update
		if @contact.update(contact_params)
			flash[:notice] = "Your contact was updated!"
			redirect_to contacts_path
		else
			flash[:alert] = "There was an error updating the contact. Please try again."
			render "edit"
		end
	end
	def show
	end
	def destroy
		if @contact.destroy
			flash[:notice] = "Your contact was deleted."
			redirect_to contacts_path
		else
			flash.now[:alert] = "There was an error deleting the contact. Please try again."
		end
	end

	private
	def set_contact
		@contact = Contact.find(params[:id])
	end
	def contact_params
		params.require(:contact).permit(:name, :address, :phone, :email)
	end
end
