module ToDo
  module Controllers
    module Home
      include ToDo::Controller

      action 'Index' do
      expose :task

        def call(params)
          #puts params.inspect
          @task = params[:task]
          #puts @task.inspect
        end

      end
    end
  end
end
