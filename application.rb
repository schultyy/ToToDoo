require 'lotus'
require 'lotus/model'

module ToDo
  class Application < Lotus::Application
    configure do
      routes do
        get '/', to: 'home#index' #leitet es an server und zurück zum browser
        post '/', to: 'home#index'
        get '/impressum', to: 'imprint#page'
      end

      load_paths << [
        'controllers',
        'models',
        'views',
        'repositories'
      ]
      layout :application
    end

    load!
  end

  CONNECTION_URI = "sqlite://#{__dir__}/test.db"
  Lotus::Model.configure do
    adapter type: :sql, uri: CONNECTION_URI

  mapping do
    collection :task do
    entity     ToDo::Models::Task
    repository ToDo::Repositories::TaskRepository

    attribute :id, Integer
    attribute :name, String
   end
 end
end

Lotus::Model.load!
end
