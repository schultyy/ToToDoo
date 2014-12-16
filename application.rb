require 'lotus'
require 'lotus/model'

module ToDo
  class Application < Lotus::Application
    configure do
      routes do
        get '/', to: 'home#index' #leitet es an server und zurück zum browser
        post '/tasks/create', to: 'home#create'
        post '/tasks/delete', to: 'home#delete'
        # Reihenfolge wichtig, da er von oben nach unten durchsucht und ausführt
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
    collection :tasks do
    entity     ToDo::Models::Task
    repository ToDo::Repositories::TaskRepository

    attribute :id, Integer
    attribute :name, String
   end
 end
end

Lotus::Model.load!
end

def h(text)
  Rack::Utils.escape_html(text)
  # ersetzt spitze KLammern <...> damit User keine Anwendungen starten kann
  # = Input bereinigen
  # Methode wird bei home-index.html.erb aufgerufen
end
