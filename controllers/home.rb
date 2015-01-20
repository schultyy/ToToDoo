module ToDo
  module Controllers
    module Home
      include ToDo::Controller

      action 'Index' do
        expose :tasks

        def call(params)
          if params[:newest]
            @tasks = ToDo::Repositories::TaskRepository.latest_tasks
          elsif params[:alphabetically]
            @tasks = ToDo::Repositories::TaskRepository.alphabetically
          else
            @tasks = ToDo::Repositories::TaskRepository.all
          end
        end
      end

      action "Create" do

        def call(params)
          new_task = ToDo::Models::Task.new({name: params[:task]})
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
