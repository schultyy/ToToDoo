module ToDo
  module Controllers
    module Home
      include ToDo::Controller

      action 'Index' do
      expose :tasks

        def call(params)
          #puts params.inspect
          new_task = ToDo::Models::Task.new({name: params[:task]})
          if !new_task.name.nil? && !new_task.name.strip.empty?
          # Zeile 12: damit beim NeuLaden und bei Leerzeichen kein neuer Punkt erscheint
          # .strip: entfernt Leerzeichen aus String
          ToDo::Repositories::TaskRepository.create(new_task)
          # aus repositories-task_repository.rb (Pfad)
        end
          
          @tasks = ToDo::Repositories::TaskRepository.all

          # Zeile 14: Befehl aus https://github.com/lotus/model -> repositories

          # Zeile 11: speichert die Eingabe 
          # vor Task den Pfad angeben

          # Zeile 10-15: ein task = Eingabe Nutzer
          # Zeile 19: tasks aus der Datenbank (Mehrzahl)
          # auch ändern in apllication.rb -> collection :tasks do
          # und setup.rb -> database.create_table! :tasks do 

          #puts @task.inspect
        end

      end
    end
  end
end
