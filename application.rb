require 'lotus'
require 'lotus/model'
require 'lotus/action/session'

module ToDo
  class Application < Lotus::Application
    configure do
      #Reihenfolge ist wichtig
      #Erste Route, die matcht, wird genommen
      routes do
        get '/', to: 'home#index' #leitet es an server und zurück zum browser
        post '/tasks/create',     to: 'home#create'
        post '/tasks/delete',     to: 'home#delete'
        get '/users/new',         to: 'users#new'  #Liefert das Registrierungsformular aus
        get '/users/signin',      to: 'users#signin'
        post '/users/create',     to: 'users#create' #sign up
        post '/sessions/create',  to: 'sessions#create'
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

      collection :users do
        entity      ToDo::Models::User
        repository  ToDo::Repositories::UserRepository

        attribute :id, Integer
        attribute :email, String
        attribute :password, String
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
