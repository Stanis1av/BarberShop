class Admin::ContactsController < Admin::BaseController
  load_and_authorize_resource

  def index
    @contacts = Contact.all
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.valid?
      @contact.save
      redirect_to admin_contacts_path, notice: 'Сообщение успешно отправлено'
    else
      render action: 'new', alert: 'Не удалось отправить Сообщение'
    end
  end

  def edit
    @contact = Contact.find(params[:id])

    if @contact.valid? && @contact.save?
      redirect_to admin_contacts_path, notice: 'Сообщение успешно отредактированно'
    else
      render action: 'new', alert: 'Не удалось отредактировать сообщение'
    end
  end

  def update
  end

  def destroy
  end

  private

  def contact_params
    params.require(:contact).permit(
      )
  end
end
