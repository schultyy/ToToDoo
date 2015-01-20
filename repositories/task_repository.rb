
module ToDo
	module Repositories
		class TaskRepository
			include Lotus::Repository

			# Sortiermethoden 1. das letzte zum Schluss / 2.Alphabetisch
			def self.latest_tasks
				query do 
          #sort descending by id
					desc(:id)
				end
			end

			def self.alphabetically
				query do
          #sort name ascending
					asc(:name)
				end
			end
		end
	end
end

#repo = ToDo::Repositories::TaskRepository.new

#exemple
#repo.all
#repo.find (5)
#repo.first
#repo.later
#repo.clear
