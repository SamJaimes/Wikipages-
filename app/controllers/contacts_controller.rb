class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
    @contact = Contact.new()
    render('contacts/index.html.erb')
  end

  def show
    @contact = Contact.find(params[:id])
    render('contacts/show.html.erb')
  end

  # def new
  #   @contact = Contact.new
  #   render('contacts/new.html.erb')
  # end

  def create
    @contact = Contact.new(params[:contact])

    @contact.save
    if @contact.errors.any?
      @errors = @contact.errors
    end

    @phone = Phone.new
    @phone.number = params[:number]
    @phone.contact = @contact
    @phone.save
    if @phone.errors.any?
      if @errors.nil?
        @errors = @phone.errors
      else
        # TODO: fix me - only showing phone errors
        @errors = @phone.errors
      end
    end

    if !@errors.nil? && !@errors.any?
      render('contacts/new.html.erb')
    else
      render('contacts/success.html.erb')

    end
  end

  def edit
    @contact = Contact.find(params[:id])
    render('contacts/edit.html.erb')
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update(params[:contact])
      flash[:notice] = "Contact Updated"
      render('contacts/success.html.erb')
    else
      render('contacts/edit.html.erb')
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    render('contacts/destroy.html.erb')
  end

end
