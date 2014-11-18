module ToDo
  module Controllers
    module Home
      include ToDo::Controller

      action 'Index' do
        expose :name

        def call(params)
          @name = params[:name]
        end
      end
    end
  end
end
