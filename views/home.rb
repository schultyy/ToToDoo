module ToDo
  module Views
    module Home
      class Index
        include ToDo::View

     def aufgabenliste
          if task
            "{task}!"
          else
            "nothing else to do?"
          end
        end

      end
    end
  end
end
