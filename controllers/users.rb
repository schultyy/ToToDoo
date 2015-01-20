module ToDo
  module Controllers
    module Users
      include ToDo::Controller

      action 'New' do
        def call(params)
        end
      end

      action 'Create' do
        def call(params)
          # Hier wird ein neues Userobjekt angelegt
          new_user = ToDo::Models::User.new({
            email: params[:email], #params[:email] => benutzereingabe im formular
            password: params[:password], #params[:password] => benutzereingabe im formular
          })
          #Userobjekt in der Datenbank speichern
          ToDo::Repositories::UserRepository.create(new_user)
          redirect_to '/' #nach dem anlegen wieder auf die hauptseite verweisen
        end
      end
    end
  end
end
