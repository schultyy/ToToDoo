module ToDo
  module Controllers
    module Sessions
      include ToDo::Controller

      action 'Create' do
        def call(params)
          puts "TEST"
        end
      end
    end
  end
end
