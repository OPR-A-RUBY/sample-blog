class ContactsController < ApplicationController

  def new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.valid?
      @contact.save
    else
      render action: 'new'
    end  
  end

  private  # Ниже будут храниться спрятанные (privat) методы, которые могут быть вызваны только из методов выше. Эти спрятанные методы не доступны извне. Это в том числе сделано для безопасности. 

  def contact_params
    params.require(:contact).permit(:email, :message)
    # параметры.требуется(:контакт).разрешать(:электронную почту, :сообщение)
  end

end
