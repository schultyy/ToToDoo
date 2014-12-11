module ToDo
  module Controllers
    module Home
      include ToDo::Controller

      action 'Index' do
      expose :tasks

        def call(params)
          #puts params.inspect
          new_task = ToDo::Models::Task.new({name: params[:task]})
          ToDo::Repositories::TaskRepository.create(new_task)
          # aus repositories-task_repository.rb (Pfad)
          @tasks = ToDo::Repositories::TaskRepository.all

          # Zeile 14: Befehl aus https://github.com/lotus/model -> repositories

          # Zeile 12-13: speichert die Eingabe 
          # vor Task den Pfad angeben

          # Zeile 10-12: ein task = Eingabe Nutzer
          # Zeile 14: tasks aus der Datenbank (Mehrzahl)
          # auch ändern in apllication.rb -> collection :tasks do
          # und setup.rb -> database.create_table! :tasks do 
          #puts @task.inspect
        end

      end
    end
  end
end
