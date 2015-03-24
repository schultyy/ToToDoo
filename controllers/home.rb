require 'lotus/action/session'

module ToDo
  module Controllers
    module Home
      include ToDo::Controller

      action 'Index' do
        include Lotus::Action::Session
        expose :tasks
        expose :user

        def call(params)
          user_id = session[:user]
          puts "SESSION: #{user_id}"
          if params[:newest]
            @tasks = ToDo::Repositories::TaskRepository.latest_tasks(user_id)
          elsif params[:alphabetically]
            @tasks = ToDo::Repositories::TaskRepository.alphabetically(user_id)
          else
            @tasks = ToDo::Repositories::TaskRepository.for_user(user_id)
          end

          @user = ToDo::Repositories::UserRepository.by_id(session[:user])
        end
      end

      action "Create" do
        include Lotus::Action::Session

        def call(params)
          new_task = ToDo::Models::Task.new({
            name: params[:task],
            user_id: session[:user]
          })
          #
          if !new_task.name.nil? && !new_task.name.strip.empty?
            ToDo::Repositories::TaskRepository.create(new_task)
          end

          redirect_to "/"
        end

      end
      #CRUD
      #CREATE READ UPDATE DELETE
      #Separation of Concerns
      action 'Delete' do
        def call(params)
          task = ToDo::Repositories::TaskRepository.find(params[:task_id])
          ToDo::Repositories::TaskRepository.delete(task)
          redirect_to '/'
        end
      end
    end
  end
end
