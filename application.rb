require 'lotus'

module ToDo
  class Application < Lotus::Application
    configure do
      routes do
        get '/', to: 'home#index' #leitet es an server und zurück zum browser
        post '/', to: 'home#index'
      end

      load_paths << [
        'controllers',
        'models',
        'views'
      ]
      layout :application
    end

    load!
  end
end
