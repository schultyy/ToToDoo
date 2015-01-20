module ToDo
  module Controllers
    module Sessions
      include ToDo::Controller

      action 'Create' do
        def call(params)
          user = ToDo::Repositories::UserRepository.find_by_email_and_password(params[:email], params[:password])
          if user.nil?
            #user not found
            redirect_to '/users/signin'
          else
            #found smth. \o/
          end
        end
      end
    end
  end
end
